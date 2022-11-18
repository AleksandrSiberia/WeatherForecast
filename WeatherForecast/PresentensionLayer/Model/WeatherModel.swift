//
//  WeatherModel.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 18.11.2022.
//

import Foundation


struct dayModel: Codable {

    var date: String


    enum CodingKeys: CodingKey {
        case date
    }
}



struct WeatherModel: Codable {

    var currentTemp: String
    var minTemp: String
    var maxTemp: String

    var sunrise: String
    var sunset: String
    var humidityAir: String
    var windSpeed: String

    var onTheSky: String


    enum CodingKeys: CodingKey {
        case currentTemp
        case minTemp
        case maxTemp
        case sunrise
        case sunset
        case humidityAir
        case windSpeed
        case onTheSky
    }



}
