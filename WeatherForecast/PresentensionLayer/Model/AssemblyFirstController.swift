//
//  AssamblyFirstController.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 16.11.2022.
//

import Foundation
import UIKit

class AssemblyFirstController {

    static func setFirstController(locationService: LocationService?, coordinator: RootCoordinator?) -> FirstController {

        let controller = FirstController()

        controller.locationService = locationService
      

        controller.view.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)
        controller.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)

        return controller
    }
}
