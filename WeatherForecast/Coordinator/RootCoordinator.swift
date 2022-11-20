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

    private let networkService = NetworkService()

    private weak var firstController: FirstController?

    private weak var mainController: MainViewController?



    func startCoordinator() -> UINavigationController {

        self.locationService.coordinator = self

        self.networkService.locationService = self.locationService

        self.locationService.networkService = self.networkService

        self.firstController = AssemblyFirstController.setFirstController(locationService: self.locationService)

        let navController = UINavigationController(rootViewController: self.firstController!)

        return navController
    }



    func showMainController() {
        print("🧭showSettingController")

        self.mainController = AssemblyMainController.setMainController(locationService: self.locationService, networkService: self.networkService )
        self.firstController?.navigationController?.pushViewController(self.mainController!, animated: true)


    }

    

}
