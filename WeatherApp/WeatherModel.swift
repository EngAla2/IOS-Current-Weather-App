//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Ala'a Araishi on 12/28/20.
//

import Foundation

public struct Weather {

    let city : String
    let temprature : String
    let description : String
    let iconName : String
    
    init(response: APIResponse) {
        city = response.name
        temprature = "\(response.main.temp)"
        description = response.weather.first?.description ?? ""
        iconName = response.weather.first?.main ?? ""
    }

}
