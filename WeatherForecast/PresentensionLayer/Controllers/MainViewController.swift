//
//  MainViewController.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 18.11.2022.
//

import UIKit

class MainViewController: UIViewController {


    var coordinator: CoordinatorProtocol?

    var mainViewController: MainViewController?
    

    private lazy var barButtonItemLocation: UIBarButtonItem = {


        var barButtonItemLocation = UIBarButtonItem(image: UIImage(systemName:  "mappin.and.ellipse"), style: .done, target: self, action: #selector(actionBarButtonItemLocation))

        return barButtonItemLocation
    }()



    private lazy var barButtonItemSetting: UIBarButtonItem = {

        var barButtonItemSetting = UIBarButtonItem(image: UIImage(systemName:  "gearshape"), style: .done, target: self, action: #selector(actionBarButtonItemSetting))

        return barButtonItemSetting
    }()



    private lazy var tableView: UITableView = {

        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self

        tableView.backgroundColor = .white

        tableView.separatorStyle = .none

        tableView.register(MainTopTableViewCell.self, forCellReuseIdentifier: MainTopTableViewCell.nameCell)
        tableView.register( MainDetailedDayTableViewCell.self, forCellReuseIdentifier: MainDetailedDayTableViewCell.nameCell)
        tableView.register(AllDayForecastTableViewCell.self, forCellReuseIdentifier: AllDayForecastTableViewCell.nameCell)

        return tableView
    }()



    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        navigationController?.navigationBar.tintColor = .gray


        self.navigationItem.setHidesBackButton(true, animated: false)

        self.navigationItem.rightBarButtonItem = self.barButtonItemLocation
        self.navigationItem.leftBarButtonItem = self.barButtonItemSetting

        self.view.addSubview(self.tableView)

        self.setupLayoutConstrains()



        self.coordinator?.networkService.getData(completionHandler: { weatherModel in
            if let weatherModel {

                self.coordinator?.coreDataService.setWeatherForecast(weatherModel: weatherModel)
                DispatchQueue.main.async {
                    self.navigationItem.title = weatherModel.city.nameCity

                    self.tableView.reloadData()

                }
            }
        })
    }

    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.navigationBar.backgroundColor = .white


    }



    func setupLayoutConstrains() {


        
        NSLayoutConstraint.activate([

            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)

        ])
    }


    func showDayDetailForecastViewController() {

        self.coordinator?.showDayDetailForecastController()
    }


    func reloadTableView() {
        self.tableView.reloadData()
    }


    
    @objc func actionBarButtonItemLocation() {
        self.coordinator?.showFirstController()
    }



    @objc func actionBarButtonItemSetting() {
        self.coordinator?.showSettingViewController()
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


        if section == 2 {

            if let forecastCoreData = self.coordinator?.weatherForecastService.getForecastCoreData() {

                guard forecastCoreData.count >= 5

                else {
                    return forecastCoreData.count
                }
                return 5
            }

            else {
                return 0
            }
        }
        else {
            return 0
        }
    }




    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {



        if indexPath.section == 0 {

            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: MainTopTableViewCell.nameCell, for: indexPath) as? MainTopTableViewCell


            else {
                print("‼️ indexPath.section == 0")
                return UITableViewCell()
            }

            cell.selectionStyle = .none

            cell.backgroundColor = .white

            if let getForecastCoreData = self.coordinator?.weatherForecastService.getForecastCoreData()  {



                guard getForecastCoreData.isEmpty == false

                else {
                    return cell
                }

                let forecast = self.coordinator?.weatherForecastService.getForecastCoreData()?[0]

                self.navigationItem.title = forecast?.nameCity

                cell.setupCellCoreData(nowWeather: forecast)

                return cell
            }


            else {
                return cell
            }
        }




        if indexPath.section == 1 {


            guard let cell = tableView.dequeueReusableCell(withIdentifier:  MainDetailedDayTableViewCell.nameCell, for: indexPath) as? MainDetailedDayTableViewCell

            else {
                print("‼️ indexPath.section == 1")
                return UITableViewCell()
            }

            cell.selectionStyle = .none

            cell.backgroundColor = .white

            if let getForecastCoreData = self.coordinator?.weatherForecastService.getForecastCoreData()  {

                guard getForecastCoreData.isEmpty == false

                else {
                    return cell
                }

                cell.setupCell(mainController: self)

                cell.setupCellCoreData(dayForecast: self.coordinator?.weatherForecastService.getForecastCoreData())


                return cell
            }

            else {
                return cell
            }
        }




        
        if indexPath.section == 2 {

            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: AllDayForecastTableViewCell.nameCell, for: indexPath) as? AllDayForecastTableViewCell

            else {
                print("‼️ error = as? AllDayForecastTableViewCell")
                return UITableViewCell()
            }

            cell.selectionStyle = .none
            cell.backgroundColor = .white


            if let getForecastCoreData = self.coordinator?.weatherForecastService.getForecastCoreData()  {

                guard getForecastCoreData.isEmpty == false

                else {
                    return cell
                }


                cell.setupCell(dayForecast: self.coordinator?.weatherForecastService.getDayForecastCoreData(day: indexPath.row))

                return cell
            }

            else {
                return cell
            }
        }


        else {
            return UITableViewCell()
        }

    }


    
    func numberOfSections(in tableView: UITableView) -> Int {

        3
    }


    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


        if indexPath.section == 2 {


            self.coordinator?.showOneDayDetailForecastViewController(day: indexPath.row)

        }
    }
}
