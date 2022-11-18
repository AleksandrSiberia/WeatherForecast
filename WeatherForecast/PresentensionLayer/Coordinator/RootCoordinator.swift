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

    private weak var mainController: MainViewController?



    func startCoordinator() -> UINavigationController {

        self.locationService.coordinator = self

        self.firstController = AssemblyFirstController.setFirstController(locationService: self.locationService, coordinator: self)

        let navController = UINavigationController(rootViewController: self.firstController!)

        return navController
    }



    func showMainController() {
        print("🧭showSettingController")

        self.mainController = AssemblyMainController.setMainController(locationService: self.locationService)


        self.firstController?.navigationController?.pushViewController(self.mainController!, animated: true)


    }

    

}
