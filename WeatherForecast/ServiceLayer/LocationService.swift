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

    var coreDataService: CoreDataService?


    lazy var locationManager = CLLocationManager()

    lazy var authorizationStatus = self.locationManager.authorizationStatus


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


            
            let latitude = currentLocation.coordinate.latitude
            let longitude = currentLocation.coordinate.longitude

            UserDefaults.standard.set(latitude, forKey: "latitude")
            UserDefaults.standard.set(longitude, forKey: "longitude")



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



    

    func getLocationCity(nameCity: String, completionHandler: @escaping (String) -> Void)  {

        let geocoder = CLGeocoder()

        geocoder.geocodeAddressString(nameCity) { placemark, error in

            if let error {
                print(error.localizedDescription)
                completionHandler("город не найден, попробуйте написать заново")

            }
            else {

                let latitude = placemark?[0].location?.coordinate.latitude
                let longitude = placemark?[0].location?.coordinate.longitude

                UserDefaults.standard.set(latitude, forKey: "latitude")
                UserDefaults.standard.set(longitude, forKey: "longitude")


                completionHandler("Город добавлен")

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


            if  UserDefaults.standard.string(forKey: "latitude") != nil &&  UserDefaults.standard.string(forKey: "longitude") != nil {

                self.coordinator?.showMainController()
            }


//            if self.coordinator?.coreDataService.getWeatherForecast(attribute: nil, value: nil) != nil {
//
//                self.coordinator?.showMainController()
//            }


        case .restricted:
            print("restricted")


        case .denied:

     //       print(UserDefaults.standard.string(forKey: "latitude"), UserDefaults.standard.string(forKey: "longitude"))

            if  UserDefaults.standard.string(forKey: "latitude") != nil &&  UserDefaults.standard.string(forKey: "longitude") != nil {

                self.coordinator?.showMainController()
            }
            else {
                self.coordinator?.showSetCityViewController()
            }
            print("denied")



        case .authorizedAlways:
            print("authorizedAlways")

            
        case .authorizedWhenInUse:


            self.getNameCurrentCityAndLocation() { string, clLocation in
            }

            print("👍 authorizedWhenInUse")

//            if  UserDefaults.standard.string(forKey: "latitude") != nil && UserDefaults.standard.string(forKey: "longitude") != nil {
//                UserDefaults.standard.removeObject(forKey: "latitude")
//                UserDefaults.standard.removeObject(forKey: "longitude")
//            }

           self.coordinator?.showMainController()



        @unknown default:
            print("unknown default")
        }
    }
}

