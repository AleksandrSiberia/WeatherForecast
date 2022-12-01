//
//  RootCoordinatorProtocol.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 16.11.2022.
//

import Foundation
import UIKit


protocol CoordinatorProtocol {

    var locationService: LocationService { get set }

    var networkService: NetworkService { get set }

    var coreDataService: CoreDataService { get set }

    var weatherForecastService: WeatherForecastService { get set }


    var dayDetailForecastController: DayDetailForecastViewController? { get set }

    var mainController: MainViewController? { get set }



    func startCoordinator() -> UINavigationController

    func showDayDetailForecastController()

    func showSetCityViewController()

    func showMainControllerFromSetCityViewController()

    func showMainController()

    func showSettingViewController()

    func showFirstController()

    func showOneDayDetailForecastViewController(day: Int)


    
 

}
