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



    private lazy var labelSettingTemp: UILabel = {

        var labelSettingTemp = UILabel()
        labelSettingTemp.textColor = UIColor(named: "#272722")
        labelSettingTemp.translatesAutoresizingMaskIntoConstraints = false
        labelSettingTemp.font = UIFont(name: "Rubik-Regular", size: 16)
        labelSettingTemp.numberOfLines = 0
        labelSettingTemp.text = "Темпиратура, C/F"
        return labelSettingTemp
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

            self.coordinator?.dayDetailForecastController?.reloadTableView()
            self.coordinator?.mainController?.reloadTableView()
        }

        switchTemp.addAction(action, for: .touchUpInside)

        return switchTemp
    }()



    private lazy var labelSettingWind: UILabel = {

        var labelSettingWind = UILabel()
        labelSettingWind.textColor = UIColor(named: "#272722")
        labelSettingWind.translatesAutoresizingMaskIntoConstraints = false
        labelSettingWind.font = UIFont(name: "Rubik-Regular", size: 16)
        labelSettingWind.numberOfLines = 0
        labelSettingWind.text = "Скорость ветра, Км/Мили"
        return labelSettingWind
    }()



    private lazy var switchSettingWind: UISwitch = {

        var switchSettingWind = UISwitch()
        switchSettingWind.translatesAutoresizingMaskIntoConstraints = false

        if UserDefaults.standard.string(forKey: "switchWind") == "Km" || UserDefaults.standard.string(forKey: "switchWind") == nil {
            switchSettingWind.isOn = false
        }

        if UserDefaults.standard.string(forKey: "switchWind") == "Mi" {
            switchSettingWind.isOn = true
        }


        let action = UIAction { _ in

            if switchSettingWind.isOn == false {
                UserDefaults.standard.set("Km", forKey: "switchWind")
            }

            if switchSettingWind.isOn == true {
                UserDefaults.standard.set("Mi", forKey: "switchWind")

            }

            self.coordinator?.dayDetailForecastController?.reloadTableView()
            self.coordinator?.mainController?.reloadTableView()
        }

        switchSettingWind.addAction(action, for: .touchUpInside)

        return switchSettingWind
    }()


    
    private lazy var labelSettingHour: UILabel = {

        var labelSettingHour = UILabel()
        labelSettingHour.textColor = UIColor(named: "#272722")
        labelSettingHour.translatesAutoresizingMaskIntoConstraints = false
        labelSettingHour.font = UIFont(name: "Rubik-Regular", size: 16)
        labelSettingHour.numberOfLines = 0
        labelSettingHour.text = "Формат времени, 12/24"
        return labelSettingHour
    }()




    private lazy var switchSettingHour: UISwitch = {

        var switchSettingHour = UISwitch()

        switchSettingHour.translatesAutoresizingMaskIntoConstraints = false

        if UserDefaults.standard.string(forKey: "switchHour" ) == nil || UserDefaults.standard.string(forKey: "switchHour") == "HH" {

            switchSettingHour.isOn = true
        }

        if UserDefaults.standard.string(forKey: "switchHour") == "hh" {
            switchSettingHour.isOn = false
        }

        let action = UIAction {_ in

            if switchSettingHour.isOn == true {

                UserDefaults.standard.set("HH", forKey: "switchHour")
            }

            if switchSettingHour.isOn == false {

                UserDefaults.standard.set("hh", forKey: "switchHour")
            }

            self.coordinator?.dayDetailForecastController?.reloadTableView()
            self.coordinator?.mainController?.reloadTableView()
        }

        switchSettingHour.addAction(action, for: .touchUpInside)

        return switchSettingHour
    }()




    override func viewDidLoad() {
        super.viewDidLoad()

        [self.viewCentre, self.labelSetting, self.labelSettingTemp, self.switchTemp, self.labelSettingWind, self.switchSettingWind, self.labelSettingHour, self.switchSettingHour ].forEach { self.view.addSubview( $0 )}

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
            self.viewCentre.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -180),

            self.labelSetting.topAnchor.constraint(equalTo: self.viewCentre.topAnchor, constant: 35),
            self.labelSetting.leadingAnchor.constraint(equalTo: self.viewCentre.leadingAnchor, constant: 20),

            self.labelSettingTemp.topAnchor.constraint(equalTo: self.labelSetting.bottomAnchor, constant: 20),
            self.labelSettingTemp.leadingAnchor.constraint(equalTo: self.viewCentre.leadingAnchor, constant: 20),


            self.switchTemp.trailingAnchor.constraint(equalTo: self.viewCentre.trailingAnchor, constant: -20),
            self.switchTemp.centerYAnchor.constraint(equalTo: self.labelSettingTemp.centerYAnchor),

            self.labelSettingWind.topAnchor.constraint(equalTo: self.labelSettingTemp.bottomAnchor, constant: 30),
            self.labelSettingWind.leadingAnchor.constraint(equalTo: self.viewCentre.leadingAnchor, constant: 20),
            labelSettingWind.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120),

            self.switchSettingWind.centerYAnchor.constraint(equalTo: self.labelSettingWind.centerYAnchor),
            self.switchSettingWind.trailingAnchor.constraint(equalTo: self.viewCentre.trailingAnchor, constant: -20),

            self.labelSettingHour.topAnchor.constraint(equalTo: self.switchSettingWind.bottomAnchor, constant: 30),
            self.labelSettingHour.leadingAnchor.constraint(equalTo: self.viewCentre.leadingAnchor, constant: 20),

            labelSettingHour.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120),


            self.switchSettingHour.centerYAnchor.constraint(equalTo: self.labelSettingHour.centerYAnchor),
            self.switchSettingHour.trailingAnchor.constraint(equalTo: self.viewCentre.trailingAnchor, constant: -20),

        ])
    }
}
