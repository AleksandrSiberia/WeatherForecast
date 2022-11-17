//
//  LocationService.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 16.11.2022.
//

import Foundation
import CoreLocation
import UIKit


final class LocationService: NSObject, CLLocationManagerDelegate {

    lazy var locationManager = CLLocationManager()


    lazy var authorizationStatus = self.locationManager.authorizationStatus {
        
        didSet {
            self.completion?(self)
            print("didSet")

        }
    }

    private var completion: ((LocationService) -> Void)?


    
    override init() {
        super.init()

        print(FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask))
        print(Bundle.main.bundleURL)

        setting()
    }




    func setting() {
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer

        if self.authorizationStatus != .notDetermined || self.authorizationStatus != .denied  {
                self.locationManager.startUpdatingLocation()
            }
    }


    func requestPermission() {

        if self.authorizationStatus == .notDetermined  {
            self.locationManager.requestWhenInUseAuthorization()
            }

        if  self.authorizationStatus == .denied  {
            if let appSettings = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(appSettings) {
                UIApplication.shared.open(appSettings)
            }
        }

    }



    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {

        switch self.locationManager.authorizationStatus {
        case .notDetermined:
            print("notDetermined")
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
        @unknown default:
            print("unknown default")
        }


        if self.authorizationStatus != .notDetermined || self.authorizationStatus != .denied  {
                self.locationManager.startUpdatingLocation()
            }


        self.authorizationStatus = self.locationManager.authorizationStatus

    }

}

