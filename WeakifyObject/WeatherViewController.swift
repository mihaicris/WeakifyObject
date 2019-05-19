//
//  ViewController.swift
//  WeakifyObject
//
//  Created by Mihai Cristescu on 14/05/2019.
//  Copyright © 2019 Mihai Cristescu. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var reloadButton: UIButton!

    var reloadData: (()-> Void)?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reload()
    }


    @IBAction private func reload() {
        reloadData?()
    }
}

extension WeatherViewController: WeatherDataPresenterOutput {
    func present (_ weather: WeatherViewModel) {
        label.text = weather.temperature
    }
}

