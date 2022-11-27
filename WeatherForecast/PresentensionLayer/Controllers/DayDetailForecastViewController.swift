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

        return tableView
    }()




    override func viewDidLoad() {
        super.viewDidLoad()

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
            return 5
        }
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        return UITableViewCell()
    }



}
