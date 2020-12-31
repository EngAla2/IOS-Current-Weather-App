//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Ala'a Araishi on 12/28/20.
//

import Foundation

private let defaultIcon = "？"
private let iconMap = [
    "Drizzle": "🌨",
    "Rain": "☔️",
    "Snow": "☃️",
    "Clear": "☀️",
    "Clouds": "☁️",
    "Thunderstorm": "⛈",
]
public class WeatherViewModel: ObservableObject{
    @Published var cityName : String = "City Name"
    @Published var temperature : String = "--"
    @Published var weatherDiscreption : String = "--"
    @Published var weatherIcon : String = defaultIcon
    
    public let weatherService : WeatherService
    
    init(weatherService : WeatherService) {
        self.weatherService = weatherService
    }
    
    public func refresh(){
        weatherService.loadWeatherData { weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.temprature)°C"
                self.weatherDiscreption = weather.description.capitalized
                self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
            }
        }
    }
}
