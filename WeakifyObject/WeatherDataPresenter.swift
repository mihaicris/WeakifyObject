//
//  WeatherDataPresenter.swift
//  WeakifyObject
//
//  Created by Mihai Cristescu on 14/05/2019.
//  Copyright © 2019 Mihai Cristescu. All rights reserved.
//

import Foundation

struct WeatherViewModel: Equatable {
    let temperature: String
}

protocol WeatherDataPresenterOutput {
    func present(_ weather: WeatherViewModel)
}

final class WeatherDataPresenter {
    let output: WeatherDataPresenterOutput
    private let converter: MeasurementFormatter

    init(output: WeatherDataPresenterOutput, locale: Locale = .current) {
        self.output = output
        self.converter = MeasurementFormatter()
        self.converter.locale = locale
    }
}

extension WeatherDataPresenter: FetchWeatherUseCaseOutput {
    func didFetch(_ weather: WeatherData) {
        output.present(WeatherViewModel(temperature: converter.string(from: weather.temperature)))
    }
}
