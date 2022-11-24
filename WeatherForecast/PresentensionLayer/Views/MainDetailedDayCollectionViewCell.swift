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


    

    override init(frame: CGRect) {
        super.init(frame: frame)

   //     self.contentView.backgroundColor = .yellow
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 25
        self.contentView.layer.borderWidth = 0.3
        self.contentView.layer.borderColor = UIColor.black.cgColor

        [ self.labelTimeForecast].forEach { self.contentView.addSubview($0) }

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

            self.labelTimeForecast.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 2),
            self.labelTimeForecast.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),

            self.labelTimeForecast.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -13)

        ])
    }


    
    func setupCollectionCellCoreData(dayForecast: WeatherForecastCoreData?)  {

        let stringDate = dayForecast?.date ?? ""

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

        print("⌚️", time)





    }
}




extension MainDetailedDayCollectionViewCell: CellNameProtocol {

    static var nameCell: String {
        return String(describing: self)
    }
}
