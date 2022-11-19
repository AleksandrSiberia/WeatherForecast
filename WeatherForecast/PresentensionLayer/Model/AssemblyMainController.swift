//
//  AssemblyMainController.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 18.11.2022.
//

import Foundation


class AssemblyMainController {

    static func setMainController(locationService: LocationService?, networkService: NetworkService ) -> MainViewController {

        let controller = MainViewController()

        controller.locationService = locationService
        controller.networkService = networkService

        controller.view.backgroundColor = .white
        return controller
    }
}
