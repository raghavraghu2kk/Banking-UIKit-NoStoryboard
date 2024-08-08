//
//  WeatherService.swift
//  Bankey
//
//  Created by Raghavendra Mirajkar on 03/08/24.
//

import Foundation

protocol WeatherServiceDelegate: AnyObject {
    func didFetchWeather(_ weather: Weather)
}

class WeatherService {
    var weather : Weather? = nil
    weak var delegate : WeatherServiceDelegate?
    
    func fetchWeather() {
        self.weather = Weather(city: "Surat", temp: 32.5, imageName: "sunset.fill")
        delegate?.didFetchWeather(weather!)
    }
}
