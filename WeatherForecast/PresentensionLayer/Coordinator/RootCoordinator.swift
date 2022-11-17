//
//  RootCoordinator.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 16.11.2022.
//

import Foundation
import UIKit



class RootCoordinator: CoordinatorProtocol {
  



    private let locationService = LocationService()

    private weak var firstController: FirstController?



    func startCoordinator() -> UINavigationController {

        self.firstController = AssemblyFirstController.setFirstController(locationService: self.locationService)

        let navController = UINavigationController(rootViewController: self.firstController!)

        return navController
    }


    

}
