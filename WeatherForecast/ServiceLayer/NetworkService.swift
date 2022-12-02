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



        if  let latitude = UserDefaults.standard.string(forKey: "latitude"), let longitude = UserDefaults.standard.string(forKey: "longitude")

        {
            let url =  "https://api.openweathermap.org/data/2.5/forecast?lang=ru&lat=" + latitude + "&lon=" + longitude + "&appid=c6a8cb66ecd2502365bcc7589784a114"

            return url
        }

        else {
            return ""
        }

    }
    



//        else {
//            // Иркутск по дефолту
//            let latitude = "52.2978"
//            let longitude = "104.296"
//
//            let url =  "https://api.openweathermap.org/data/2.5/forecast?lang=ru&lat=" + latitude + "&lon=" + longitude + "&appid=c6a8cb66ecd2502365bcc7589784a114"
//            return url
//        }




    func getData(completionHandler: @escaping (WeatherModel?) -> Void ) {

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
                let answer = try JSONDecoder().decode(WeatherModel.self, from: data)
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
