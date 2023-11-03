//
//  ContentView.swift
//  WeatherApp
//
//  Created by Parsoya, Saritha on 10/12/23.
//	URL to get current weather: https://openweathermap.org/current

import SwiftUI
import UIKit

struct ContentView: View {
	@State private var cityName: String = ""
    var body: some View {
        VStack {
            Text("Hello")
			Text("Please enter your city name or pincode to get today's weather report")
			TextField("City name", text: $cityName)
				.padding()
				.border(Color.black)
			Button {
				print("Submit")
				getData()
			} label: {
				Text("Submit")
			}
			.contentShape(Rectangle())
			.padding()
			.border(Color.black)
        }
        .padding()
    }
}

// How to get data from API using Swift
func getData() {
	let milpitasUrl = "https://api.openweathermap.org/data/2.5/onecall?lat=37.4332273&lon=-121.8989248&appid=6dfce9f3ade7a3ca0c6570595c2eb351"
	let session = URLSession.shared
	guard let serviceUrl = URL(string: milpitasUrl) else { return }
	
	let task = session.dataTask(with: serviceUrl) { (serviceData, serviceResponse, error) in
		
		if error == nil {
			let httpResponse = serviceResponse as! HTTPURLResponse
			if (httpResponse.statusCode == 200) {
	
				// Data Parse
				let jsonData = try? JSONSerialization.jsonObject(with: serviceData!, options: .mutableContainers)
				let result = jsonData as! Dictionary<String, Any>
				print(result)
				print("id = \(result["id"]!)")
			}
		}
	}
	task.resume()
}

#Preview {
    ContentView()
}
