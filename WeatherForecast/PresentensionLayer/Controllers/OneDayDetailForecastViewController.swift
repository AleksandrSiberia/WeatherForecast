//
//  OneDayDetailForecastViewController.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 01.12.2022.
//

import UIKit

class OneDayDetailForecastViewController: UIViewController {


    var coordinator: CoordinatorProtocol?

    var dayForecast: [WeatherForecastCoreData]? {
        didSet {
            self.tableView.reloadData()
        }
    }


    var numberIndexPathRow: Int?


    private lazy var tableView: UITableView = {

        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false

        tableView.register(DayAndNiteTableViewCell.self, forCellReuseIdentifier: DayAndNiteTableViewCell.nameCell)
        tableView.register(DayAndNiteTopTableViewCell.self, forCellReuseIdentifier: DayAndNiteTopTableViewCell.nameCell)

        return tableView
    }()




    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Дневная погода"

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



    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }



    func reloadTableView() {
        self.tableView.reloadData()
    }

}




extension OneDayDetailForecastViewController: UITableViewDelegate, UITableViewDataSource {


    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {


        if section == 0 {
            return 1
        }

        else {
            if let forecastCoreData = self.dayForecast {

                guard forecastCoreData.isEmpty == false

                else {

                    return 0
                }
                return 2
            }
            else {
                return 0
            }
        }
    }




    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        if indexPath.section == 0 {



            guard let cell = tableView.dequeueReusableCell(withIdentifier: DayAndNiteTopTableViewCell.nameCell, for: indexPath) as? DayAndNiteTopTableViewCell
            else {
                return UITableViewCell()
            }


            if numberIndexPathRow == indexPath.row {
                cell.setupColorCollectionCell(colorCollectionCell: UIColor(named: "#204EC7"))
            }

            cell.setupCellCoreData(coordinator: self.coordinator)

            return cell
        }




        if indexPath.section == 1 {

            guard let cell = self.tableView.dequeueReusableCell(withIdentifier: DayAndNiteTableViewCell.nameCell, for: indexPath) as? DayAndNiteTableViewCell
            else {
                return UITableViewCell()
            }

            if let forecastCoreData = self.dayForecast {

                guard forecastCoreData.isEmpty == false

                else {
                    return cell
                }

                cell.setupCell(dayOrNiteForecast: forecastCoreData, indexPathRow: indexPath.row)

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
