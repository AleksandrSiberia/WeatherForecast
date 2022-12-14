//
//  DayDetailForecastTableViewCell.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 27.11.2022.
//

import UIKit

class DayDetailForecastTableViewCell: UITableViewCell {


    private lazy var labelDate: UILabel = {

        var labelDate = UILabel()
        labelDate.textColor = UIColor(named: "#272722")
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        labelDate.font = UIFont(name: "Rubik-Medium", size: 18)
        labelDate.numberOfLines = 0
        return labelDate
    }()




    private lazy var labelTame: UILabel = {

        var labelTame = UILabel()
        labelTame.textColor = UIColor(named: "#9A9696")
        labelTame.translatesAutoresizingMaskIntoConstraints = false
        labelTame.font = UIFont(name: "Rubik-Regular", size: 14)
        labelTame.numberOfLines = 0
        return labelTame
    }()




    private lazy var imageFeel: UIImageView = {

        var imageFeel = UIImageView()
        imageFeel.translatesAutoresizingMaskIntoConstraints = false
        imageFeel.image = UIImage(named: "feel")
        imageFeel.contentMode = .scaleAspectFit
        return imageFeel
    }()



    private lazy var labelFeel: UILabel = {

        var labelFeel = UILabel()
        labelFeel.text = "По ощущению"
        labelFeel.textColor = UIColor(named: "#272722")
        labelFeel.translatesAutoresizingMaskIntoConstraints = false
        labelFeel.font = UIFont(name: "Rubik-Regular", size: 14)
        labelFeel.numberOfLines = 0
        return labelFeel
    }()



    private lazy var labelFeelValue: UILabel = {

        var labelFeelValue = UILabel()
        labelFeelValue.text = "По ощущению"
        labelFeelValue.textColor = UIColor(named: "#9A9696")
        labelFeelValue.translatesAutoresizingMaskIntoConstraints = false
        labelFeelValue.font = UIFont(name: "Rubik-Regular", size: 14)
        labelFeelValue.numberOfLines = 0
        return labelFeelValue
    }()





    private lazy var imageViewSpeedWind: UIImageView = {

        var imageViewSpeedWind = UIImageView()
        imageViewSpeedWind.translatesAutoresizingMaskIntoConstraints = false
        imageViewSpeedWind.image = UIImage(named: "wind")
        imageViewSpeedWind.contentMode = .scaleAspectFit
        return imageViewSpeedWind
    }()



    private lazy var labelSpeedWind: UILabel = {

        var labelSpeedWind = UILabel()
        labelSpeedWind.text = "Ветер"
        labelSpeedWind.textColor = UIColor(named: "#272722")
        labelSpeedWind.translatesAutoresizingMaskIntoConstraints = false
        labelSpeedWind.font = UIFont(name: "Rubik-Regular", size: 14)
        labelSpeedWind.numberOfLines = 0
        return labelSpeedWind
    }()



    private lazy var labelSpeedWindValue: UILabel = {

        var labelWindValue = UILabel()
        labelWindValue.text = "По ощущению"
        labelWindValue.textColor = UIColor(named: "#9A9696")
        labelWindValue.translatesAutoresizingMaskIntoConstraints = false
        labelWindValue.font = UIFont(name: "Rubik-Regular", size: 14)
        labelWindValue.numberOfLines = 0
        return labelWindValue
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
        labelHumidity.text = "Атмосферные осадки"
        labelHumidity.textColor = UIColor(named: "#272722")
        labelHumidity.translatesAutoresizingMaskIntoConstraints = false
        labelHumidity.font = UIFont(name: "Rubik-Regular", size: 14)
        labelHumidity.numberOfLines = 0
        return labelHumidity
    }()


    private lazy var labelHumidityValue: UILabel = {

        var labelHumidityValue = UILabel()
        labelHumidityValue.text = "По ощущению"
        labelHumidityValue.textColor = UIColor(named: "#9A9696")
        labelHumidityValue.translatesAutoresizingMaskIntoConstraints = false
        labelHumidityValue.font = UIFont(name: "Rubik-Regular", size: 14)
        labelHumidityValue.numberOfLines = 0
        return labelHumidityValue
    }()


    private lazy var imageViewCloudsPercent: UIImageView = {

        var imageViewIcon = UIImageView()
        imageViewIcon.translatesAutoresizingMaskIntoConstraints = false
        imageViewIcon.image = UIImage(named: "clouds")
        imageViewIcon.contentMode = .scaleAspectFit
        return imageViewIcon
    }()



    private lazy var labelCloudsPercent: UILabel = {

        var labelCloudsPercent = UILabel()
        labelCloudsPercent.text = "Облачность"
        labelCloudsPercent.textColor = UIColor(named: "#272722")
        labelCloudsPercent.translatesAutoresizingMaskIntoConstraints = false
        labelCloudsPercent.font = UIFont(name: "Rubik-Regular", size: 14)
        labelCloudsPercent.numberOfLines = 0
        return labelCloudsPercent
    }()


    private lazy var labelCloudsPercentValue: UILabel = {

        var labelCloudsPercentValue = UILabel()
        labelCloudsPercentValue.text = "По ощущению"
        labelCloudsPercentValue.textColor = UIColor(named: "#9A9696")
        labelCloudsPercentValue.translatesAutoresizingMaskIntoConstraints = false
        labelCloudsPercentValue.font = UIFont(name: "Rubik-Regular", size: 14)
        labelCloudsPercentValue.numberOfLines = 0
        return labelCloudsPercentValue
    }()



    private lazy var labelTemp: UILabel = {

        var labelTemp = UILabel()
        labelTemp.textColor = UIColor(named: "#272722")
        labelTemp.translatesAutoresizingMaskIntoConstraints = false
        labelTemp.font = UIFont(name: "Rubik-Medium", size: 18)
        labelTemp.numberOfLines = 0
        return labelTemp
    }()







    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)


        [ self.labelDate, self.labelTame, self.labelTemp, self.imageFeel, self.labelFeel, self.labelFeelValue,  self.imageViewSpeedWind, self.labelSpeedWind, self.labelSpeedWindValue, self.imageViewHumidity, self.labelHumidity, self.labelHumidityValue, self.imageViewCloudsPercent, self.labelCloudsPercent, self.labelCloudsPercentValue, ].forEach { self.contentView.addSubview($0) }

        setupLayoutConstrains()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setupLayoutConstrains() {

        NSLayoutConstraint.activate([

            self.labelDate.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            self.labelDate.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),

            self.labelTame.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 50),
            self.labelTame.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),

            self.labelTemp.topAnchor.constraint(equalTo: self.labelTame.bottomAnchor, constant: 10),
            self.labelTemp.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),

            self.imageFeel.centerYAnchor.constraint(equalTo: self.labelTame.centerYAnchor),
            self.imageFeel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 80),
            self.imageFeel.widthAnchor.constraint(equalToConstant: 12),
            self.imageFeel.heightAnchor.constraint(equalToConstant: 12),

            self.labelFeel.centerYAnchor.constraint(equalTo: self.imageFeel.centerYAnchor),
            self.labelFeel.leadingAnchor.constraint(equalTo: self.imageFeel.trailingAnchor, constant: 12),

            self.labelFeelValue.centerYAnchor.constraint(equalTo: self.labelFeel.centerYAnchor),
            self.labelFeelValue.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),

            self.imageViewSpeedWind.topAnchor.constraint(equalTo: self.imageFeel.bottomAnchor, constant: 10),
            self.imageViewSpeedWind.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 75),
            self.imageViewSpeedWind.widthAnchor.constraint(equalToConstant: 18),
            self.imageViewSpeedWind.heightAnchor.constraint(equalToConstant: 18),

            self.labelSpeedWind.centerYAnchor.constraint(equalTo: self.imageViewSpeedWind.centerYAnchor),
            self.labelSpeedWind.leadingAnchor.constraint(equalTo: self.imageViewSpeedWind.trailingAnchor, constant: 12),

            self.labelSpeedWindValue.centerYAnchor.constraint(equalTo: self.labelSpeedWind.centerYAnchor),
            self.labelSpeedWindValue.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),

            self.imageViewHumidity.topAnchor.constraint(equalTo: self.imageViewSpeedWind.bottomAnchor, constant: 10),
            self.imageViewHumidity.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 77),
            self.imageViewHumidity.widthAnchor.constraint(equalToConstant: 15),
            self.imageViewHumidity.heightAnchor.constraint(equalToConstant: 15),

            self.labelHumidity.centerYAnchor.constraint(equalTo: self.imageViewHumidity.centerYAnchor),
            self.labelHumidity.leadingAnchor.constraint(equalTo: self.imageViewHumidity.trailingAnchor, constant: 12),

            self.labelHumidityValue.centerYAnchor.constraint(equalTo: self.labelHumidity.centerYAnchor),
            self.labelHumidityValue.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),

            self.imageViewCloudsPercent.topAnchor.constraint(equalTo: self.imageViewHumidity.bottomAnchor, constant: 10),
            self.imageViewCloudsPercent.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 77),
            self.imageViewCloudsPercent.widthAnchor.constraint(equalToConstant: 15),
            self.imageViewCloudsPercent.heightAnchor.constraint(equalToConstant: 15),
            self.imageViewCloudsPercent.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),

            self.labelCloudsPercent.centerYAnchor.constraint(equalTo: self.imageViewCloudsPercent.centerYAnchor),
            self.labelCloudsPercent.leadingAnchor.constraint(equalTo: self.imageViewCloudsPercent.trailingAnchor, constant: 12),

            self.labelCloudsPercentValue.centerYAnchor.constraint(equalTo: self.labelCloudsPercent.centerYAnchor),
            self.labelCloudsPercentValue.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),

        ])
    }



    func changeTemp(temp: Float?) -> String {

        let changeType = (temp ?? 273.0) - 273.0
        let roundTemp = round(changeType * 10.0) / 10.0
        let roundTempString = String(roundTemp)

        return roundTempString
    }


    func setupCell(dayForecast: WeatherForecastCoreData?) {

        
        let dateFormatter = DateFormatter()

        let dateString = dayForecast?.date ?? ""

        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let dateDate = dateFormatter.date(from: dateString) ?? Date()

        dateFormatter.dateFormat = "E dd/MM"

        let labelDate = dateFormatter.string(from: dateDate)

        self.labelDate.text = labelDate



        dateFormatter.dateFormat = "\(SettingService.shared.changeDate()):mm"

        let labelTime = dateFormatter.string(from: dateDate)

        self.labelTame.text = labelTime


        self.labelTemp.text = SettingService.shared.changeTemp(temp: dayForecast?.temp) + "°"


        self.labelFeelValue.text = SettingService.shared.changeTemp(temp: dayForecast?.feelsLike) + "°"


        self.labelSpeedWindValue.text = SettingService.shared.changeSpeedWind(float: dayForecast?.speedWind)


        self.labelHumidityValue.text = String(dayForecast?.humidity ?? 0 ) + " %"


        self.labelCloudsPercentValue.text = String(dayForecast?.cloudsPercent ?? 0) + " %"

    }
}



extension DayDetailForecastTableViewCell: CellNameProtocol {

    static var nameCell: String {
        String(describing: self)
    }

}
