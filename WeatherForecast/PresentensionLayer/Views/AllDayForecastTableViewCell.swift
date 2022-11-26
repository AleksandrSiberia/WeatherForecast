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
        labelDate.textColor = UIColor(named: "#9A9696")
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



    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        [ self.labelDate, self.imageViewIconWeather ].forEach { self.contentView.addSubview($0) }

        setupLayoutConstrains()


    }




    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }




    func setupLayoutConstrains() {

        NSLayoutConstraint.activate([

            self.labelDate.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            self.labelDate.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),

            self.imageViewIconWeather.topAnchor.constraint(equalTo: self.labelDate.bottomAnchor, constant: 1),
            self.imageViewIconWeather.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            self.imageViewIconWeather.heightAnchor.constraint(equalToConstant: 30),
            self.imageViewIconWeather.widthAnchor.constraint(equalToConstant: 30),
            self.imageViewIconWeather.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -6)

        ])
    }



    func setupCell(dayForecast: [WeatherForecastCoreData]? ) {

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
    }



}


extension AllDayForecastTableViewCell: CellNameProtocol {

    static var nameCell: String {
        String(describing: self)
    }



}
