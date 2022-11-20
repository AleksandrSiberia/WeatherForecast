//
//  WeatherModel.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 18.11.2022.
//

import Foundation


struct MainWeatherModel: Codable {

    var temp: String
    var feelsLike: String
    var tempMin: String
    var tempMax: String
    var humidity: String

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case humidity
    }
}



struct ImageAndTextWeatherModel: Codable {

    var description: String
    var icon: String
}



struct CloudsWeatherModel: Codable {

    var all: String
}



struct WindWeatherModel: Codable {
    var speed: String
    var deg: String
}



struct DateWeatherModel: Codable {

    var main: MainWeatherModel
    var weather: ImageAndTextWeatherModel
    var clouds: CloudsWeatherModel
    var wind: WindWeatherModel
    var date: String

    private enum CodingKeys: String, CodingKey {
        case main
        case weather
        case clouds
        case wind
        case date = "dt_txt"
    }
}



struct ArrayWeatherModel: Codable {

    var date: [DateWeatherModel]

    enum CodingKeys: String, CodingKey {

        case date = "list"
    }
}








