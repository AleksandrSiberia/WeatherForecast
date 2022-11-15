//
//  FirstControlle.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 15.11.2022.
//

import UIKit

class FirstController: UIViewController {


    private lazy var imageViewBanner: UIImageView = {
        var imageViewBanner = UIImageView(image: UIImage(named: "Frame 54"))
        imageViewBanner.contentMode = .scaleAspectFit
        imageViewBanner.translatesAutoresizingMaskIntoConstraints = false
        return imageViewBanner
    }()



    private lazy var labelLetLocation: UILabel = {
        var labelLetLocation = UILabel()
        labelLetLocation.translatesAutoresizingMaskIntoConstraints = false
        labelLetLocation.numberOfLines = 0
        return labelLetLocation
    }()



    override func viewDidLoad() {
        super.viewDidLoad()

        [self.imageViewBanner, self.labelLetLocation].forEach {self.view.addSubview($0) }

        setupLayoutConstrains()
    }



    func setupLayoutConstrains() {

        NSLayoutConstraint.activate([
            self.imageViewBanner.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 148),
            self.imageViewBanner.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.imageViewBanner.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30)
        ])
    }
    



}
