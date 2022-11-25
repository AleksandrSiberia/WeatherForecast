//
//  MainViewController.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 18.11.2022.
//

import UIKit

class MainViewController: UIViewController {


    var coordinator: CoordinatorProtocol?



    var dayForecastNetwork: WeatherModel? {
        
        didSet {
            self.tableView.reloadData()
        }
    }


    var getTodayForecast: WeatherForecastCoreData?


    var weatherModel: WeatherModel?

    
    lazy var tableView: UITableView = {

        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainTopTableViewCell.self, forCellReuseIdentifier: MainTopTableViewCell.nameCell)
        tableView.register( MainDetailedDayTableViewCell.self, forCellReuseIdentifier: MainDetailedDayTableViewCell.nameCell)
        return tableView
    }()



    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = self.coordinator?.locationService.currentCity

        self.view.addSubview(self.tableView)

        self.setupLayoutConstrains()



//        self.coordinator?.networkService.getData(completionHandler: { weatherModel in
//            if let weatherModel {
//                self.coordinator?.coreDataService.setWeatherForecast(weatherModel: weatherModel)
//
//            }
//        })

    }


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        


    }



    func setupLayoutConstrains() {
        
        NSLayoutConstraint.activate([

            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)

        ])
    }
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }

        if section == 1 {
            return 1
        }

        else {
            return 5
        }
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {



        if indexPath.section == 0 {

            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: MainTopTableViewCell.nameCell, for: indexPath) as? MainTopTableViewCell

            else {
                print("‼️ indexPath.section == 0")
                return UITableViewCell()
            }

            guard self.coordinator?.weatherForecastService.getTodayForecastCoreData()?.isEmpty == false

            else {

                cell.setupCellNetwork(weatherModel: self.dayForecastNetwork)

                
//                self.coordinator?.networkService.getData(completionHandler: { weatherModel in
//
//                    DispatchQueue.main.async {
//                        self.dayForecast = weatherModel
//                        self.tableView.reloadData()
//                        cell.setupCellNetwork(weatherModel: weatherModel)
//
//                    }
//                })

                return cell
            }

            cell.setupCellCoreData(nowWeather: self.coordinator?.weatherForecastService.getTodayForecastCoreData()?[0])
            return cell
        }





        if indexPath.section == 1 {

           guard let cell = tableView.dequeueReusableCell(withIdentifier:  MainDetailedDayTableViewCell.nameCell, for: indexPath) as? MainDetailedDayTableViewCell

            else {
               print("‼️ indexPath.section == 1")
               return UITableViewCell()
           }

            guard self.coordinator?.weatherForecastService.getTodayForecastCoreData()?.isEmpty == false

            else {

                cell.setupCellNetwork(dayForecast: self.dayForecastNetwork)
                return cell

            }

            cell.setupCellCoreData(dayForecast: self.coordinator?.weatherForecastService.getTodayForecastCoreData())
           
            return cell
        }



        else {
            return UITableViewCell()
        }
    }


    func numberOfSections(in tableView: UITableView) -> Int {

        3
    }

}
