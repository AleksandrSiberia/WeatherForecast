//
//  DayDetailTopForecastCollectionViewCell.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 28.11.2022.
//

import UIKit

class DayDetailTopForecastCollectionViewCell: UICollectionViewCell {


    


    private lazy var viewTempIndicator: UIView = {

        var viewTempIndicator = UIView()
        viewTempIndicator.backgroundColor = .blue
        return viewTempIndicator
    }()



    private lazy var labelTemp: UILabel = {

        var labelTemp = UILabel()
        labelTemp.textColor = UIColor(named: "#272722")
        labelTemp.translatesAutoresizingMaskIntoConstraints = false
        labelTemp.font = UIFont(name: "Rubik-Medium", size: 18)
        labelTemp.numberOfLines = 0
        return labelTemp
    }()


    private lazy var labelTime: UILabel = {

        var labelTime = UILabel()
        labelTime.textColor = UIColor(named: "#272722")
        labelTime.translatesAutoresizingMaskIntoConstraints = false
        labelTime.font = UIFont(name: "Rubik-Medium", size: 18)
        labelTime.numberOfLines = 0
        return labelTime
    }()



    override init(frame: CGRect) {
        super.init(frame: frame)


        [self.labelTime].forEach { self.contentView.addSubview($0) }

        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 22
        self.contentView.layer.borderWidth = 0.3
        self.contentView.layer.borderColor = UIColor.black.cgColor

        self.setupLayoutConstraints()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }






    func setupLayoutConstraints() {

        print("🛍️", self.layer.frame.height)


        let heightItem = self.layer.frame.height


        NSLayoutConstraint.activate([




        ])

    }


    func setupCollectionCellCoreData(forecast: WeatherForecastCoreData?) {

        
    }



    
}

extension DayDetailTopForecastCollectionViewCell: CellNameProtocol {

    static var nameCell: String {
        return String(describing: self)
    }
}
