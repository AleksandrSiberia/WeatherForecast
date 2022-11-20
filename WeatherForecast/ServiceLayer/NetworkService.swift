//
//  NetworkServise.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 18.11.2022.
//

import Foundation


class NetworkService {


    var locationService: LocationService?


    init() {
     
    }


    func getURL() -> String {

        guard self.locationService?.currentLatitude != nil &&
              self.locationService?.currentLongitude != nil else { return "" }

        let latitude = String(describing: self.locationService!.currentLatitude!)
        let longitude = String(describing: self.locationService!.currentLongitude!)

        let url =  "https://api.openweathermap.org/data/2.5/forecast?lang=ru&lat=" + latitude + "&lon=" + longitude + "&appid=c6a8cb66ecd2502365bcc7589784a114"

        return url

    }


    func getData(completionHandler: @escaping (ArrayWeatherModel?) -> Void ) {

        let url = URL(string: self.getURL())



        let session = URLSession(configuration: .default)


        guard let url else {
            print("‼️ error url = nil")
            return
        }


        let task = session.dataTask(with: url) { data, urlResponse, error in


            if let error  {
                print(error)
                completionHandler(nil)
            }

            if (urlResponse as? HTTPURLResponse)?.statusCode != 200  {
                guard let urlResponse else {
                    print("urlResponse = nil")
                    return
                }
                print("StatusCode =", (urlResponse as! HTTPURLResponse).statusCode)
                completionHandler(nil)
            }

            guard let data else {
                print("Data = nill")
                return }

            do {
                let answer = try JSONDecoder().decode(ArrayWeatherModel.self, from: data)
                completionHandler(answer)
            }
            catch {
                print("‼️", error)
                completionHandler(nil)
                return
            }
        }
        task.resume()
    }

  


}
