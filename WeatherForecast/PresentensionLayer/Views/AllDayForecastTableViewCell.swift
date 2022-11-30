//
//  AllDayForecastTableViewCell.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 26.11.2022.
//

import UIKit

class AllDayForecastTableViewCell: UITableViewCell {

    

    private lazy var labelDate: UILabel = {

        var labelDate = UILabel()
        labelDate.textColor = UIColor(named: "#272722")
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        labelDate.font = UIFont(name: "Rubik-Regular", size: 14)
        labelDate.numberOfLines = 0
        return labelDate
    }()




    private lazy var imageViewIconWeather: UIImageView = {

        var imageViewIconWeather = UIImageView()
        imageViewIconWeather.translatesAutoresizingMaskIntoConstraints = false
        imageViewIconWeather.contentMode = .scaleAspectFit
        return imageViewIconWeather
    }()



    private lazy var labelHumidity: UILabel = {

        var labelHumidity = UILabel()
        labelHumidity.textColor = UIColor(named: "#204EC7")
        labelHumidity.translatesAutoresizingMaskIntoConstraints = false
        labelHumidity.font = UIFont(name: "Rubik-Regular", size: 12)
        labelHumidity.numberOfLines = 0
        return labelHumidity
    }()



    private lazy var labelDescriptionWeather: UILabel = {

        var labelDescriptionWeather = UILabel()
        labelDescriptionWeather.textColor = UIColor(named: "#272722")
        labelDescriptionWeather.translatesAutoresizingMaskIntoConstraints = false
        labelDescriptionWeather.font = UIFont(name: "Rubik-Regular", size: 14)
        labelDescriptionWeather.numberOfLines = 0
        return labelDescriptionWeather
    }()


    private lazy var labelMinMaxTemp: UILabel = {

        var labelMinMaxTemp = UILabel()
        labelMinMaxTemp.textColor = UIColor(named: "#272722")
        labelMinMaxTemp.translatesAutoresizingMaskIntoConstraints = false
        labelMinMaxTemp.font = UIFont(name: "Rubik-Regular", size: 14)
        labelMinMaxTemp.numberOfLines = 0
        return labelMinMaxTemp
    }()



    private lazy var labeDisclosureIndicator: UILabel = {

        var labeDisclosureIndicator = UILabel()
        labeDisclosureIndicator.textColor = UIColor(named: "#272722")
        labeDisclosureIndicator.translatesAutoresizingMaskIntoConstraints = false
        labeDisclosureIndicator.font = UIFont(name: "Rubik-Regular", size: 18)
        labeDisclosureIndicator.numberOfLines = 0
        labeDisclosureIndicator.text = ">"
        return labeDisclosureIndicator
    }()




    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.contentView.backgroundColor = UIColor(named: "#E9EEFA")
        self.contentView.layer.cornerRadius = 12
        self.contentView.clipsToBounds = true
        self.contentView.layer.borderWidth = 4
        self.contentView.layer.borderColor = UIColor.white.cgColor


        [ self.labelDate, self.labelHumidity, self.imageViewIconWeather, self.labelDescriptionWeather, self.labelMinMaxTemp, self.labeDisclosureIndicator ].forEach { self.contentView.addSubview($0) }

        setupLayoutConstrains()


    }




    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }




    func setupLayoutConstrains() {

        NSLayoutConstraint.activate([

            self.labelDate.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            self.labelDate.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 22),

            self.imageViewIconWeather.topAnchor.constraint(equalTo: self.labelDate.bottomAnchor, constant: 1),
            self.imageViewIconWeather.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.imageViewIconWeather.heightAnchor.constraint(equalToConstant: 30),
            self.imageViewIconWeather.widthAnchor.constraint(equalToConstant: 30),
            self.imageViewIconWeather.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -6),

            self.labelHumidity.leadingAnchor.constraint(equalTo: self.imageViewIconWeather.trailingAnchor),
            self.labelHumidity.centerYAnchor.constraint(equalTo: self.imageViewIconWeather.centerYAnchor),

            self.labelDescriptionWeather.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.labelDescriptionWeather.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),

            self.labelMinMaxTemp.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.labelMinMaxTemp.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),

            self.labeDisclosureIndicator.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -4),
            self.labeDisclosureIndicator.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: -1),



        ])
    }




    func setupCell(dayForecast: [WeatherForecastCoreData]? ) {

        if dayForecast?.isEmpty == false {

            let dateFormatter = DateFormatter()

            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

            let dateString = dayForecast?[0].date ?? ""

            let dateDate = dateFormatter.date(from: dateString)

            dateFormatter.dateFormat = "dd/MM"

            if let dateDate {

                let dateForLabel = dateFormatter.string(from: dateDate)

                self.labelDate.text = dateForLabel
            }



            self.imageViewIconWeather.image = UIImage(named: dayForecast?[0].icon ?? "")

            self.labelHumidity.text = String(dayForecast?[0].humidity ?? 0) + "%"

            self.labelDescriptionWeather.text = dayForecast?[0].descriptionWeather ?? ""


            let minTemp = SettingService.shared.changeTemp(temp: dayForecast?[0].tepmMin) + "°"
            let maxTemp = SettingService.shared.changeTemp(temp: dayForecast?[0].tempMax) + "°"

            let minMaxTemp = minTemp + "/" + maxTemp
            self.labelMinMaxTemp.text = minMaxTemp
        }

        else {

            print("‼️ error -> func setupCell(dayForecast: [WeatherForecastCoreData]? )")
        }



    }

}


extension AllDayForecastTableViewCell: CellNameProtocol {

    static var nameCell: String {
        String(describing: self)
    }



}
