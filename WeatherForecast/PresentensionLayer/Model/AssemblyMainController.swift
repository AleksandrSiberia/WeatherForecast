//
//  AssemblyMainController.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 18.11.2022.
//

import Foundation


class AssemblyMainController {

    

    static func setMainController(coordinator: CoordinatorProtocol ) -> MainViewController {

        let controller = MainViewController()

        controller.coordinator = coordinator

        controller.view.backgroundColor = .white
        return controller
    }
}
