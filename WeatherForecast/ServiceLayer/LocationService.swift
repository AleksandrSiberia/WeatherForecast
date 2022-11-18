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

//    let dispatchQueue = DispatchQueue(label: "serial")

    var coordinator: RootCoordinator?

    lazy var locationManager = CLLocationManager()

    lazy var authorizationStatus = self.locationManager.authorizationStatus

    var currentLocation: CLLocation?

    lazy var currentLatitude: CLLocationDegrees? = self.currentLocation?.coordinate.latitude

    lazy var currentLongitude: CLLocationDegrees? = self.currentLocation?.coordinate.longitude

    lazy var currentCity: String? = nil




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




    func getNameCurrentCity(completion: @escaping (String) -> Void) {


        let geocoder = CLGeocoder()

        if let currentLocation = self.currentLocation {

            geocoder.reverseGeocodeLocation(currentLocation) { [weak self] placemark, error in
                if let error {
                    print(error.localizedDescription)
                }

                else {

                    if let firstLocation = placemark?[0],

                        let currentCity = firstLocation.locality {
                    //    self?.currentCity = currentCity
                        completion(currentCity)
                    }
                }
            }
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


        if self.authorizationStatus != .notDetermined || self.authorizationStatus != .denied  {

            self.locationManager.startUpdatingLocation()
            self.currentLocation = self.locationManager.location
        }



        self.authorizationStatus = self.locationManager.authorizationStatus


        switch self.locationManager.authorizationStatus {
        case .notDetermined:
            print("notDetermined")
        case .restricted:
            print("restricted")
        case .denied:
            self.coordinator?.showMainController()
            print("denied")
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:

                self.getNameCurrentCity { string in

                    self.currentCity = string

                    self.coordinator?.showMainController()
            }

        @unknown default:
            print("unknown default")
        }
    }
}

