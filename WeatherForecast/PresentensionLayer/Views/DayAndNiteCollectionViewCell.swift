//
//  DayAndNiteCollectionViewCell.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 02.12.2022.
//

import UIKit

class DayAndNiteCollectionViewCell: UICollectionViewCell {



    private lazy var labelDate: UILabel = {

        var labelDate = UILabel()
        labelDate.textColor = UIColor(named: "#272722")
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        labelDate.font = UIFont(name: "Rubik-Regular", size: 18)
        labelDate.numberOfLines = 0

        return labelDate
    }()



    override init(frame: CGRect) {
        super.init(frame: frame)

  
        self.contentView.layer.cornerRadius = 12
        self.contentView.clipsToBounds = true
        self.contentView.layer.borderWidth = 4
        self.contentView.layer.borderColor = UIColor.white.cgColor

        [self.labelDate].forEach { self.contentView.addSubview($0) }

        self.setupLayoutConstraints()
    }



    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    func setupLayoutConstraints() {
        NSLayoutConstraint.activate([

            self.labelDate.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.labelDate.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
        ])
    }


    func checkLabelColor() {

        self.labelDate.textColor = .white
    }

    

    func setupCollectionCellCoreData(forecast: [WeatherForecastCoreData]?)  {

        if let forecast {

            if forecast.count >= 1 {

                let dateString = forecast.first?.date ?? ""

                let dateFormatter = DateFormatter()

                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

                let dateDate = dateFormatter.date(from: dateString) ?? Date()

                dateFormatter.dateFormat = "dd/MM E"

                let labelString = dateFormatter.string(from: dateDate)

                self.labelDate.text = labelString

            }
        }
    }

}


extension DayAndNiteCollectionViewCell: CellNameProtocol {

    static var nameCell: String {
        return String(describing: self)
    }
}
