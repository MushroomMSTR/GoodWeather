//
//  WeatherService.swift
//  GoodWeather
//
//  Created by NazarStf on 03.06.2023.
//

import Foundation

class WeatherService {
	func getWeather(city: String, completion: @escaping (Weather?) -> Void) {
		guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(ApiKey.api)&units=metric") else {
			completion(nil)
			return
		}
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard let data = data, error == nil else {
				completion(nil)
				return
			}
			
			let weatherResponce = try? JSONDecoder().decode(WeatherResponse.self, from: data)
			if let weatherResponce = weatherResponce {
				let weather = weatherResponce.main
				completion(weather)
			} else {
				completion(nil)
			}
		}.resume()
	}
	
}
