library(ggplot2)
library(animint2)

# India renewable energy dataset
energy <- data.frame(
  Year = 2012:2023,
  
  Solar = c(1,2,3,5,8,12,18,25,35,45,55,70),
  
  Wind = c(20,22,25,28,32,35,38,40,42,44,46,48),
  
  Hydro = c(38,39,40,42,43,45,46,48,49,50,52,53),
  
  CO2 = c(2.1,2.2,2.3,2.5,2.7,2.9,3.1,3.3,3.5,3.6,3.7,3.8),
  
  TotalPower = c(120,125,130,138,150,165,180,195,210,230,250,275)
)


viz <- animint(
  
  # GRAPH 1 Solar trend
  solarplot = ggplot(energy, aes(Year, Solar)) +
    geom_line(
      color="orange",
      size=1.5,
      help="Shows solar power growth in India"
    ) +
    geom_point(
      color="orange",
      size=4,
      title="Solar Power Data Points"
    ) +
    labs(
      x="Year",
      y="Solar Power (GW)"
    ),
  
  
  # GRAPH 2 Wind trend
  windplot = ggplot(energy, aes(Year, Wind)) +
    geom_line(
      color="blue",
      size=1.5,
      help="Shows wind power growth trend"
    ) +
    geom_point(
      color="blue",
      size=4,
      title="Wind Power Points"
    ) +
    labs(
      x="Year",
      y="Wind Power (GW)"
    ),
  
  
  # GRAPH 3 Hydro trend
  hydroplot = ggplot(energy, aes(Year, Hydro)) +
    geom_line(
      color="darkgreen",
      size=1.5,
      help="Shows hydro power generation trend"
    ) +
    geom_point(
      color="darkgreen",
      size=4,
      title="Hydro Power Points"
    ) +
    labs(
      x="Year",
      y="Hydro Power (GW)"
    ),
  
  
  # GRAPH 4 CO2 trend
  co2plot = ggplot(energy, aes(Year, CO2)) +
    geom_line(
      color="red",
      size=1.5,
      help="Shows CO2 emission trend"
    ) +
    geom_point(
      color="red",
      size=4,
      title="CO2 Data Points"
    ) +
    labs(
      x="Year",
      y="CO2 Emission"
    ),
  
  
  # GRAPH 5 Solar vs Total Power
  scatter1 = ggplot(energy, aes(Solar, TotalPower)) +
    geom_point(
      color="purple",
      size=4,
      help="Relation between Solar and Total Power"
    ) +
    geom_text(
      aes(label=Year),
      vjust=0,
      title="Year labels"
    ) +
    labs(
      x="Solar Power",
      y="Total Power"
    ),
  
  
  # GRAPH 6 Wind vs Total Power
  scatter2 = ggplot(energy, aes(Wind, TotalPower)) +
    geom_point(
      color="brown",
      size=4,
      help="Relation between Wind and Total Power"
    ) +
    geom_text(
      aes(label=Year),
      vjust=0,
      title="Year labels"
    ) +
    labs(
      x="Wind Power",
      y="Total Power"
    ),
  
  title = "India Renewable Energy Growth Interactive Dashboard",
  
  source =
    "https://github.com/NandaniAggarwal/energy/blob/main/figure-energy.R"
)

viz

if(FALSE){
  animint2pages(viz,"india-energy-animation")
}

