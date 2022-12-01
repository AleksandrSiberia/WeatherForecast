//
//  DayAndNiteTableViewCell.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 01.12.2022.
//

import UIKit

class DayAndNiteTableViewCell: UITableViewCell {





    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    
    func setupCell(dayOrNiteForecast: [WeatherForecastCoreData]?, indexPathRow: Int?) {

        
        if indexPathRow == 0 {

            let day = dayOrNiteForecast?.filter { $0.dayOrNite == "d" }

            if let day {

                print("🪀", day[0].date)
            }

        }

        if indexPathRow == 1 {

            let nite = dayOrNiteForecast?.filter { $0.dayOrNite == "n" }

            if let nite {

                print("🏋🏻", nite[0].date)
            }
        }


    }

}



extension DayAndNiteTableViewCell: CellNameProtocol {
    static var nameCell: String {

        String(describing: self)
    }



}
