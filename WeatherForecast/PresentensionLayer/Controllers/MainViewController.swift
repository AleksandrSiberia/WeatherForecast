//
//  MainViewController.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 18.11.2022.
//

import UIKit

class MainViewController: UIViewController {

    var locationService: LocationService?

    var networkService: NetworkService?

    override func viewDidLoad() {
        super.viewDidLoad()

    //    print(networkService?.url)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        print(self.networkService?.getURL())

        print("city", self.locationService?.currentCity)
        self.navigationItem.title = self.locationService?.currentCity
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    


}
