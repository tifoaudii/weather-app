//
//  ViewController.swift
//  weather-app
//
//  Created by Tifo Audi Alif Putra on 25/03/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, WeatherProtocol {
   
    

    @IBOutlet weak var imageWeather: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var city: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Service.instance.getWeather(forCity: "Jakarta") { (success) in
            if success {
                let currentCity = Service.instance.getCurrentCity()
                self.imageWeather.image = UIImage(named: currentCity.imageWeather)
                self.temperature.text = currentCity.temperature
                self.weather.text = currentCity.weather
                self.city.text = currentCity.city
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "search_segue" {
            guard let searchVC = segue.destination as? SearchVC else { return }
            searchVC.delegate = self
        }
    }
    
    func userDidChooseCity(forCity city: String) {
        Service.instance.getWeather(forCity: city) { (success) in
            if success {
                let currentCity = Service.instance.getCurrentCity()
                self.imageWeather.image = UIImage(named: currentCity.imageWeather)
                self.temperature.text = currentCity.temperature
                self.weather.text = currentCity.weather
                self.city.text = currentCity.city
            }
        }
    }


}

