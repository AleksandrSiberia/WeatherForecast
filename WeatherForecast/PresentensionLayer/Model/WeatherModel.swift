//
//  WeatherModel.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 18.11.2022.
//

import Foundation


struct MainWeatherModel: Codable {

    var temp: Float
    var feelsLike: Float
    var tempMin: Float
    var tempMax: Float
    var humidity: Int

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

    var all: Int
}



struct WindWeatherModel: Codable {
    var speed: Float
    var deg: Int
}



struct DateWeatherModel: Codable {

       var main: MainWeatherModel
    var weather: [ImageAndTextWeatherModel]
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








