//
//  RootCoordinator.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 16.11.2022.
//

import Foundation
import UIKit




class RootCoordinator: CoordinatorProtocol {


    var locationService = LocationService()

    var networkService = NetworkService()

    var coreDataService = CoreDataService()

    var weatherForecastService = WeatherForecastService()



    private weak var firstController: FirstController?

    private weak var mainController: MainViewController?


    

    func startCoordinator() -> UINavigationController {




        self.locationService.coordinator = self

        self.locationService.coreDataService = self.coreDataService

        self.networkService.locationService = self.locationService

        self.locationService.networkService = self.networkService

        self.weatherForecastService.coreDataService = self.coreDataService


        print("📒", self.coreDataService.getFolder(name: "WeatherFolder")!)

        if let folder = self.coreDataService.getFolder(name: "WeatherFolder") {
            if folder.isEmpty == true {

                self.coreDataService.setFolder(name: "WeatherFolder")
            }
        }


        print("📡 >>>",
            self.coreDataService.getWeatherForecast(attribute: nil, value: nil)?.count,
              self.weatherForecastService.getTodayForecast()?.count)



        self.firstController = AssemblyFirstController.setFirstController(coordinator: self)

        let navController = UINavigationController(rootViewController: self.firstController!)

        return navController
    }




    
    func showMainController() {
        print("🧭 showSettingController")

        self.mainController = AssemblyMainController.setMainController(coordinator: self)

        self.firstController?.navigationController?.pushViewController(self.mainController!, animated: true)


    }

}
