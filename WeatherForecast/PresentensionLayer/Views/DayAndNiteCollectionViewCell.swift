//
//  DayAndNiteCollectionViewCell.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 02.12.2022.
//

import UIKit

class DayAndNiteCollectionViewCell: UICollectionViewCell {




    override init(frame: CGRect) {
        super.init(frame: frame)

        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 22
        self.contentView.layer.borderWidth = 0.3
        self.contentView.layer.borderColor = UIColor.black.cgColor

        [ ].forEach { self.contentView.addSubview($0) }

        self.setupLayoutConstraints()
    }



    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setupLayoutConstraints() {
        NSLayoutConstraint.activate([

        ])
    }


    func setupCollectionCellCoreData(forecast: WeatherForecastCoreData?)  {
        
        
    }

}


extension DayAndNiteCollectionViewCell: CellNameProtocol {

    static var nameCell: String {
        return String(describing: self)
    }
}
