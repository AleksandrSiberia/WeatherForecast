//
//  File.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 27.11.2022.
//

import Foundation



class AssemblyDayDetailForecastController {


    static func getAssemblyDayDetailForecastController(coordinator: CoordinatorProtocol) -> DayDetailForecastViewController {

        let controller = DayDetailForecastViewController()

        controller.coordinator = coordinator

        return controller
    }
}
