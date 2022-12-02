//
//  AssamblyFirstController.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 16.11.2022.
//

import Foundation
import UIKit

class AssemblyFirstController {

    static func setFirstController(coordinator: CoordinatorProtocol) -> FirstController {

        let controller = FirstController()

        controller.coordinator = coordinator


        return controller
    }
}
