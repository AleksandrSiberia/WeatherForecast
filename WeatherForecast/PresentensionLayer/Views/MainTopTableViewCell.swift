//
//  MainTopTableViewCell.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 21.11.2022.
//

import UIKit

class MainTopTableViewCell: UITableViewCell {

    private lazy var activityIndicator: UIActivityIndicatorView = {
        var activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        activityIndicator.color = .white
        activityIndicator.transform = CGAffineTransform(scaleX: 2, y: 2)
        return activityIndicator
    }()


    private lazy var imageViewRainbow: UIImageView = {

        var imageViewRainbow = UIImageView()
        imageViewRainbow.translatesAutoresizingMaskIntoConstraints = false
        imageViewRainbow.image = UIImage(named: "rainbow")
    //    imageViewRainbow.contentMode = .scaleAspectFit
        imageViewRainbow.isHidden = true
        return imageViewRainbow
    }()


    private lazy var imageViewSunrise: UIImageView = {

        var imageViewSunrise = UIImageView()
        imageViewSunrise.translatesAutoresizingMaskIntoConstraints = false
        imageViewSunrise.image = UIImage(named: "sunrise")
        imageViewSunrise.contentMode = .scaleAspectFit
        imageViewRainbow.isHidden = true
        return imageViewSunrise
    }()


    private lazy var imageViewSunset: UIImageView = {

        var imageViewSunset = UIImageView()
        imageViewSunset.translatesAutoresizingMaskIntoConstraints = false
        imageViewSunset.image = UIImage(named: "sunset")
        imageViewSunset.contentMode = .scaleAspectFit
        imageViewSunset.isHidden = true
        return imageViewSunset
    }()

    

    private lazy var labelSunrise: UILabel = {

        var labelSunrise = UILabel()
        labelSunrise.textColor = .white
        labelSunrise.translatesAutoresizingMaskIntoConstraints = false
        labelSunrise.font = UIFont(name: "Rubik-Medium", size: 14)
        labelSunrise.numberOfLines = 0
        return labelSunrise
    }()


    private lazy var labelSunset: UILabel = {

        var labelSunset = UILabel()
        labelSunset.textColor = .white
        labelSunset.translatesAutoresizingMaskIntoConstraints = false
        labelSunset.font = UIFont(name: "Rubik-Medium", size: 14)
        labelSunset.numberOfLines = 0
        return labelSunset
    }()


    private lazy var labelMinMaxTemp: UILabel = {

        var labelMinMaxTemp = UILabel()
        labelMinMaxTemp.textColor = .white
        labelMinMaxTemp.translatesAutoresizingMaskIntoConstraints = false
        labelMinMaxTemp.font = UIFont(name: "Rubik-Regular", size: 16)
        labelMinMaxTemp.numberOfLines = 0
        return labelMinMaxTemp
    }()
    


    private lazy var labelTemp: UILabel = {

        var labelTemp = UILabel()
        labelTemp.textColor = .white
        labelTemp.translatesAutoresizingMaskIntoConstraints = false
        labelTemp.font = UIFont(name: "Rubik-Medium", size: 36)
        labelTemp.numberOfLines = 0
        return labelTemp
    }()


    private lazy var labelDescriptionWeather: UILabel = {

        var labelDescriptionWeather = UILabel()
        labelDescriptionWeather.textColor = .white
        labelDescriptionWeather.translatesAutoresizingMaskIntoConstraints = false
        labelDescriptionWeather.font = UIFont(name: "Rubik-Regular", size: 16)
        labelDescriptionWeather.numberOfLines = 0
        return labelDescriptionWeather
    }()



    private lazy var labelSpeedWind: UILabel = {

        var labelSpeedWind = UILabel()
        labelSpeedWind.textColor = .white
        labelSpeedWind.translatesAutoresizingMaskIntoConstraints = false
        labelSpeedWind.font = UIFont(name: "Rubik-Regular", size: 14)
        labelSpeedWind.numberOfLines = 0
        return labelSpeedWind
    }()



    private lazy var imageViewSpeedWind: UIImageView = {

        var imageViewSpeedWind = UIImageView()
        imageViewSpeedWind.translatesAutoresizingMaskIntoConstraints = false
        imageViewSpeedWind.image = UIImage(named: "wind")
        imageViewSpeedWind.contentMode = .scaleAspectFit
        return imageViewSpeedWind
    }()



    private lazy var labelCloudsPercent: UILabel = {

        var ViewCloudsPercent = UILabel()
        ViewCloudsPercent.textColor = .white
        ViewCloudsPercent.translatesAutoresizingMaskIntoConstraints = false
        ViewCloudsPercent.font = UIFont(name: "Rubik-Regular", size: 14)
        ViewCloudsPercent.numberOfLines = 0
        return ViewCloudsPercent
    }()



    private lazy var imageViewCloudsPercent: UIImageView = {

        var imageViewIcon = UIImageView()
        imageViewIcon.translatesAutoresizingMaskIntoConstraints = false
        imageViewIcon.image = UIImage(named: "clouds")
        imageViewIcon.contentMode = .scaleAspectFit
        return imageViewIcon
    }()



    private lazy var imageViewHumidity: UIImageView = {

        var imageViewHumidity = UIImageView()
        imageViewHumidity.translatesAutoresizingMaskIntoConstraints = false
        imageViewHumidity.image = UIImage(named: "rain")
        imageViewHumidity.contentMode = .scaleAspectFit
        return imageViewHumidity
    }()


    private lazy var labelHumidity: UILabel = {

        var labelHumidity = UILabel()
        labelHumidity.textColor = .white
        labelHumidity.translatesAutoresizingMaskIntoConstraints = false
        labelHumidity.font = UIFont(name: "Rubik-Regular", size: 14)
        labelHumidity.numberOfLines = 0
        return labelHumidity
    }()


    lazy var labelDate: UILabel = {

        var labelDate = UILabel()
        labelDate.textColor = UIColor(named: "#F6DD01")
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        labelDate.font = UIFont(name: "Rubik-Regular", size: 16)
        labelDate.numberOfLines = 0

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm, E dd MMMM"
        labelDate.text = dateFormatter.string(from: Date())

        return labelDate
    }()







    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)

        [   self.imageViewRainbow, self.imageViewSunrise, self.imageViewSunset, self.labelSunrise, self.labelSunset, self.labelMinMaxTemp, self.labelTemp, self.labelDescriptionWeather,  self.labelSpeedWind, self.imageViewSpeedWind, self.labelCloudsPercent, self.imageViewCloudsPercent, self.imageViewHumidity, self.labelHumidity, self.labelDate, self.activityIndicator ].forEach { self.addSubview($0) }

        self.setupLayoutConstrains()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setupLayoutConstrains() {
        NSLayoutConstraint.activate([

            self.activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),


            self.imageViewRainbow.topAnchor.constraint(equalTo: self.topAnchor, constant: 17),
            self.imageViewRainbow.leadingAnchor.constraint(equalTo: self.imageViewCloudsPercent.leadingAnchor, constant: -20),
            self.imageViewRainbow.trailingAnchor.constraint(equalTo: self.labelHumidity.trailingAnchor, constant: 30),

            self.imageViewSunrise.topAnchor.constraint(equalTo: self.imageViewRainbow.bottomAnchor, constant: 2),
            self.imageViewSunrise.centerXAnchor.constraint(equalTo: self.imageViewRainbow.leadingAnchor),
            self.imageViewSunrise.heightAnchor.constraint(equalToConstant: 20),
            self.imageViewSunrise.widthAnchor.constraint(equalToConstant: 20),

            self.labelSunrise.topAnchor.constraint(equalTo: self.imageViewSunrise.bottomAnchor, constant: 7),
            self.labelSunrise.centerXAnchor.constraint(equalTo: self.imageViewSunrise.centerXAnchor),

            self.imageViewSunset.topAnchor.constraint(equalTo: self.imageViewRainbow.bottomAnchor, constant: 2),
            self.imageViewSunset.centerXAnchor.constraint(equalTo: self.imageViewRainbow.trailingAnchor),
            self.imageViewSunset.heightAnchor.constraint(equalToConstant: 20),
            self.imageViewSunset.widthAnchor.constraint(equalToConstant: 20),

            self.labelSunset.topAnchor.constraint(equalTo: self.imageViewSunset.bottomAnchor, constant: 7),
            self.labelSunset.centerXAnchor.constraint(equalTo: self.imageViewSunset.centerXAnchor),

            self.labelMinMaxTemp.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            self.labelMinMaxTemp.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            self.labelTemp.topAnchor.constraint(equalTo: self.topAnchor, constant: 63),
            self.labelTemp.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            self.labelDescriptionWeather.topAnchor.constraint(equalTo: self.topAnchor, constant: 110),
            self.labelDescriptionWeather.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            self.labelSpeedWind.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
            self.labelSpeedWind.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 20),

            self.imageViewSpeedWind.trailingAnchor.constraint(equalTo: self.labelSpeedWind.leadingAnchor),
            self.imageViewSpeedWind.centerYAnchor.constraint(equalTo: self.labelSpeedWind.centerYAnchor),
            self.imageViewSpeedWind.heightAnchor.constraint(equalToConstant: 15),

            self.labelCloudsPercent.trailingAnchor.constraint(equalTo: self.imageViewSpeedWind.leadingAnchor, constant: -10),
            self.labelCloudsPercent.centerYAnchor.constraint(equalTo: self.labelSpeedWind.centerYAnchor),

            self.imageViewCloudsPercent.trailingAnchor.constraint(equalTo: self.labelCloudsPercent.leadingAnchor),
            self.imageViewCloudsPercent.centerYAnchor.constraint(equalTo: self.labelSpeedWind.centerYAnchor),
            self.imageViewCloudsPercent.heightAnchor.constraint(equalToConstant: 15),

            self.imageViewHumidity.leadingAnchor.constraint(equalTo: self.labelSpeedWind.trailingAnchor, constant: 15),
            self.imageViewHumidity.centerYAnchor.constraint(equalTo: self.labelSpeedWind.centerYAnchor),
            self.imageViewHumidity.heightAnchor.constraint(equalToConstant: 15),

            self.labelHumidity.leadingAnchor.constraint(equalTo: self.imageViewHumidity.trailingAnchor, constant: 5),
            self.labelHumidity.centerYAnchor.constraint(equalTo: self.labelSpeedWind.centerYAnchor),

            self.labelDate.topAnchor.constraint(equalTo: self.topAnchor, constant: 190),
            self.labelDate.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.labelDate.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30)

        ])
    }


    func setupCellNetwork(weatherModel: WeatherModel?) {



        let todayWeatherModel = weatherModel?.dateAndTimeAllWeatherForecast[0]

        let tepmMin = String(todayWeatherModel?.main.tempMin ?? 0)
        let tempMax = String(todayWeatherModel?.main.tempMax ?? 0)
        let  labelMinMaxTemp = "\(tepmMin)°/\(tempMax)°"
        self.labelMinMaxTemp.text = labelMinMaxTemp

        self.labelTemp.text = String(todayWeatherModel?.main.temp ?? 0)

        self.labelDescriptionWeather.text = String(todayWeatherModel?.weather[0].descriptionWeather ?? "")

        self.labelSpeedWind.text = String(todayWeatherModel?.wind.speedWind ?? 0) + " м/с"

        self.labelCloudsPercent.text = String(todayWeatherModel?.clouds.cloudsPercent ?? 0) + " %"

        self.labelHumidity.text = String(todayWeatherModel?.main.humidity ?? 0) + " %"

        let secondUnixSunrise = TimeInterval((weatherModel?.city.sunrise ?? 0) - (weatherModel?.city.timezone ?? 0))
        let sunriseNSDate = NSDate(timeIntervalSince1970: secondUnixSunrise)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let timeSunrise = dateFormatter.string(from: sunriseNSDate as Date)
        self.labelSunrise.text = timeSunrise

        let secondUnixSunset = TimeInterval((weatherModel?.city.sunset ?? 0) - (weatherModel?.city.timezone ?? 0))
        let sunsetNSDate = NSDate(timeIntervalSince1970: secondUnixSunset)
        let timeSunset = dateFormatter.string(from: sunsetNSDate as Date)
        self.labelSunset.text = timeSunset

        self.activityIndicator.stopAnimating()
        self.imageViewRainbow.isHidden = false
        self.imageViewSunrise.isHidden = false
        self.imageViewSunset.isHidden = false


    }


    func setupCellCoreData(nowWeather: WeatherForecastCoreData?) {

        self.activityIndicator.stopAnimating()

        let tepmMin = String(nowWeather?.tepmMin ?? 0)
        let tempMax = String(nowWeather?.tempMax ?? 0)
        let  labelMinMaxTemp = "\(tepmMin)°/\(tempMax)°"
        self.labelMinMaxTemp.text = labelMinMaxTemp

        self.labelTemp.text = String(nowWeather?.temp ?? 0) + "°"

        self.labelDescriptionWeather.text = String(nowWeather?.descriptionWeather ?? "")

        self.labelSpeedWind.text = String(nowWeather?.speedWind ?? 0) + " м/с"

        self.labelCloudsPercent.text = String(nowWeather?.cloudsPercent ?? 0) + " %"
        
        self.labelHumidity.text = String(nowWeather?.humidity ?? 0) + " %"

        let secondUnixSunrise = TimeInterval((nowWeather?.sunrise ?? 0) - (nowWeather?.timezone ?? 0))
        let sunriseNSDate = NSDate(timeIntervalSince1970: secondUnixSunrise)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let timeSunrise = dateFormatter.string(from: sunriseNSDate as Date)
        self.labelSunrise.text = timeSunrise

        let secondUnixSunset = TimeInterval((nowWeather?.sunset ?? 0) - (nowWeather?.timezone ?? 0))
        let sunsetNSDate = NSDate(timeIntervalSince1970: secondUnixSunset)
        let timeSunset = dateFormatter.string(from: sunsetNSDate as Date)
        self.labelSunset.text = timeSunset

        self.imageViewRainbow.isHidden = false
        self.imageViewSunrise.isHidden = false
        self.imageViewSunset.isHidden = false
    }
}



extension MainTopTableViewCell: CellNameProtocol {

    static var nameCell: String {
        return String(describing: self)
    }
}
