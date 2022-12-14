//
//  CoreDataService.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 18.11.2022.
//

import Foundation
import CoreData


class CoreDataService {


    lazy var persistentContainer: NSPersistentContainer = {

        var persistentContainer = NSPersistentContainer(name: "CoreDataModel")

        persistentContainer.loadPersistentStores { nsPersistentStoreDescription, error in
            if let error = (error as? NSError) {
                print(error, error.userInfo)
            }
        }

        persistentContainer.viewContext.automaticallyMergesChangesFromParent = true

        return persistentContainer
    }()


    lazy var backgroundContext = self.persistentContainer.newBackgroundContext()



    init() {

    }


    func saveBackgroundContext() {

        do {
            try self.backgroundContext.save()
        }
        catch {
            print("‼️ error self.backgroundContext.save", error.localizedDescription)
        }

    }



    func getFolder(name: String) -> [FolderCoreData]? {

        let request = FolderCoreData.fetchRequest()

        request.predicate = NSPredicate(format: "name == %@", name)

        do {
            let folder = try self.backgroundContext.fetch(request)
            return folder
        }

        catch {
            print("‼️ error self.backgroundContext.fetch", error.localizedDescription)
            return nil
        }
    }





    func setFolder(name: String) {

        let folder = FolderCoreData(context: self.backgroundContext)

        folder.name = name

        self.saveBackgroundContext()

    }




    func delateFolder(name: String) {

        if let folder = getFolder(name: name) {

            if folder.isEmpty == false {

                self.backgroundContext.delete(getFolder(name: name)![0])

                self.saveBackgroundContext()


            }
        }
    }




    func getWeatherForecast(attribute: String?, value: String?) -> [WeatherForecastCoreData]? {

        let request = WeatherForecastCoreData.fetchRequest()

        if let attribute, let value {

            request.predicate = NSPredicate(format: "\(attribute) contains %@", value)
        }

        do {
            let weatherForecast = try self.backgroundContext.fetch(request)
            return weatherForecast
        }
        catch {
            print("‼️ error self.backgroundContext.fetch(request)", error.localizedDescription)
            return nil
        }

    }
    



    func setWeatherForecast(weatherModel: WeatherModel) {

        self.delateFolder(name: "WeatherFolder")

        self.setFolder(name: "WeatherFolder")

        for date in weatherModel.dateAndTimeAllWeatherForecast {

            let weatherForecastCoreData = WeatherForecastCoreData(context: self.backgroundContext)

            weatherForecastCoreData.relationshipFolder = self.getFolder(name: "WeatherFolder")![0]

            weatherForecastCoreData.date = date.date
            weatherForecastCoreData.icon = date.weather[0].icon
            weatherForecastCoreData.descriptionWeather = date.weather[0].descriptionWeather
            weatherForecastCoreData.cloudsPercent = Int16(date.clouds.cloudsPercent)
            weatherForecastCoreData.degWind = Int16(date.wind.speedWind)
            weatherForecastCoreData.feelsLike = date.main.feelsLike
            weatherForecastCoreData.humidity = Int16(date.main.humidity)
            weatherForecastCoreData.temp = date.main.temp
            weatherForecastCoreData.tempMax = date.main.tempMax
            weatherForecastCoreData.tepmMin = date.main.tempMin
            weatherForecastCoreData.speedWind = date.wind.speedWind
            weatherForecastCoreData.dayOrNite = date.dayOrNite.pod

            weatherForecastCoreData.timezone = Int32(weatherModel.city.timezone)
            weatherForecastCoreData.sunset = Int32(weatherModel.city.sunset)
            weatherForecastCoreData.sunrise = Int32(weatherModel.city.sunrise)
            weatherForecastCoreData.nameCity = weatherModel.city.nameCity

            self.saveBackgroundContext()

        }
    }
}



