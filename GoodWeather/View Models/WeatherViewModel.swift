//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by NazarStf on 03.06.2023.
//

import Foundation

class WeatherViewModel: ObservableObject {
	private var weatherService: WeatherService
	
	@Published var weather = Weather()
	
	init(weatherService: WeatherService) {
		self.weatherService = weatherService
	}
	
	var temperature: String {
		if let temp = self.weather.temp {
			return String(format: "%.0f", temp)
		} else {
			return ""
		}
	}
	
	var humidity: String {
		  
		  if let humidity = self.weather.humidity {
			  return String(format: "%.0f",humidity)
		  } else {
			  return ""
		  }
	  }
	
	var cityName: String = ""
	
	func search() {
		if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
			fetchWeather(by: city)
		}
	}
	
	private func fetchWeather(by city: String) {
		
		self.weatherService.getWeather(city: city) { weather in
			if let weather = weather {
				self.weather = weather
			}
		}
	}
	
}
