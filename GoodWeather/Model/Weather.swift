//
//  Weather.swift
//  GoodWeather
//
//  Created by NazarStf on 03.06.2023.
//

import Foundation

struct WeatherResponse: Decodable {
	let main: Weather
}

struct Weather: Decodable {
	var temp: Double?
	var humidity: Double?
}
