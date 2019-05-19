//
//  FetchWeatherUseCase.swift
//  WeakifyObject
//
//  Created by Mihai Cristescu on 14/05/2019.
//  Copyright © 2019 Mihai Cristescu. All rights reserved.
//

import Foundation

struct WeatherData: Hashable {
    let temperature: Measurement<UnitTemperature>
}

protocol FetchWeatherUseCaseOutput {
    func didFetch(_ weather: WeatherData)
}

final class FetchWeatherUseCase {
    let output: FetchWeatherUseCaseOutput

    init(output: FetchWeatherUseCaseOutput) {
        self.output = output
    }

    func fetch() {
        let temperature = Double(arc4random_uniform(21) + 15)
        output.didFetch(WeatherData(temperature: Measurement(value: temperature, unit: .celsius)))
    }
}
