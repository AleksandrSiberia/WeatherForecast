//
//  FirstControlle.swift
//  WeatherForecast
//
//  Created by Александр Хмыров on 15.11.2022.
//

import UIKit

class FirstController: UIViewController {


    private lazy var scrollView: UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()




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
        labelLetLocation.textColor = UIColor(named: "#F8F5F5")
        labelLetLocation.font = UIFont(name: "Rubik-SemiBold", size: 16)
        labelLetLocation.textAlignment = .center
        labelLetLocation.text = "Разрешить приложению  Weather использовать данные о местоположении вашего устройства "
        return labelLetLocation
    }()



    private lazy var labelAnnotation: UILabel = {
        var labelAnnotation = UILabel()
        labelAnnotation.translatesAutoresizingMaskIntoConstraints = false
        labelAnnotation.numberOfLines = 0
        labelAnnotation.textColor = UIColor(named: "#F8F5F5")
        labelAnnotation.font = UIFont(name: "Rubik-Regular", size: 14)
        labelAnnotation.textAlignment = .center
        labelAnnotation.text = "Чтобы получить более точные прогнозы погоды во время движения или путешествия"
        return labelAnnotation
    }()




    private lazy var labelAnnotationStopLocation: UILabel = {
        var labelAnnotationStopLocation = UILabel()
        labelAnnotationStopLocation.translatesAutoresizingMaskIntoConstraints = false
        labelAnnotationStopLocation.numberOfLines = 0
        labelAnnotationStopLocation.textColor = UIColor(named: "#F8F5F5")
        labelAnnotationStopLocation.font = UIFont(name: "Rubik-Regular", size: 14)
        labelAnnotationStopLocation.textAlignment = .center
        labelAnnotationStopLocation.text = "Вы можете изменить свой выбор в любое время из меню приложения"
        return labelAnnotationStopLocation
    }()



    private lazy var buttonAllowIdentifyLocation: UIButton = {

        let action = UIAction() { action in
            print("allow")
        }

        var buttonAllowIdentifyLocation = UIButton(primaryAction: action)

        buttonAllowIdentifyLocation.translatesAutoresizingMaskIntoConstraints = false
        buttonAllowIdentifyLocation.backgroundColor = UIColor(named: "#F26E11")
        buttonAllowIdentifyLocation.setTitle("ИСПОЛЬЗОВАТЬ МЕСТОПОЛОЖЕНИЕ  УСТРОЙСТВА", for: .normal)
        buttonAllowIdentifyLocation.setTitleColor(.white, for: .normal)
        buttonAllowIdentifyLocation.layer.cornerRadius = 12
        buttonAllowIdentifyLocation.titleLabel?.adjustsFontSizeToFitWidth = true
        buttonAllowIdentifyLocation.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 12)
        buttonAllowIdentifyLocation.titleLabel?.textColor = .white

        return buttonAllowIdentifyLocation
    }()




    private lazy var buttonDisallowIdentifyLocation: UIButton = {

        let action = UIAction() { action in
            print("disallow")
        }

        var buttonDisallowIdentifyLocation = UIButton(primaryAction: action)

        buttonDisallowIdentifyLocation.translatesAutoresizingMaskIntoConstraints = false
        buttonDisallowIdentifyLocation.backgroundColor = UIColor(red: 0.125, green: 0.306, blue: 0.78, alpha: 1)
        buttonDisallowIdentifyLocation.setTitle("НЕТ, Я БУДУ ДОБАВЛЯТЬ ЛОКАЦИИ", for: .normal)
        buttonDisallowIdentifyLocation.setTitleColor(.white, for: .normal)
        buttonDisallowIdentifyLocation.layer.cornerRadius = 12
        buttonDisallowIdentifyLocation.titleLabel?.adjustsFontSizeToFitWidth = true
        buttonDisallowIdentifyLocation.titleLabel?.font = UIFont(name: "Rubik-Regular", size: 16)
        buttonDisallowIdentifyLocation.titleLabel?.textColor = .white


        return buttonDisallowIdentifyLocation
    }()




    override func viewDidLoad() {
        super.viewDidLoad()


        self.view.addSubview(self.scrollView)

        [self.imageViewBanner, self.labelLetLocation, self.labelAnnotation, self.labelAnnotationStopLocation, self.buttonAllowIdentifyLocation, self.buttonDisallowIdentifyLocation].forEach { self.scrollView.addSubview($0) }

        setupLayoutConstrains()
    }



    func setupLayoutConstrains() {

        NSLayoutConstraint.activate([

            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),


            self.imageViewBanner.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 30),
            self.imageViewBanner.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.imageViewBanner.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),

            self.labelLetLocation.topAnchor.constraint(equalTo: self.imageViewBanner.bottomAnchor, constant: 20),
            self.labelLetLocation.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 26),
            self.labelLetLocation.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -26),

            self.labelAnnotation.topAnchor.constraint(equalTo: self.labelLetLocation.bottomAnchor, constant: 56),
            self.labelAnnotation.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.labelAnnotation.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),

            self.labelAnnotationStopLocation.topAnchor.constraint(equalTo: self.labelAnnotation.bottomAnchor, constant: 14),
            self.labelAnnotationStopLocation.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            self.labelAnnotationStopLocation.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),

            self.buttonAllowIdentifyLocation.topAnchor.constraint(equalTo: self.labelAnnotationStopLocation.bottomAnchor, constant: 44),
            self.buttonAllowIdentifyLocation.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 17),
            self.buttonAllowIdentifyLocation.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -17),

            self.buttonDisallowIdentifyLocation.topAnchor.constraint(equalTo: self.buttonAllowIdentifyLocation.bottomAnchor, constant: 25),
            self.buttonDisallowIdentifyLocation.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -17),
            self.buttonDisallowIdentifyLocation.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -77)

        ])
    }
    



}
