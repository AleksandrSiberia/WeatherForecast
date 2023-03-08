//
//  DayDetailTopForecastCollectionViewCell.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 28.11.2022.
//

import UIKit

class DayDetailTopForecastCollectionViewCell: UICollectionViewCell {

    var temp: Float = 0


    private lazy var labelTemp: UILabel = {

        var labelTemp = UILabel()
        labelTemp.textColor = UIColor(named: "#272722")
        labelTemp.translatesAutoresizingMaskIntoConstraints = false
        labelTemp.font = UIFont(name: "Rubik-Regular", size: 16)
        labelTemp.numberOfLines = 0
        return labelTemp
    }()



    private lazy var viewTempIndicator: UIView = {

        var viewTempIndicator = UIView()

        viewTempIndicator.translatesAutoresizingMaskIntoConstraints = false
        return viewTempIndicator
    }()



    private lazy var viewBlackLine: UIView = {

        var viewBlackLine = UIView()

        viewBlackLine.translatesAutoresizingMaskIntoConstraints = false
        viewBlackLine.backgroundColor = .black
        return viewBlackLine
    }()


    private lazy var imageIcon: UIImageView = {

        var imageIcon = UIImageView()
        imageIcon.translatesAutoresizingMaskIntoConstraints = false
        imageIcon.contentMode = .scaleAspectFit
        return imageIcon
    }()


    private lazy var labelHumidity: UILabel = {

        var labelHumidity = UILabel()
        labelHumidity.textColor = UIColor(named: "#204EC7")
        labelHumidity.translatesAutoresizingMaskIntoConstraints = false
        labelHumidity.font = UIFont(name: "Rubik-Regular", size: 14)
        labelHumidity.numberOfLines = 0
        return labelHumidity
    }()



    private lazy var labelTime: UILabel = {

        var labelTime = UILabel()
        labelTime.textColor = UIColor(named: "#272722")
        labelTime.translatesAutoresizingMaskIntoConstraints = false
        labelTime.font = UIFont(name: "Rubik-Regular", size: 14)
        labelTime.numberOfLines = 0
        return labelTime
    }()



    override init(frame: CGRect) {
        super.init(frame: frame)


        contentView.backgroundColor = .white
        layer.masksToBounds = true

        [self.viewTempIndicator, self.viewBlackLine, self.labelTime, self.labelHumidity, self.imageIcon, self.labelTemp ].forEach { self.contentView.addSubview($0) }

        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 22
        self.contentView.layer.borderWidth = 0.3
        self.contentView.layer.borderColor = UIColor.black.cgColor

        self.setupLayoutConstraints()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func layoutSubviews() {
        super.layoutSubviews()


        let heightItem = self.contentView.frame.height


        if self.temp > 0 {

            self.viewTempIndicator.backgroundColor = UIColor(named: "beige")


            NSLayoutConstraint.activate([



                self.viewTempIndicator.bottomAnchor.constraint(equalTo: self.contentView.topAnchor, constant: heightItem / 2),
                self.viewTempIndicator.heightAnchor.constraint(equalToConstant: CGFloat(self.temp * 2.4)),

                self.viewTempIndicator.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                self.viewTempIndicator.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),


            ])
        }
        else {

            self.viewTempIndicator.backgroundColor = UIColor(named: "blue")

            NSLayoutConstraint.activate([

                self.viewTempIndicator.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: heightItem / 2),
                self.viewTempIndicator.bottomAnchor.constraint(equalTo: self.contentView.topAnchor, constant: (heightItem / 2) - CGFloat(self.temp * 2.4)),

                self.viewTempIndicator.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
                self.viewTempIndicator.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),

            ])
        }
    }
    


    func setupLayoutConstraints() {

        _ = self.layer.frame.height

        NSLayoutConstraint.activate([


            self.viewBlackLine.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.viewBlackLine.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.viewBlackLine.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.viewBlackLine.heightAnchor.constraint(equalToConstant: 1),

            self.labelTime.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.labelTime.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),

            self.labelHumidity.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.labelHumidity.bottomAnchor.constraint(equalTo: self.labelTime.topAnchor, constant: -6),

            self.imageIcon.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            self.imageIcon.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.imageIcon.heightAnchor.constraint(equalToConstant: 35),
            self.imageIcon.widthAnchor.constraint(equalToConstant: 35),

            self.labelTemp.topAnchor.self.constraint(equalTo: self.imageIcon.bottomAnchor, constant: 2),
            self.labelTemp.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),

        ])
    }



    func changeTemp(temp: Float?) -> String {

        let changeType = (temp ?? 273.0) - 273.0
        let roundTemp = round(changeType * 10.0) / 10.0
        let roundTempString = String(roundTemp)
        return roundTempString
    }



    func setupCollectionCellCoreData(forecast: WeatherForecastCoreData?) {


        self.temp = (Float(self.changeTemp(temp: forecast?.temp)) ??  0)

        
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let dateDate = dateFormatter.date(from: forecast?.date ?? "") ?? Date()

        dateFormatter.dateFormat = "\(SettingService.shared.changeDate()):mm"

        let dateString = dateFormatter.string(from: dateDate)

        self.labelTime.text = dateString


        self.labelHumidity.text = String(forecast?.humidity ?? 0) + " %"


        self.imageIcon.image = UIImage(named: forecast?.icon ?? "")

        
        self.labelTemp.text = SettingService.shared.changeTemp(temp: forecast?.temp) + "°"
    }
}



extension DayDetailTopForecastCollectionViewCell: CellNameProtocol {

    static var nameCell: String {
        return String(describing: self)
    }
}
