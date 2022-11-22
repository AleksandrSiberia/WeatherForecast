//
//  MainTopTableViewCell.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 21.11.2022.
//

import UIKit

class MainTopTableViewCell: UITableViewCell {


//    var nowWeather: WeatherForecastCoreData?


    private lazy var labelMinMaxTemp: UILabel = {

        var labelMinMaxTemp = UILabel()
        labelMinMaxTemp.textColor = .white
        labelMinMaxTemp.translatesAutoresizingMaskIntoConstraints = false
        labelMinMaxTemp.font = UIFont(name: "Rubik-Regular", size: 16)
        return labelMinMaxTemp
    }()
    


    private lazy var labelTemp: UILabel = {

        var labelTemp = UILabel()
        labelTemp.textColor = .white
        labelTemp.translatesAutoresizingMaskIntoConstraints = false
        labelTemp.font = UIFont(name: "Rubik-Medium", size: 36)
        return labelTemp
    }()


    private lazy var labelDescriptionWeather: UILabel = {

        var labelDescriptionWeather = UILabel()
        labelDescriptionWeather.textColor = .white
        labelDescriptionWeather.translatesAutoresizingMaskIntoConstraints = false
        labelDescriptionWeather.font = UIFont(name: "Rubik-Regular", size: 16)
        return labelDescriptionWeather
    }()



    private lazy var labelSpeedWind: UILabel = {

        var labelSpeedWind = UILabel()
        labelSpeedWind.textColor = .white
        labelSpeedWind.translatesAutoresizingMaskIntoConstraints = false
        labelSpeedWind.font = UIFont(name: "Rubik-Regular", size: 14)
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
        return labelHumidity
    }()





    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)

        [self.labelMinMaxTemp, self.labelTemp, self.labelDescriptionWeather,  self.labelSpeedWind, self.imageViewSpeedWind, self.labelCloudsPercent, self.imageViewCloudsPercent, self.imageViewHumidity, self.labelHumidity ].forEach { self.addSubview($0) }

        self.setupLayoutConstrains()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setupLayoutConstrains() {
        NSLayoutConstraint.activate([
            self.labelMinMaxTemp.topAnchor.constraint(equalTo: self.topAnchor, constant: 33),
            self.labelMinMaxTemp.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            self.labelTemp.topAnchor.constraint(equalTo: self.labelMinMaxTemp.bottomAnchor, constant: 5),
            self.labelTemp.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            self.labelDescriptionWeather.topAnchor.constraint(equalTo: self.labelTemp.bottomAnchor, constant: 5),
            self.labelDescriptionWeather.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            self.labelSpeedWind.topAnchor.constraint(equalTo: self.labelDescriptionWeather.bottomAnchor, constant: 15),
            self.labelSpeedWind.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 12),

            self.imageViewSpeedWind.trailingAnchor.constraint(equalTo: self.labelSpeedWind.leadingAnchor),
            self.imageViewSpeedWind.centerYAnchor.constraint(equalTo: self.labelSpeedWind.centerYAnchor),
            self.imageViewSpeedWind.heightAnchor.constraint(equalToConstant: 20),

            self.labelCloudsPercent.trailingAnchor.constraint(equalTo: self.imageViewSpeedWind.leadingAnchor, constant: -10),
            self.labelCloudsPercent.centerYAnchor.constraint(equalTo: self.labelSpeedWind.centerYAnchor),

            self.imageViewCloudsPercent.trailingAnchor.constraint(equalTo: self.labelCloudsPercent.leadingAnchor),
            self.imageViewCloudsPercent.centerYAnchor.constraint(equalTo: self.labelSpeedWind.centerYAnchor),
            self.imageViewCloudsPercent.heightAnchor.constraint(equalToConstant: 20),

            self.imageViewHumidity.leadingAnchor.constraint(equalTo: self.labelSpeedWind.trailingAnchor, constant: 20),
            self.imageViewHumidity.centerYAnchor.constraint(equalTo: self.labelSpeedWind.centerYAnchor),
            self.imageViewHumidity.heightAnchor.constraint(equalToConstant: 30),

            self.labelHumidity.leadingAnchor.constraint(equalTo: self.imageViewHumidity.trailingAnchor, constant: 5),
            self.labelHumidity.centerYAnchor.constraint(equalTo: self.labelSpeedWind.centerYAnchor),



            self.labelSpeedWind.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -21)

        ])
    }


    func setupCell(nowWeather: WeatherForecastCoreData?) {


        let tepmMin = String(nowWeather?.tepmMin ?? 0)
        let tempMax = String(nowWeather?.tempMax ?? 0)
        let  labelMinMaxTemp = "\(tepmMin)°/\(tempMax)°"

        self.labelMinMaxTemp.text = labelMinMaxTemp

        self.labelTemp.text = String(nowWeather?.temp ?? 0) + "°"

        self.labelDescriptionWeather.text = String(nowWeather?.descriptionWeather ?? "")

        self.labelSpeedWind.text = String(nowWeather?.speedWind ?? 0) + " м/с"

        self.labelCloudsPercent.text = String(nowWeather?.cloudsPercent ?? 0) + " %"

        self.labelHumidity.text = String(nowWeather?.humidity ?? 0) + " %"


    }

}

extension MainTopTableViewCell: CellNameProtocol {

    static var nameCell: String {
        return String(describing: self)
    }
}
