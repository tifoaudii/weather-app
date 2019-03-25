//
//  SearchVC.swift
//  weather-app
//
//  Created by Tifo Audi Alif Putra on 25/03/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit

class SearchVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var cityTableView: UITableView!
    var delegate: WeatherProtocol? = nil
    var currentCity: Weather = Service.instance.getCurrentCity()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cityTableView.delegate = self
        cityTableView.dataSource = self
    }
    

    @IBAction func searchButton(_ sender: Any) {
        guard let city = cityTextField.text  else { return }
        delegate?.userDidChooseCity(forCity: city)
        Service.instance.getWeather(forCity: city) { (success) in
            if success {
                self.currentCity = Service.instance.getCurrentCity()
                self.cityTableView.reloadData()
            } else {
                return
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "city_cell", for: indexPath) as? CityCell {
            cell.setupCell(city: currentCity.city, temperature: currentCity.temperature)
            return cell
        } else {
            return CityCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.popViewController(animated: true)
    }
}
