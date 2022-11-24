//
//  MainDetailedDayTableViewCell.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 24.11.2022.
//

import UIKit


class MainDetailedDayTableViewCell: UITableViewCell {


    var dayForecast: [WeatherForecastCoreData]?

    private let itemCount = 4.0




    private lazy var buttonDetailedDayForecast: UIButton = {

        let action = UIAction{  _ in
            print("buttonDetailedDayForecast")
        }

        var buttonDetailedDayForecast = UIButton(primaryAction: action)
        buttonDetailedDayForecast.setTitle("Подробнее на 24 часа", for: .normal)
        buttonDetailedDayForecast.translatesAutoresizingMaskIntoConstraints = false

        return buttonDetailedDayForecast
    }()
    


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
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MainDetailedDayCollectionViewCell.self, forCellWithReuseIdentifier: MainDetailedDayCollectionViewCell.nameCell)
        return collectionView

    }()


    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.contentView.addSubview( self.buttonDetailedDayForecast)
        self.contentView.addSubview( self.collectionView)

        self.backgroundColor = .white

        NSLayoutConstraint.activate([

            self.buttonDetailedDayForecast.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 33),
            self.buttonDetailedDayForecast.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),

            self.collectionView.topAnchor.constraint(equalTo: self.buttonDetailedDayForecast.bottomAnchor, constant: 24),
            self.collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.collectionView.heightAnchor.constraint(equalToConstant: self.getSizeItem().height + self.collectionViewFlowLayout.sectionInset.bottom)


        ])
    }




    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    override func layoutSubviews() {
        super.layoutSubviews()


    }



    func setupCellCoreData(dayForecast: [WeatherForecastCoreData]? ) {

        self.dayForecast = dayForecast
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




extension MainDetailedDayTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return self.dayForecast?.count ?? 0

    }

    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: MainDetailedDayCollectionViewCell.nameCell, for: indexPath) as? MainDetailedDayCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        guard self.dayForecast?.isEmpty == false
        else {
            print("‼️ self.dayForecast?.isEmpty == true")
            return UICollectionViewCell()
        }
        
        cell.setupCollectionCellCoreData(dayForecast: self.dayForecast?[indexPath.row])
        
        return cell
    }


    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return self.getSizeItem()
    }


}


extension MainDetailedDayTableViewCell: CellNameProtocol {
    static var nameCell: String {
        String(describing: self)
    }


}
