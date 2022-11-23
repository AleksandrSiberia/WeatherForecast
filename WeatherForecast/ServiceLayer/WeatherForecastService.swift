//
//  WeatherForecastService.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 22.11.2022.
//

import Foundation

class WeatherForecastService {

    var coreDataService: CoreDataService?




    init() {

       
    }



    func getTodayForecast() -> [WeatherForecastCoreData]? {

        
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy-MM-dd"

        let todayDateString = dateFormatter.string(from: Date())


        print("1️⃣ today", todayDateString)

        let todayForecast = self.coreDataService?.getWeatherForecast(attribute: "date", value: todayDateString)

        

        return todayForecast
    }


}





//Wednesday, Sep 12, 2018           --> EEEE, MMM d, yyyy
//09/12/2018                        --> MM/dd/yyyy
//09-12-2018 14:11                  --> MM-dd-yyyy HH:mm
//Sep 12, 2:11 PM                   --> MMM d, h:mm a
//September 2018                    --> MMMM yyyy
//Sep 12, 2018                      --> MMM d, yyyy
//Wed, 12 Sep 2018 14:11:54 +0000   --> E, d MMM yyyy HH:mm:ss Z
//2018-09-12T14:11:54+0000          --> yyyy-MM-dd'T'HH:mm:ssZ
//12.09.18                          --> dd.MM.yy
//10:41:02.112                      --> HH:mm:ss.SSS
