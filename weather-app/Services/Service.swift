//
//  Service.swift
//  weather-app
//
//  Created by Tifo Audi Alif Putra on 25/03/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Service {
    
    static let instance = Service()
    var currentCity: Weather?
    let HEADER = [
        "Content-Type": "application/json; charset=utf-8"
    ]
    
    func getWeather(forCity city: String, completion: @escaping (_ success: Bool) -> ()) {
        Alamofire.request("https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=6a4db183ab23e5289f350f4948cf62ee", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            
            if (response.result.error != nil) {
                return
            } else if let json = response.result.value as? Dictionary<String,Any> {
                let main = json["main"] as! [String:Double]
                let weather = json["weather"] as! [AnyObject]
                let detail = weather[0] as! [String:Any]
                let temp = Int(main["temp"]! - 273)
                var imageWeather: String = ""
                let description = detail["description"] as! String
                let descArr = description.split(separator: " ")
                
                if String(descArr[descArr.count-1]) == "snow" {
                    imageWeather = "snow4"
                } else if String(descArr[descArr.count-1]) == "rain" {
                    imageWeather = "shower3"
                } else if String(descArr[descArr.count-1]) == "sky"{
                    imageWeather = "sunny"
                } else if String(descArr[descArr.count-1]) == "clouds" {
                    imageWeather = "tstorm1"
                }
                print(Int(temp))
                
                self.currentCity = Weather(city: city, temperature: "\(String(describing: temp))°", weather: detail["description"] as! String, imageWeather: imageWeather)
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func getCurrentCity() -> Weather {
        return currentCity!
    }
    
}
