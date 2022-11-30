//
//  SettingViewController.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 30.11.2022.
//

import UIKit

class SettingViewController: UIViewController {






    override func viewDidLoad() {
        super.viewDidLoad()


    }


    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.view.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)

    }



}
