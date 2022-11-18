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


    
}
