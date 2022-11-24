//
//  MainDetailedDayTableViewCell.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 24.11.2022.
//

import UIKit

class MainDetailedDayTableViewCell: UITableViewCell {


    var dayForecast: [WeatherForecastCoreData]?

    private let itemCount = 5.0



    private lazy var collectionViewFlowLayout: UICollectionViewFlowLayout = {
        var collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        collectionViewFlowLayout.minimumInteritemSpacing = 2
        return collectionViewFlowLayout
    }()



    private lazy var collectionView: UICollectionView = {
        var collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: self.collectionViewFlowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MainDetailedDayCollectionViewCell.self, forCellWithReuseIdentifier: MainDetailedDayCollectionViewCell.nameCell)
        return collectionView

    }()




    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.contentView.addSubview(self.collectionView)

        self.backgroundColor = .black


        
        NSLayoutConstraint.activate([

            self.collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }




    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }




    func setupCellCoreData(dayForecast: [WeatherForecastCoreData]? ) {

        self.dayForecast = dayForecast
    }

}




extension MainDetailedDayTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return self.dayForecast?.count ?? 0

    }

    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: MainDetailedDayCollectionViewCell.nameCell, for: indexPath) as? MainDetailedDayCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.setupCollectionCellCoreData(dayForecast: self.dayForecast)
        
        return cell
    }


    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let screenWidth = collectionView.frame.width
        let itemSpacing = self.collectionViewFlowLayout.minimumInteritemSpacing

        let itemSpacingCount = self.itemCount - 1.0

        let itemWidth = (screenWidth - (itemSpacing * itemSpacingCount)) / self.itemCount

        let itemCGSize = CGSize(width: itemWidth, height: itemWidth * 2)

        return itemCGSize
    }


}


extension MainDetailedDayTableViewCell: CellNameProtocol {
    static var nameCell: String {
        String(describing: self)
    }


}
