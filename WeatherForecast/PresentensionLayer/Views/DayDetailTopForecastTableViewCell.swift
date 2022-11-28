//
//  DayDetailTopForecastTableViewCell.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 28.11.2022.
//

import UIKit

class DayDetailTopForecastTableViewCell: UITableViewCell {

    var dayForecastCoreData: [WeatherForecastCoreData]?


    
    var itemCount = 5.0


    private lazy var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        var collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.minimumInteritemSpacing = 16
        collectionViewFlowLayout.sectionInset.left = 16
        collectionViewFlowLayout.sectionInset.bottom = 16

        return collectionViewFlowLayout
    }()


    private lazy var collectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: self.collectionViewFlowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DayDetailTopForecastCollectionViewCell.self , forCellWithReuseIdentifier: DayDetailTopForecastCollectionViewCell.nameCell)
        collectionView.translatesAutoresizingMaskIntoConstraints = false


        return collectionView

    }()




    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.contentView.addSubview(self.collectionView)

        NSLayoutConstraint.activate([

        self.collectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 24),
        self.collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
        self.collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        self.collectionView.heightAnchor.constraint(equalToConstant: self.getSizeItem().height + self.collectionViewFlowLayout.sectionInset.bottom),
        self.collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),

        ])
    }



    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func setupCellCoreData(dayForecast: [WeatherForecastCoreData]?) {

        self.dayForecastCoreData = dayForecast

        self.collectionView.reloadData()
    }




    func getSizeItem() -> CGSize {

        let screenWidth = UIScreen.main.bounds.width

        let itemSpacing = self.collectionViewFlowLayout.minimumInteritemSpacing

        let itemSpacingCount = self.itemCount - 1.0

        let itemWidth = (screenWidth - self.collectionViewFlowLayout.sectionInset.left - (itemSpacing * itemSpacingCount)) / self.itemCount


        let itemCGSize = CGSize(width: itemWidth, height: itemWidth * 2)

        return itemCGSize

    }
}



extension DayDetailTopForecastTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {



        guard self.dayForecastCoreData != nil && self.dayForecastCoreData?.isEmpty == false

        else {

            return 0
        }

        guard (self.dayForecastCoreData?.count ?? 0) >= 9
        else {

            return self.dayForecastCoreData?.count ?? 0
        }

        return 9


    }



    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: DayDetailTopForecastCollectionViewCell.nameCell, for: indexPath) as? DayDetailTopForecastCollectionViewCell
        else {
            return UICollectionViewCell()
        }


        guard self.dayForecastCoreData != nil

        else {
            return cell
        }


        cell.setupCollectionCellCoreData(forecast: self.dayForecastCoreData?[indexPath.row])

        return cell
    }



    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return self.getSizeItem()
    }


}



extension DayDetailTopForecastTableViewCell: CellNameProtocol {

    static var nameCell: String {
        String(describing: self)
    }




}
