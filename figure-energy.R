library(animint2)

# 1. India renewable energy dataset
energy <- data.frame(
  Year = 2012:2023,
  Solar = c(1, 2, 3, 5, 8, 12, 18, 25, 35, 45, 55, 70),
  Wind = c(20, 22, 25, 28, 32, 35, 38, 40, 42, 44, 46, 48),
  Hydro = c(38, 39, 40, 42, 43, 45, 46, 48, 49, 50, 52, 53),
  CO2 = c(2.1, 2.2, 2.3, 2.5, 2.7, 2.9, 3.1, 3.3, 3.5, 3.6, 3.7, 3.8),
  TotalPower = c(120, 125, 130, 138, 150, 165, 180, 195, 210, 230, 250, 275)
)

# 2. Defining the Visualization
viz <- animint(
  
  # SOLAR PLOT: Lines/Points visible for all years; click to select
  solarplot = ggplot(energy, aes(x = Year, y = Solar)) +
    geom_line(color = "orange", size = 1.5) +
    geom_point(color = "orange", size = 4, clickSelects = "Year"),
  
  # WIND PLOT
  windplot = ggplot(energy, aes(x = Year, y = Wind)) +
    geom_line(color = "blue", size = 1.5) +
    geom_point(color = "blue", size = 4, clickSelects = "Year"),
  
  # HYDRO PLOT
  hydroplot = ggplot(energy, aes(x = Year, y = Hydro)) +
    geom_line(color = "darkgreen", size = 1.5) +
    geom_point(color = "darkgreen", size = 4, clickSelects = "Year"),
  
  # CO2 PLOT
  co2plot = ggplot(energy, aes(x = Year, y = CO2)) +
    geom_line(color = "red", size = 1.5) +
    geom_point(color = "red", size = 4, clickSelects = "Year"),
  
  # SCATTER 1
  scatter1 = ggplot(energy, aes(x = Solar, y = TotalPower)) +
    geom_point(size = 5, color = "purple", clickSelects = "Year") +
    geom_text(aes(label = Year), vjust = 0, showSelected = "Year"),
  
  # SCATTER 2
  scatter2 = ggplot(energy, aes(x = Wind, y = TotalPower)) +
    geom_point(size = 5, color = "brown", clickSelects = "Year") +
    geom_text(aes(label = Year), vjust = 0, showSelected = "Year"),
  
  # SETTINGS
  selector = list(Year = 2023), # Starts the dashboard on the year 2023
  title = "India Renewable Energy Interactive Dashboard",
  source = "https://github.com/NandaniAggarwal/energy/blob/main/figure-energy.R"
)

# 3. Render the visualization
viz

if(FALSE){
  animint2pages(viz, "energy-types-animation")
}
