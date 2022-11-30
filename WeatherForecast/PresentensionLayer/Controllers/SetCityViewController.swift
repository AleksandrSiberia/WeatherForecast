//
//  SetCityViewController.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 29.11.2022.
//

import UIKit

class SetCityViewController: UIViewController {



    var coordinator: CoordinatorProtocol?


    private lazy var buttonSetCity: UIButton = {

        let action = UIAction { uiAction in
            print("buttonSetCity: UIButton")



            let alertWriteNameCity = UIAlertController(title: "Напешите город", message: nil, preferredStyle: .alert)



            alertWriteNameCity.addTextField { textField in

                textField.clearButtonMode = .whileEditing
            }



            let actionOk = UIAlertAction(title: "Добавить", style: .default) { _ in

                let nameCity = alertWriteNameCity.textFields?[0].text ?? ""


                self.coordinator?.locationService.getLocationCity(nameCity: nameCity) { string in


                    let alertResult = UIAlertController(title: string, message: nil, preferredStyle: .actionSheet)

                    let actionResult = UIAlertAction(title: "Ок", style: .cancel) {
                        _ in


                        if UserDefaults.standard.string(forKey: "latitude") != nil && (UserDefaults.standard.string(forKey: "longitude") != nil) {

                            self.coordinator?.showMainControllerFromSetCityViewController()
                        }
                    }

                    alertResult.addAction(actionResult)

                    self.navigationController?.present(alertResult, animated: true)
                 }



            }
            alertWriteNameCity.addAction(actionOk)

            let actionCancel = UIAlertAction(title: "Отмена", style: .cancel
            )
            alertWriteNameCity.addAction(actionCancel)


            self.navigationController?.present(alertWriteNameCity, animated: true)
        }

        var buttonSetCity = UIButton(primaryAction: action)

        buttonSetCity.setImage(UIImage(systemName: "plus.app"), for: .normal)
        buttonSetCity.translatesAutoresizingMaskIntoConstraints = false
        return buttonSetCity
    }()





    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.buttonSetCity)

        self.view.backgroundColor = .white

        self.navigationItem.title = "Добавте город"

        NSLayoutConstraint.activate([

            self.buttonSetCity.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.buttonSetCity.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.buttonSetCity.heightAnchor.constraint(equalToConstant: 40),
            self.buttonSetCity.widthAnchor.constraint(equalToConstant: 40),
        ])
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if self.coordinator?.locationService.locationManager.authorizationStatus == .authorizedWhenInUse {

            let alert = UIAlertController(title: nil, message: "Чтобы настройки города сохранились при следующем запуске приложения, автоопределение локации должно быть отключено", preferredStyle: .alert)

            let action = UIAlertAction(title: "Ok", style: .cancel)

            alert.addAction(action)

            self.navigationController?.present(alert, animated: true)
        }
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.navigationBar.backgroundColor = .white
    }




}
