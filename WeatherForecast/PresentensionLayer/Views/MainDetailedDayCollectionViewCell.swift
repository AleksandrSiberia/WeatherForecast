//
//  MainDetailedDayCollectionViewCell.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 24.11.2022.
//

import UIKit

class MainDetailedDayCollectionViewCell: UICollectionViewCell {


    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .yellow
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setupCollectionCellCoreData(dayForecast: [WeatherForecastCoreData]? )  {

    }
}




extension MainDetailedDayCollectionViewCell: CellNameProtocol {

    static var nameCell: String {
        return String(describing: self)
    }
}
