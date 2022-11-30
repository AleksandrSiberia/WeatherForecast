//
//  SettingService.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 30.11.2022.
//

import Foundation

final class SettingService {


    static var shared = SettingService()


    private init() {}


    func changeTemp(temp: Float?) -> String {

        if UserDefaults.standard.string(forKey: "switchTemp") == "C" || UserDefaults.standard.string(forKey: "switchTemp") == nil {

            let changeType = (temp ?? 273.0) - 273.0
            let roundTemp = round(changeType * 10.0) / 10.0
            let roundTempString = String(roundTemp)

            return roundTempString
        }


        
        if UserDefaults.standard.string(forKey: "switchTemp") == "F" {

            if let temp {

                let changeType = (temp * 1.8) - 459.7

                let roundTemp = round(changeType * 10.0) / 10.0
                let roundTempString = String(roundTemp)

                return roundTempString
            }

            else {
                return ""
            }
        }

        else {
            return ""
        }


    }






}
