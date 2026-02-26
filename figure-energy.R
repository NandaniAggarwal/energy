library(animint2)

energy <- data.frame(
  Year = 2012:2023,
  Solar = c(1, 2, 3, 5, 8, 12, 18, 25, 35, 45, 55, 70),
  Wind = c(20, 22, 25, 28, 32, 35, 38, 40, 42, 44, 46, 48),
  Hydro = c(38, 39, 40, 42, 43, 45, 46, 48, 49, 50, 52, 53),
  CO2 = c(2.1, 2.2, 2.3, 2.5, 2.7, 2.9, 3.1, 3.3, 3.5, 3.6, 3.7, 3.8),
  TotalPower = c(120, 125, 130, 138, 150, 165, 180, 195, 210, 230, 250, 275)
)


viz <- animint(
  
  solarplot = ggplot() +
    geom_line(aes(x = Year, y = Solar), data = energy, color = "orange", size = 1.5) +

    geom_vline(aes(xintercept = Year, key = Year), data = energy, 
               showSelected = "Year", color = "black", linetype = "dashed") +
    geom_point(aes(x = Year, y = Solar), data = energy, 
               color = "orange", size = 4, clickSelects = "Year"),
  
  windplot = ggplot() +
    geom_line(aes(x = Year, y = Wind), data = energy, color = "blue", size = 1.5) +

    geom_vline(aes(xintercept = Year, key = Year), data = energy, 
               showSelected = "Year", color = "black", linetype = "dashed") +
    geom_point(aes(x = Year, y = Wind), data = energy, 
               color = "blue", size = 4, clickSelects = "Year"),
  
  hydroplot = ggplot() +
    geom_line(aes(x = Year, y = Hydro), data = energy, color = "darkgreen", size = 1.5) +

    geom_vline(aes(xintercept = Year, key = Year), data = energy, 
               showSelected = "Year", color = "black", linetype = "dashed") +
    geom_point(aes(x = Year, y = Hydro), data = energy, 
               color = "darkgreen", size = 4, clickSelects = "Year"),
  
  co2plot = ggplot() +
    geom_line(aes(x = Year, y = CO2), data = energy, color = "red", size = 1.5) +

    geom_vline(aes(xintercept = Year, key = Year), data = energy, 
               showSelected = "Year", color = "black", linetype = "dashed") +
    geom_point(aes(x = Year, y = CO2), data = energy, 
               color = "red", size = 4, clickSelects = "Year"),
  
  scatter1 = ggplot() +
    geom_point(aes(x = Solar, y = TotalPower, key = Year), data = energy, 
               size = 5, color = "purple", clickSelects = "Year") +

    geom_text(aes(x = Solar, y = TotalPower, label = Year, key = Year), data = energy, 
              vjust = 0, showSelected = "Year"),
  
  scatter2 = ggplot() +
    geom_point(aes(x = Wind, y = TotalPower, key = Year), data = energy, 
               size = 5, color = "brown", clickSelects = "Year") +
 
    geom_text(aes(x = Wind, y = TotalPower, label = Year, key = Year), data = energy, 
              vjust = 0, showSelected = "Year"),
  
  duration = list(Year = 1000),
  time = list(variable = "Year", ms = 2000),
  selector = list(Year = 2012),
  title = "India Renewable Energy",
  source = "https://github.com/NandaniAggarwal/energy/blob/main/figure-energy.R"
)

viz

if(FALSE){
  animint2pages(viz, "energy-types-india-animation")
}
