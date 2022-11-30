//
//  DayDetailForecastViewController.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 27.11.2022.
//

import UIKit

class DayDetailForecastViewController: UIViewController {


    var coordinator: CoordinatorProtocol?


    private lazy var tableView: UITableView = {

        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        
        tableView.register(DayDetailForecastTableViewCell.self, forCellReuseIdentifier: DayDetailForecastTableViewCell.nameCell)
        tableView.register(DayDetailTopForecastTableViewCell.self, forCellReuseIdentifier: DayDetailTopForecastTableViewCell.nameCell)

        return tableView
    }()




    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Прогноз на 24 часа"

        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.backgroundColor = .white
        self.view.addSubview(tableView)

        NSLayoutConstraint.activate([

            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }

    func reloadTableView() {
        self.tableView.reloadData()
    }

}




extension DayDetailForecastViewController: UITableViewDelegate, UITableViewDataSource {


    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        if section == 0 {
            return 1
        }

        else {
            return 9
        }
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

  //      DayDetailTopForecastTableViewCell.nameCell


        if indexPath.section == 0 {

            guard let cell = self.tableView.dequeueReusableCell(withIdentifier:  DayDetailTopForecastTableViewCell.nameCell, for: indexPath) as?  DayDetailTopForecastTableViewCell
            else {
                return UITableViewCell()
            }


            if let forecastCoreData = self.coordinator?.weatherForecastService.getForecastCoreData() {

                guard forecastCoreData.isEmpty == false
                else {
                    return cell
                }

                cell.setupCellCoreData(dayForecast: forecastCoreData)
                return cell
            }


            else {
                return cell
            }
        }
        
        


        if indexPath.section == 1 {
            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: DayDetailForecastTableViewCell.nameCell, for: indexPath) as? DayDetailForecastTableViewCell
            else {
                return UITableViewCell()
            }


            if let forecastCoreData = self.coordinator?.weatherForecastService.getForecastCoreData() {
                
                guard forecastCoreData.isEmpty == false
                else {
                    return cell
                }

                cell.setupCell(dayForecast: forecastCoreData[indexPath.row])
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



}
