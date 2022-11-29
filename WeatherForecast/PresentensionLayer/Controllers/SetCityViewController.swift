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

                        print("📤")
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


        let image = UIImageView(image: UIImage(named: "plus2"))
        image.frame.size = .init(width: 70, height: 70)
        image.contentMode = .scaleAspectFit


        var buttonSetCity = UIButton(primaryAction: action)
        buttonSetCity.addSubview(image)
        buttonSetCity.translatesAutoresizingMaskIntoConstraints = false
        buttonSetCity.frame.size = .init(width: 100, height: 100)

        return buttonSetCity
    }()





    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.buttonSetCity)

        self.view.backgroundColor = .white

      // self.coordinator?.locationService.getLocationCity(nameCity: "иркутск") {_ in }

        NSLayoutConstraint.activate([

            self.buttonSetCity.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.buttonSetCity.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.buttonSetCity.heightAnchor.constraint(equalToConstant: 40),
            self.buttonSetCity.widthAnchor.constraint(equalToConstant: 40),
        ])
    }




}
