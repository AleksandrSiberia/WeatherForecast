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
        labelTemp.font = UIFont(name: "Rubik-Regular", size: 16)
        return labelTemp
    }()



    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)

        [self.labelMinMaxTemp, self.labelTemp].forEach { self.addSubview($0) }

        self.setupLayoutConstrains()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setupLayoutConstrains() {
        NSLayoutConstraint.activate([
            self.labelMinMaxTemp.topAnchor.constraint(equalTo: self.topAnchor, constant: 33),
            self.labelMinMaxTemp.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }


    func setupCell(nowWeather: WeatherForecastCoreData?) {

  //      self.nowWeather = nowWeather

        let tepmMin = String(nowWeather?.tepmMin ?? 0.0)
        let tempMax = String(nowWeather?.tempMax ?? 0.0)
        let  labelMinMaxTemp = "\(tepmMin)°/\(tempMax)°"

        self.labelMinMaxTemp.text = labelMinMaxTemp


    }

}

extension MainTopTableViewCell: CellNameProtocol {

    static var nameCell: String {
        return String(describing: self)
    }
}
