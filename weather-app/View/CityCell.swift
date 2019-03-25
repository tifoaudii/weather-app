//
//  CityCell.swift
//  weather-app
//
//  Created by Tifo Audi Alif Putra on 25/03/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {

    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var temperature: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(city: String, temperature: String) {
        self.city.text = city
        self.temperature.text = temperature
    }
}
