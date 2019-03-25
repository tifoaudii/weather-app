//
//  Weather.swift
//  weather-app
//
//  Created by Tifo Audi Alif Putra on 25/03/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import Foundation

struct Weather {
    var city: String
    var temperature: String
    var weather: String
    var imageWeather: String
    
    init(city: String, temperature: String, weather: String, imageWeather: String) {
        self.city = city
        self.temperature = temperature
        self.weather = weather
        self.imageWeather = imageWeather
    }
}
