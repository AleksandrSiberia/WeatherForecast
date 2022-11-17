//
//  LocationService.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 16.11.2022.
//

import Foundation
import CoreLocation


final class LocationService: NSObject, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()

    override init() {
        super.init()
        setting()
    }

    func setting() {
        self.locationManager.delegate = self
    }

    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }

}

