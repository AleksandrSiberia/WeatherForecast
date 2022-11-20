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

    var coordinator: RootCoordinator?

    var networkService: NetworkService?

    lazy var locationManager = CLLocationManager()

    lazy var authorizationStatus = self.locationManager.authorizationStatus

    var currentLatitude: CLLocationDegrees?

    var currentLongitude: CLLocationDegrees?

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




    func getNameCurrentCityAndLocation(completion: @escaping (String, CLLocation) -> Void) {


        let geocoder = CLGeocoder()

        if let currentLocation = self.locationManager.location {

            self.currentLatitude = currentLocation.coordinate.latitude
            self.currentLongitude = currentLocation.coordinate.longitude

            print(self.currentLatitude!, self.currentLongitude!)

            geocoder.reverseGeocodeLocation(currentLocation) { [weak self] placemark, error in
                if let error {
                    print(error.localizedDescription)
                }

                else {

                    if let firstLocation = placemark?[0],
                        let currentCity = firstLocation.locality {
                        
                        completion(currentCity, currentLocation)
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

            print("👍 authorizedWhenInUse")

            self.getNameCurrentCityAndLocation { nameCity, location in

                self.currentCity = nameCity

                self.networkService?.getData(completionHandler: { weatherModel in
                    print( weatherModel)
                })

                self.coordinator?.showMainController()
            }

        @unknown default:
            print("unknown default")
        }
    }
}

