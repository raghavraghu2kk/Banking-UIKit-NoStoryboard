//
//  ViewController.swift
//  Bankey
//
//  Created by Raghavendra Mirajkar on 03/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    let fetchWeatherButton = UIButton(type: .system)
    let stackView = UIStackView()
    let temperatureImage = UIImageView()
    let cityLabel = UILabel()
    let tempertatureLabel = UILabel()
    
    let weatherService = WeatherService()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        layout()
        weatherService.delegate = self
    }
    
    func setUp() {
        view.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 32
        
        fetchWeatherButton.translatesAutoresizingMaskIntoConstraints = false
        fetchWeatherButton.configuration = .filled()
        fetchWeatherButton.setTitle("Fetch Weather", for: [])
        fetchWeatherButton.addTarget(self, action: #selector(fetchWeather), for: .primaryActionTriggered)
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureImage.translatesAutoresizingMaskIntoConstraints = false
        tempertatureLabel.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(tempertatureLabel)
        stackView.addArrangedSubview(temperatureImage)
    }
    
    func layout() {
        view.addSubview(fetchWeatherButton)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            fetchWeatherButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fetchWeatherButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            stackView.topAnchor.constraint(equalTo: fetchWeatherButton.bottomAnchor, constant: 16),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func fetchWeather() {
        weatherService.fetchWeather()
    }

}

extension ViewController : WeatherServiceDelegate {
    func didFetchWeather(_ weather: Weather) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.city
            self.tempertatureLabel.text = "\(weather.temp) C"
            self.temperatureImage.image = UIImage(systemName: weather.imageName)
        }
    }
    
}
