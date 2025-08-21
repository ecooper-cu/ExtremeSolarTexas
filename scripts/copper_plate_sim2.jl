using Pkg
Pkg.activate("/projects/emco4286/software/julia/ErcotProject")

using PowerSystems, PowerSimulations, InfrastructureSystems, HydroPowerSimulations, StorageSystemsSimulations

const PSI = PowerSimulations
const PSY = PowerSystems
const IS = InfrastructureSystems

using Gurobi, JuMP

using DataFrames, Dates, Printf, Logging

file_dir = joinpath("/projects", "emco4286", "data", "sienna_data", "input", "da", "sys_da.json")
sys = System(file_dir)

set_available!.(get_components(EnergyReservoirStorage, sys), true)
set_available!.(get_components(ThermalMultiStart, sys), true)

PSY.transform_single_time_series!(sys, Hour(48), Hour(24))

solver = PSI.optimizer_with_attributes(Gurobi.Optimizer)
set_optimizer_attribute(solver, "MIPGap", 0.1)

template_uc = template_unit_commitment(network=NetworkModel(CopperPlatePowerModel;use_slacks = true))
set_device_model!(template_uc, ThermalMultiStart, ThermalStandardUnitCommitment)
set_device_model!(template_uc, ThermalStandard, ThermalStandardUnitCommitment)
set_device_model!(template_uc, RenewableDispatch, RenewableFullDispatch,) 
set_device_model!(template_uc, PowerLoad, StaticPowerLoad)

set_device_model!(template_uc, DeviceModel(Line, 
                                        StaticBranch; 
                                        use_slacks = true))

storage_model = DeviceModel(
    EnergyReservoirStorage,
    StorageDispatchWithReserves;
    attributes=Dict(
        "reservation" => true,
        "energy_target" => false,
        "cycling_limits" => false,
        "regularization" => true,
    ),
)
                                        
set_device_model!(template_uc, storage_model)

set_service_model!(template_uc, ServiceModel(VariableReserve{ReserveUp}, RangeReserve))
set_service_model!(template_uc, ServiceModel(VariableReserve{ReserveDown}, RangeReserve))

set_device_model!(template_uc, HydroDispatch, HydroDispatchRunOfRiver)

initial_date = "2018-08-01"
start_time =DateTime(string(initial_date,"T00:00:00"))
model = DecisionModel(template_uc, sys; name = "UC", optimizer = solver, horizon = Hour(24), calculate_conflict = true)
models = SimulationModels(; decision_models = [model])

steps_sim    = 1
current_date = string( today() )
sequence = SimulationSequence(
    models = models,
    # ini_cond_chronology = InterProblemChronology(),
)

output_dir = joinpath("/projects", "emco4286", "data", "sienna_data", "output", "ercot", "baseline")
sim = Simulation(
    name = current_date * "_DR-test" * "_" * string(steps_sim)* "steps",
    steps = steps_sim,
    models = models,
    initial_time = DateTime(string(initial_date,"T00:00:00")),
    sequence = sequence,
    simulation_folder = output_dir#".",
)

build!(sim)
execute!(sim)