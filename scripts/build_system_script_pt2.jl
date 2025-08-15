using Pkg
Pkg.activate("/projects/emco4286/software/julia/ErcotProject")

cd("/home/emco4286/ExtremeSolarTexas/scripts")

using PowerFlows
include("file_pointers.jl")
include("system_build_functions.jl")
include("manual_data_entries.jl")

include("load_processing.jl")
include("wind_processing.jl")
include("hydro_processing.jl")

# sys = System("pre_thermal_sys.json")
include("incrementalpiecewise.jl")
# include("thermal_processing.jl")

configure_logging(file_level = Logging.Info, console_level = Logging.Info)


# to_json(sys, "intermediate_sys.json", force = true)
# to_json(sys, "post_thermal_sys.json", force = true)

# include("add_services.jl")

# write_lines_geo_data(sys, "line_coords_modified")
# write_gen_buses_geo_data(sys, "bus_gens_coords_modified")

# finalize_system(sys) 

sys = System("post_thermal_sys.json")

include("make_hour_ahead_data.jl")
include("make_day_ahead_data.jl")

to_json(sys_DA, "sys_da.json", force = true)
to_json(sys_base, "sys_rt.json", force = true)

# collect(get_components(x-> get_number(x) == 5262, ACBus, sys_DA))



