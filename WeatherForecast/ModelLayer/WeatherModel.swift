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



struct DayOrNiteWeatherModel: Codable {

    var pod: String
}



struct ImageAndTextWeatherModel: Codable {

    var descriptionWeather: String
    var icon: String

    enum CodingKeys: String, CodingKey {

        case descriptionWeather = "description"
        case icon
    }
}



struct CloudsWeatherModel: Codable {

    var cloudsPercent: Int

    enum CodingKeys: String, CodingKey {

        case cloudsPercent = "all"
    }
}


struct WindWeatherModel: Codable {

    var speedWind: Float
    var degWind: Int

    enum CodingKeys: String, CodingKey {

        case speedWind = "speed"
        case degWind = "deg"
    }
}



struct DateWeatherModel: Codable {

    var main: MainWeatherModel
    var weather: [ImageAndTextWeatherModel]
    var clouds: CloudsWeatherModel
    var wind: WindWeatherModel
    var dayOrNite: DayOrNiteWeatherModel
    var date: String

    private enum CodingKeys: String, CodingKey {
        case main
        case weather
        case clouds
        case wind
        case dayOrNite = "sys"
        case date = "dt_txt"
    }
}



struct CityWeatherModel: Codable {

    var timezone: Int
    var sunrise: Int
    var sunset: Int
    var nameCity: String

    enum CodingKeys: String, CodingKey {
        case timezone
        case sunrise
        case sunset
        case nameCity = "name"
    }

}



struct WeatherModel: Codable {

    var dateAndTimeAllWeatherForecast: [DateWeatherModel]

    var city: CityWeatherModel

    enum CodingKeys: String, CodingKey {

        case dateAndTimeAllWeatherForecast = "list"
        case city
    }
}









