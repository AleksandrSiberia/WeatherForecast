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


    func startCoordinator() -> UINavigationController

    func showDayDetailForecastController()


    func showSetCityViewController()


    
 

}
