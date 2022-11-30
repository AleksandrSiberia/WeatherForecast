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



    weak var firstController: FirstController?

    weak var mainController: MainViewController?

    weak var setCityViewController: SetCityViewController?

    weak var dayDetailForecastController: DayDetailForecastViewController?

    weak var settingViewController: SettingViewController?




    func startCoordinator() -> UINavigationController {

        self.locationService.coordinator = self

        self.locationService.coreDataService = self.coreDataService

        self.networkService.locationService = self.locationService

        self.locationService.networkService = self.networkService

        self.weatherForecastService.coreDataService = self.coreDataService


        if let folder = self.coreDataService.getFolder(name: "WeatherFolder") {
            if folder.isEmpty == true {

                self.coreDataService.setFolder(name: "WeatherFolder")
            }
        }

        var controller = AssemblyFirstController.setFirstController(coordinator: self)

        self.firstController = controller

        let navController = UINavigationController(rootViewController: self.firstController!)

        return navController
    }




    
    func showMainController() {


        let controller =  AssemblyMainController.setMainController(coordinator: self)

        self.mainController = controller

        self.firstController?.navigationController?.pushViewController(self.mainController!, animated: false)
    }




    func showMainControllerFromSetCityViewController() {

        let controller =  AssemblyMainController.setMainController(coordinator: self)

        self.mainController = controller

        self.setCityViewController?.navigationController?.pushViewController(controller, animated: false)
    }



    
    func showSetCityViewController() {

        let controller = SetCityViewController()

        controller.coordinator = self

        self.setCityViewController = controller

        self.firstController?.navigationController?.pushViewController(self.setCityViewController!, animated: true)
    }




    func showFirstController() {

        let controller = AssemblyFirstController.setFirstController(coordinator: self)


        self.mainController?.navigationController?.pushViewController(controller, animated: true)
    }





    func showDayDetailForecastController() {



        let controller = AssemblyDayDetailForecastController.getAssemblyDayDetailForecastController(coordinator: self)

        self.dayDetailForecastController = controller

        self.mainController?.navigationController?.pushViewController( self.dayDetailForecastController!, animated: true)
    }


    

    func showSettingViewController() {

        let controller = SettingViewController()

        controller.coordinator = self

        self.settingViewController = controller

        self.mainController?.navigationController?.pushViewController(self.settingViewController!, animated: true)

    }

}
