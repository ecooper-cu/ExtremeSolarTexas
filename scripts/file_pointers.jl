SOURCE_DATA_DIR = "/projects/emco4286/data/sienna_data/input_data"
COST_FUNCTION_PATHS = joinpath(SOURCE_DATA_DIR, "Thermal", "cost_function_plots")
cost_function_file = joinpath(SOURCE_DATA_DIR, "Thermal", "cost_function_params.json")

JSON_SAVE_DIR = joinpath(homedir(), "ExtremeSolarTexas", "scripts", "jsons")

# Original Data Files
TAMU_matpower_file = joinpath(SOURCE_DATA_DIR, "ACTIVSg2000", "ACTIVSg2000.m")
TAMU_shp_file = joinpath(SOURCE_DATA_DIR, "ACTIVSg2000", "2000-bus-buses.shp")

# Mapping and Metadadata files
solar_metadata = joinpath(SOURCE_DATA_DIR, "Solar", "plant_metadata.csv")
hydro_mapping = joinpath(SOURCE_DATA_DIR, "Hydropower", "hydro_mapping.csv")
thermal_metada = joinpath(SOURCE_DATA_DIR, "Thermal", "thermal_metadata.csv")

# Time Series Files
wind_time_series_da = joinpath(SOURCE_DATA_DIR, "Wind", "wind_power_da.h5")
wind_time_series_ha = joinpath(SOURCE_DATA_DIR, "Wind", "wind_power_ha.h5")
wind_time_series_rt = joinpath(SOURCE_DATA_DIR, "Wind", "wind_power_rt.h5")

load_time_series_da = joinpath(SOURCE_DATA_DIR, "Load", "day_ahead_load_forecast.h5")
load_time_series_realtime =
    joinpath(SOURCE_DATA_DIR, "Load", "intra-hourly_load_forecast.h5")
load_time_series_realization = joinpath(SOURCE_DATA_DIR, "Load", "5-minute_load_actuals.h5")

perfect_load_time_series_da =
    joinpath(SOURCE_DATA_DIR, "Load", "day_ahead_perfect_load_forecast.h5")
perfect_load_time_series_realtime =
    joinpath(SOURCE_DATA_DIR, "Load", "intra-hourly_perfect_load_forecast.h5")

solar_time_series = joinpath(SOURCE_DATA_DIR, "Solar", "DA_time_series_files")

hydro_time_series = joinpath(SOURCE_DATA_DIR, "Hydropower","HYDRO")

hydro_time_series_da = joinpath(SOURCE_DATA_DIR, "Hydropower", "hydro_power_da.h5")
hydro_time_series_ha = joinpath(SOURCE_DATA_DIR, "Hydropower", "hydro_power_ha.h5")
hydro_time_series_rt = joinpath(SOURCE_DATA_DIR, "Hydropower", "hydro_power_rt.h5")

solar_time_series_realization = joinpath(SOURCE_DATA_DIR, "Solar")

# Thermal SCED files
thermal_sced_data = joinpath(SOURCE_DATA_DIR, "Thermal", "60d_SCED_Gen_Resource_Data.zip")
thermal_sced_h5_file = joinpath(SOURCE_DATA_DIR, "Thermal", "sced_data_full.h5")
thermal_mapping = joinpath(SOURCE_DATA_DIR, "Thermal", "thermal_mapping.csv")

# Reserve Requirements
reg_up_reserve_2016 = joinpath(SOURCE_DATA_DIR, "Reserves", "regup_2016.csv")
reg_dn_reserve_2016 = joinpath(SOURCE_DATA_DIR, "Reserves", "regdn_2016.csv")
spin_reserve = joinpath(SOURCE_DATA_DIR, "Reserves", "spin_2021.csv")
nonspin_reserve_2016 = joinpath(SOURCE_DATA_DIR, "Reserves", "nonspin_2016.csv")
reg_up_adjustment_solar = joinpath(SOURCE_DATA_DIR, "Reserves", "regup_solar_adjustment.csv")
reg_dn_adjustment_solar = joinpath(SOURCE_DATA_DIR, "Reserves", "regdn_solar_adjustment.csv")
reg_up_adjustment_wind = joinpath(SOURCE_DATA_DIR, "Reserves", "regup_wind_adjustment.csv")
reg_dn_adjustment_wind = joinpath(SOURCE_DATA_DIR, "Reserves", "regdn_wind_adjustment.csv")
nonspin_adjustment_solar = joinpath(SOURCE_DATA_DIR, "Reserves", "nonspin_solar_adjustment.csv")
nonspin_adjustment_wind = joinpath(SOURCE_DATA_DIR, "Reserves", "nonspin_wind_adjustment.csv")

# extracting_solar_forecasts.jl
HA_sys_UC_experiment_json = joinpath(SOURCE_DATA_DIR, "HA_sys_UC_experiment.json")
HA_sys_UC_experiment_h5 = joinpath(SOURCE_DATA_DIR, "HA_sys_UC_experiment_time_series_storage.h5")


# make_day_ahead_data.jl
blue_bell_pointer = joinpath(solar_time_series, "Blue Bell Solar II.h5")
scenario_31_members_pointer = joinpath(SOURCE_DATA_DIR, "Solar", "Trajectory forecasts -- 31 member 36 h horizon", "Day ahead solar 31 trajectory mean forecasts")
area_forecast_36h_pointer = joinpath(SOURCE_DATA_DIR, "Solar", "Trajectory forecasts -- 31 member 36 h horizon", "day_ahead_ERCOT132_31_trajectories.h5")
scenario_84_members_pointer = joinpath(SOURCE_DATA_DIR, "Solar", "Trajectory forecasts -- 84 member 30 h horizon", "Day ahead solar 84 trajectory mean forecasts")
area_forecast_84h_pointer = joinpath(SOURCE_DATA_DIR, "Solar", "Trajectory forecasts -- 84 member 30 h horizon", "day_ahead_ERCOT132_84_trajectories.h5")