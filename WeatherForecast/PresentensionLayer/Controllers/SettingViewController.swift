//
//  SettingViewController.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 30.11.2022.
//

import UIKit

class SettingViewController: UIViewController {


    var coordinator: CoordinatorProtocol?


    lazy var viewCentre: UIView = {

        var viewCentre = UIView()
        viewCentre.backgroundColor = UIColor(named: "#E9EEFA")
        viewCentre.translatesAutoresizingMaskIntoConstraints = false
        viewCentre.layer.cornerRadius = 10
        return viewCentre
    }()



    private lazy var labelSetting: UILabel = {

        var labelSetting = UILabel()
        labelSetting.textColor = UIColor(named: "#272722")
        labelSetting.translatesAutoresizingMaskIntoConstraints = false
        labelSetting.font = UIFont(name: "Rubik-Medium", size: 18)
        labelSetting.numberOfLines = 0
        labelSetting.text = "Настройки"
        return labelSetting
    }()



    
    private lazy var switchTemp: UISwitch = {
        var switchTemp = UISwitch()
        switchTemp.translatesAutoresizingMaskIntoConstraints = false


        if UserDefaults.standard.string(forKey: "switchTemp") == "C" || UserDefaults.standard.string(forKey: "switchTemp") == nil {
            switchTemp.isOn = false
        }

        if UserDefaults.standard.string(forKey: "switchTemp") == "F" {
            switchTemp.isOn = true
        }


        let action = UIAction {_ in

            if self.switchTemp.isOn == false {
                UserDefaults.standard.set("C", forKey: "switchTemp")
            }

            if self.switchTemp.isOn == true {
                UserDefaults.standard.set("F", forKey: "switchTemp")
            }

            print("🏓", UserDefaults.standard.string(forKey: "switchTemp"))

            

            self.coordinator?.dayDetailForecastController?.reloadTableView()

            self.coordinator?.mainController?.reloadTableView()
        }

        switchTemp.addAction(action, for: .touchUpInside)








        return switchTemp
    }()



    private lazy var labelSettingTemp: UILabel = {

        var labelSettingTemp = UILabel()
        labelSettingTemp.textColor = UIColor(named: "#272722")
        labelSettingTemp.translatesAutoresizingMaskIntoConstraints = false
        labelSettingTemp.font = UIFont(name: "Rubik-Regular", size: 16)
        labelSettingTemp.numberOfLines = 0
        labelSettingTemp.text = "Темпиратура, C/F"
        return labelSettingTemp
    }()



    override func viewDidLoad() {
        super.viewDidLoad()

        [self.viewCentre, self.labelSetting, self.labelSettingTemp, self.switchTemp ].forEach { self.view.addSubview( $0 )}

        setupLayoutConstrains()
    }



    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.view.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)

    }



    func setupLayoutConstrains() {

        NSLayoutConstraint.activate([

            self.viewCentre.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 240),
            self.viewCentre.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 28),
            self.viewCentre.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -28),
            self.viewCentre.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -240),

            self.labelSetting.topAnchor.constraint(equalTo: self.viewCentre.topAnchor, constant: 27),
            self.labelSetting.leadingAnchor.constraint(equalTo: self.viewCentre.leadingAnchor, constant: 20),

            self.labelSettingTemp.topAnchor.constraint(equalTo: self.labelSetting.bottomAnchor, constant: 20),
            self.labelSettingTemp.leadingAnchor.constraint(equalTo: self.viewCentre.leadingAnchor, constant: 20),

            self.switchTemp.trailingAnchor.constraint(equalTo: self.viewCentre.trailingAnchor, constant: -20),
            self.switchTemp.centerYAnchor.constraint(equalTo: self.labelSettingTemp.centerYAnchor),


        ])
    }



}
