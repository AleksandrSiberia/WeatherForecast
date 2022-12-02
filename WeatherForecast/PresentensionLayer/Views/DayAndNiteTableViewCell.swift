//
//  DayAndNiteTableViewCell.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 01.12.2022.
//

import UIKit

class DayAndNiteTableViewCell: UITableViewCell {


    private lazy var labelDayOrNite: UILabel = {

        var labelDayOrNite = UILabel()
        labelDayOrNite.textColor = UIColor(named: "#272722")
        labelDayOrNite.translatesAutoresizingMaskIntoConstraints = false
        labelDayOrNite.font = UIFont(name: "Rubik-Regular", size: 18)
        labelDayOrNite.numberOfLines = 0

        return labelDayOrNite
    }()



    
    private lazy var imageWeather: UIImageView = {

        var imageWeather = UIImageView()
        imageWeather.translatesAutoresizingMaskIntoConstraints = false
        imageWeather.contentMode = .scaleAspectFit
        return imageWeather
    }()



    private lazy var labelTemp: UILabel = {

        var labelTemp = UILabel()
        labelTemp.textColor = UIColor(named: "#272722")
        labelTemp.translatesAutoresizingMaskIntoConstraints = false
        labelTemp.font = UIFont(name: "Rubik-Regular", size: 30)
        labelTemp.numberOfLines = 0

        return labelTemp
    }()


    private lazy var labelWeatherDescription: UILabel = {

        var labelWeatherDescription = UILabel()
        labelWeatherDescription.textColor = UIColor(named: "#272722")
        labelWeatherDescription.translatesAutoresizingMaskIntoConstraints = false
        labelWeatherDescription.font = UIFont(name: "Rubik-Medium", size: 18)
        labelWeatherDescription.numberOfLines = 0

        return labelWeatherDescription
    }()



    private lazy var imageFeel: UIImageView = {

        var imageFeel = UIImageView()
        imageFeel.translatesAutoresizingMaskIntoConstraints = false
        imageFeel.contentMode = .scaleAspectFit
        imageFeel.image = UIImage(named: "feel")
        return imageFeel
    }()



    private lazy var labelFeel: UILabel = {

        var labelFeel = UILabel()
        labelFeel.textColor = UIColor(named: "#272722")
        labelFeel.translatesAutoresizingMaskIntoConstraints = false
        labelFeel.font = UIFont(name: "Rubik-Regular", size: 18)
        labelFeel.numberOfLines = 0
        labelFeel.text = "По ощущениям"

        return labelFeel
    }()



    private lazy var labelFeelValue: UILabel = {

        var labelFeelValue = UILabel()
        labelFeelValue.textColor = UIColor(named: "#272722")
        labelFeelValue.translatesAutoresizingMaskIntoConstraints = false
        labelFeelValue.font = UIFont(name: "Rubik-Regular", size: 18)
        labelFeelValue.numberOfLines = 0

        return labelFeelValue
    }()



    private lazy var imageWind: UIImageView = {

        var imageWind = UIImageView()
        imageWind.translatesAutoresizingMaskIntoConstraints = false
        imageWind.contentMode = .scaleAspectFit
        imageWind.image = UIImage(named: "wind")
        return imageWind
    }()



    private lazy var labelWind: UILabel = {

        var labelWind = UILabel()
        labelWind.textColor = UIColor(named: "#272722")
        labelWind.translatesAutoresizingMaskIntoConstraints = false
        labelWind.font = UIFont(name: "Rubik-Regular", size: 18)
        labelWind.numberOfLines = 0
        labelWind.text = "Ветер"

        return labelWind
    }()



    private lazy var labelWindValue: UILabel = {

        var labelWindValue = UILabel()
        labelWindValue.textColor = UIColor(named: "#272722")
        labelWindValue.translatesAutoresizingMaskIntoConstraints = false
        labelWindValue.font = UIFont(name: "Rubik-Regular", size: 18)
        labelWindValue.numberOfLines = 0

        return labelWindValue
    }()



    private lazy var imageHumidity: UIImageView = {

        var imageHumidity = UIImageView()
        imageHumidity.translatesAutoresizingMaskIntoConstraints = false
        imageHumidity.contentMode = .scaleAspectFit
        imageHumidity.image = UIImage(named: "rain")
        return imageHumidity
    }()



    private lazy var labelHumidity: UILabel = {

        var labelHumidity = UILabel()
        labelHumidity.textColor = UIColor(named: "#272722")
        labelHumidity.translatesAutoresizingMaskIntoConstraints = false
        labelHumidity.font = UIFont(name: "Rubik-Regular", size: 18)
        labelHumidity.numberOfLines = 0
        labelHumidity.text = "Влажность"

        return labelHumidity
    }()


    private lazy var labelHumidityValue: UILabel = {

        var labelHumidityValue = UILabel()
        labelHumidityValue.textColor = UIColor(named: "#272722")
        labelHumidityValue.translatesAutoresizingMaskIntoConstraints = false
        labelHumidityValue.font = UIFont(name: "Rubik-Regular", size: 18)
        labelHumidityValue.numberOfLines = 0

        return labelHumidityValue
    }()


    private lazy var imageClouds: UIImageView = {

        var imageClouds = UIImageView()
        imageClouds.translatesAutoresizingMaskIntoConstraints = false
        imageClouds.contentMode = .scaleAspectFit
        imageClouds.image = UIImage(named: "clouds")
        return imageClouds
    }()



    private lazy var labelClouds: UILabel = {

        var labelClouds = UILabel()
        labelClouds.textColor = UIColor(named: "#272722")
        labelClouds.translatesAutoresizingMaskIntoConstraints = false
        labelClouds.font = UIFont(name: "Rubik-Regular", size: 18)
        labelClouds.numberOfLines = 0
        labelClouds.text = "Облачность"

        return labelClouds
    }()



    private lazy var labelCloudsValue: UILabel = {

        var labelCloudsValue = UILabel()
        labelCloudsValue.textColor = UIColor(named: "#272722")
        labelCloudsValue.translatesAutoresizingMaskIntoConstraints = false
        labelCloudsValue.font = UIFont(name: "Rubik-Regular", size: 18)
        labelCloudsValue.numberOfLines = 0

        return labelCloudsValue
    }()



    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        //        self.contentView.backgroundColor = UIColor(named: "#E9EEFA")
        //        self.contentView.layer.masksToBounds = true
        //        self.contentView.layer.cornerRadius = 22

        

        [ self.labelDayOrNite, self.imageWeather, self.labelTemp, self.labelWeatherDescription, self.imageFeel, self.labelFeel, self.labelFeelValue, self.imageWind, self.labelWind, self.labelWindValue, self.imageHumidity, self.labelHumidity, self.labelHumidityValue, self.imageClouds, self.labelClouds, self.labelCloudsValue ].forEach { self.contentView.addSubview($0) }

        setupLayoutConstraints()


    }



    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }




    func setupLayoutConstraints() {

        NSLayoutConstraint.activate([


            self.labelDayOrNite.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 21),
            self.labelDayOrNite.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),

            self.imageWeather.centerYAnchor.constraint(equalTo: self.labelDayOrNite.centerYAnchor),
            self.imageWeather.heightAnchor.constraint(equalToConstant: 50),
            self.imageWeather.widthAnchor.constraint(equalToConstant: 50),

            self.labelTemp.centerYAnchor.constraint(equalTo: self.imageWeather.centerYAnchor),
            self.labelTemp.leadingAnchor.constraint(equalTo: self.imageWeather.trailingAnchor, constant: 8),
            self.labelTemp.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor, constant: 20),

            self.labelWeatherDescription.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.labelWeatherDescription.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 70),

            self.imageFeel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 110),
            self.imageFeel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            self.imageFeel.heightAnchor.constraint(equalToConstant: 25),
            self.imageFeel.widthAnchor.constraint(equalToConstant: 25),

            self.labelFeel.centerYAnchor.constraint(equalTo: self.imageFeel.centerYAnchor),
            self.labelFeel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 55),

            self.labelFeelValue.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            self.labelFeelValue.centerYAnchor.constraint(equalTo: self.labelFeel.centerYAnchor),

            self.imageWind.topAnchor.constraint(equalTo: self.imageFeel.bottomAnchor, constant: 25),
            self.imageWind.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            self.imageWind.heightAnchor.constraint(equalToConstant: 25),
            self.imageWind.widthAnchor.constraint(equalToConstant: 25),

            self.labelWind.centerYAnchor.constraint(equalTo: self.imageWind.centerYAnchor),
            self.labelWind.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 55),

            self.labelWindValue.centerYAnchor.constraint(equalTo: self.labelWind.centerYAnchor),
            self.labelWindValue.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),

            self.imageHumidity.topAnchor.constraint(equalTo: self.imageWind.bottomAnchor, constant: 25),
            self.imageHumidity.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            self.imageHumidity.heightAnchor.constraint(equalToConstant: 20),
            self.imageHumidity.widthAnchor.constraint(equalToConstant: 20),

            self.labelHumidity.centerYAnchor.constraint(equalTo: self.imageHumidity.centerYAnchor),
            self.labelHumidity.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 55),

            self.labelHumidityValue.centerYAnchor.constraint(equalTo: self.labelHumidity.centerYAnchor),
            self.labelHumidityValue.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),

            self.imageClouds.topAnchor.constraint(equalTo: self.imageHumidity.bottomAnchor, constant: 25),
            self.imageClouds.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15),
            self.imageClouds.heightAnchor.constraint(equalToConstant: 20),
            self.imageClouds.widthAnchor.constraint(equalToConstant: 20),

            self.labelClouds.centerYAnchor.constraint(equalTo: self.imageClouds.centerYAnchor),
            self.labelClouds.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 55),

            self.labelCloudsValue.centerYAnchor.constraint(equalTo: self.imageClouds.centerYAnchor),
            self.labelCloudsValue.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),

            self.labelCloudsValue.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -30),

        ])
    }




    func setupCell(dayOrNiteForecast: [WeatherForecastCoreData]?, indexPathRow: Int?) {

        
        if indexPathRow == 0 {

            self.labelDayOrNite.text = "День"

            let day = dayOrNiteForecast?.filter { $0.dayOrNite == "d" }

            if let day {

                if day.isEmpty == false {

                    let forecast = day[0]

                    self.imageWeather.image = UIImage(named: forecast.icon ?? "")

                    self.labelTemp.text = SettingService.shared.changeTemp(temp: forecast.temp)

                    self.labelWeatherDescription.text = forecast.descriptionWeather

                    self.labelFeelValue.text = SettingService.shared.changeTemp(temp: forecast.temp)

                    self.labelWindValue.text = SettingService.shared.changeSpeedWind(float: forecast.speedWind)

                    self.labelHumidityValue.text = String(forecast.humidity) + " %"

                    self.labelCloudsValue.text = String(forecast.cloudsPercent) + " %"

                }
            }
        }



        if indexPathRow == 1 {

            self.labelDayOrNite.text = "Ночь"

            let nite = dayOrNiteForecast?.filter { $0.dayOrNite == "n" }

            if let nite {
                if nite.isEmpty == false {

                    let forecast = nite[0]

                    self.imageWeather.image = UIImage(named: forecast.icon ?? "")

                    self.labelTemp.text = SettingService.shared.changeTemp(temp: forecast.temp)

                    self.labelWeatherDescription.text = forecast.descriptionWeather

                    self.labelFeelValue.text = SettingService.shared.changeTemp(temp: forecast.temp)

                    self.labelWindValue.text = SettingService.shared.changeSpeedWind(float: forecast.speedWind)

                    self.labelHumidityValue.text = String(forecast.humidity) + " %"

                    self.labelCloudsValue.text = String(forecast.cloudsPercent) + " %"

                }
            }
        }
    }

}



extension DayAndNiteTableViewCell: CellNameProtocol {
    static var nameCell: String {

        String(describing: self)
    }

}
