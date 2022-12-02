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



    func changeSpeedWind(float: CFloat?) -> String {

        if UserDefaults.standard.string(forKey: "switchWind") == "Km" ||
            UserDefaults.standard.string(forKey: "switchWind") == nil {

            let speedString = String(float ?? 0) + " м/с"
            return speedString
        }


        if UserDefaults.standard.string(forKey: "switchWind") == "Mi" {

            if let float {
                let milesPerHour = String(round(float * 2.236936 * 10) / 10)  + " Ми/ч"

                return milesPerHour
            }
            else {
                return ""
            }
        }

        else {
            return ""
        }

    }


    func changeDate() -> String {

        let formatHour = UserDefaults.standard.string(forKey: "switchHour") ?? "HH"

        return formatHour
    }

}
