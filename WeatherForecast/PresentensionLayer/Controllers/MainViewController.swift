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

    var coreDataService: CoreDataService!



    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = self.locationService?.currentCity

        


    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    //    print(self.networkService?.getURL()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    


}
