//
//  MainDetailedDayTableViewCell.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 24.11.2022.
//

import UIKit


class MainDetailedDayTableViewCell: UITableViewCell {


    var dayForecastCoreData: [WeatherForecastCoreData]?

    var mainViewController: MainViewController?

    
    var dayForecastNetwork: WeatherModel? {

        didSet {
            self.collectionView.reloadData()
        }
    }


    private let itemCount = 4.0




    private lazy var buttonDetailedDayForecast: UIButton = {

        let action = UIAction{  _ in

        self.mainViewController?.showDayDetailForecastViewController()

            print("buttonDetailedDayForecast")
        }

        var buttonDetailedDayForecast = UIButton(primaryAction: action)
        buttonDetailedDayForecast.setTitle("Подробнее на 24 часа", for: .normal)
        buttonDetailedDayForecast.translatesAutoresizingMaskIntoConstraints = false

        return buttonDetailedDayForecast
    }()



    private lazy var labelEverydayForecast: UILabel = {

        var labelEverydayForecast = UILabel()
        labelEverydayForecast.textColor = .black
        labelEverydayForecast.translatesAutoresizingMaskIntoConstraints = false
        labelEverydayForecast.font = UIFont(name: "Rubik-Medium", size: 18)
        labelEverydayForecast.numberOfLines = 0
        labelEverydayForecast.text = "Ежедневный прогноз"
        return labelEverydayForecast
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


        [ self.labelEverydayForecast, self.buttonDetailedDayForecast, self.collectionView ].forEach { self.contentView.addSubview($0)}


        self.backgroundColor = .white

        NSLayoutConstraint.activate([

            self.buttonDetailedDayForecast.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            self.buttonDetailedDayForecast.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15),

            self.collectionView.topAnchor.constraint(equalTo: self.buttonDetailedDayForecast.bottomAnchor, constant: 24),
            self.collectionView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.collectionView.heightAnchor.constraint(equalToConstant: self.getSizeItem().height + self.collectionViewFlowLayout.sectionInset.bottom),

            self.labelEverydayForecast.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: 10),
            self.labelEverydayForecast.leadingAnchor.constraint(equalTo: self.collectionView.leadingAnchor, constant: 15),

            self.labelEverydayForecast.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),




        ])
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func layoutSubviews() {
        super.layoutSubviews()
    }



    func setupCellCoreData(dayForecast: [WeatherForecastCoreData]?) {

        self.dayForecastCoreData = dayForecast

        self.collectionView.reloadData()
    }



    func setupCell(mainController: MainViewController?) {


        self.mainViewController = mainController

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



        guard self.dayForecastCoreData != nil && self.dayForecastCoreData?.isEmpty == false  else {

            return 0
        }

        guard (self.dayForecastCoreData?.count ?? 0) >= 9
        else {
            return self.dayForecastCoreData?.count ?? 0
        }
        return 9

    }

    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: MainDetailedDayCollectionViewCell.nameCell, for: indexPath) as? MainDetailedDayCollectionViewCell
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


extension MainDetailedDayTableViewCell: CellNameProtocol {
    static var nameCell: String {
        String(describing: self)
    }


}
