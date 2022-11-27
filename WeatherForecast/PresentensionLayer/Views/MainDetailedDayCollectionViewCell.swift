//
//  MainDetailedDayCollectionViewCell.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 24.11.2022.
//

import UIKit

class MainDetailedDayCollectionViewCell: UICollectionViewCell {


    private lazy var labelTimeForecast: UILabel = {

        var labelTimeForecast = UILabel()
        labelTimeForecast.textColor = .black
        labelTimeForecast.translatesAutoresizingMaskIntoConstraints = false
        labelTimeForecast.font = UIFont(name: "Rubik-Regular", size: 14)
        labelTimeForecast.numberOfLines = 0
        return labelTimeForecast
    }()




    private lazy var imageViewIconWeather: UIImageView = {

        var imageViewIconWeather = UIImageView()
        imageViewIconWeather.translatesAutoresizingMaskIntoConstraints = false
        imageViewIconWeather.contentMode = .scaleAspectFit
        return imageViewIconWeather
    }()
    



    private lazy var labelTempForecast: UILabel = {

        var labelTempForecast = UILabel()
        labelTempForecast.textColor = .black
        labelTempForecast.translatesAutoresizingMaskIntoConstraints = false
        labelTempForecast.font = UIFont(name: "Rubik-Regular", size: 16)
        labelTempForecast.numberOfLines = 0
        return labelTempForecast
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 22
        self.contentView.layer.borderWidth = 0.3
        self.contentView.layer.borderColor = UIColor.black.cgColor

        [ self.labelTimeForecast, self.imageViewIconWeather, self.labelTempForecast].forEach { self.contentView.addSubview($0) }

        self.setupLayoutConstraints()
    }



    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func layoutSubviews() {
        super.layoutSubviews()

    }


    func setupLayoutConstraints() {
        NSLayoutConstraint.activate([


            self.labelTimeForecast.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),

            self.imageViewIconWeather.topAnchor.constraint(equalTo: self.labelTimeForecast.bottomAnchor, constant: 4),
            self.imageViewIconWeather.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.imageViewIconWeather.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.imageViewIconWeather.heightAnchor.constraint(equalToConstant: 50),

            self.labelTempForecast.topAnchor.constraint(equalTo: self.imageViewIconWeather.bottomAnchor, constant: 4),
            self.labelTempForecast.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        ])
    }


 



    
    func setupCollectionCellCoreData(forecast: WeatherForecastCoreData?)  {

        let stringDate = forecast?.date ?? ""

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        guard let dateDate = dateFormatter.date(from: stringDate)

        else {
            self.labelTimeForecast.text = ""
            return
        }

        dateFormatter.dateFormat = "HH:mm"
        let time = dateFormatter.string(from: dateDate)
        self.labelTimeForecast.text = time


        self.imageViewIconWeather.image = UIImage(named: forecast?.icon ?? "")

        self.labelTempForecast.text = String(forecast?.temp ?? 0)

    }
}




extension MainDetailedDayCollectionViewCell: CellNameProtocol {

    static var nameCell: String {
        return String(describing: self)
    }
}
