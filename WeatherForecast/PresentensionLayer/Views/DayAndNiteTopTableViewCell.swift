//
//  DayAndNiteTopTableViewCell.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 02.12.2022.
//

import UIKit

class DayAndNiteTopTableViewCell: UITableViewCell {

    private var itemCount = 2.5

    private var coordinator: CoordinatorProtocol?

    private var colorCollectionCellIndex: Int?


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

        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(DayAndNiteCollectionViewCell.self, forCellWithReuseIdentifier: DayAndNiteCollectionViewCell.nameCell)
        return collectionView

    }()



    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)


        [  self.collectionView ].forEach { self.contentView.addSubview($0)}


        self.backgroundColor = .white

        NSLayoutConstraint.activate([


            self.collectionView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 24),
            self.collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.collectionView.heightAnchor.constraint(equalToConstant: self.getSizeItem().height + self.collectionViewFlowLayout.sectionInset.bottom),

            self.collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),

        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    func setupCellCoreData(coordinator: CoordinatorProtocol?, colorCollectionCellIndex: Int?) {

        self.colorCollectionCellIndex = colorCollectionCellIndex

        self.coordinator = coordinator

        self.collectionView.reloadData()

    }



    func getSizeItem() -> CGSize {

        let screenWidth = UIScreen.main.bounds.width

        let itemSpacing = self.collectionViewFlowLayout.minimumInteritemSpacing

        let itemSpacingCount = self.itemCount - 1.0

        let itemWidth = (screenWidth - self.collectionViewFlowLayout.sectionInset.left - (itemSpacing * itemSpacingCount)) / self.itemCount


        let itemCGSize = CGSize(width: itemWidth, height: itemWidth * 0.5)

        return itemCGSize

    }
}



extension DayAndNiteTopTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {



        guard self.coordinator?.weatherForecastService.getForecastCoreData() != nil && self.coordinator?.weatherForecastService.getForecastCoreData()?.isEmpty == false  else {

            return 0
        }

        return 5
    }



    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: DayAndNiteCollectionViewCell.nameCell, for: indexPath) as? DayAndNiteCollectionViewCell
        else {
            return UICollectionViewCell()
        }


        guard self.coordinator?.weatherForecastService.getForecastCoreData() != nil && self.coordinator?.weatherForecastService.getForecastCoreData()?.isEmpty == false

        else {
            return cell
        }

        cell.setupCollectionCellCoreData(forecast: self.coordinator?.weatherForecastService.getDayForecastCoreData(day: indexPath.row))


        if indexPath.row == self.colorCollectionCellIndex {

            cell.contentView.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)
            cell.checkLabelColor()
            return cell
        }
        
        else {
            return cell
        }
    }
    
    





    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return self.getSizeItem()
    }

}



extension DayAndNiteTopTableViewCell: CellNameProtocol {
    static var nameCell: String {
        String(describing: self)
    }

}

