//
//  Colors.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 20.07.2024.
//

import UIKit

extension UIColor {

    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }

    struct WeatherColors {
        let topColor: CGColor
        let bottomColor: CGColor

        init(for event: WeatherType) {
            switch event {
            case .sunny, .rainbow:
                topColor = UIColor(hex: 0xAFF3E9).cgColor
                bottomColor = UIColor(hex: 0xFFF9ED).cgColor
            case .cloudy:
                topColor = UIColor(hex: 0x8CC7FE).cgColor
                bottomColor = UIColor(hex: 0xA9D4FF).cgColor
            case .rain, .foggy, .lightning, .windy:
                topColor = UIColor(hex: 0x5B8189).cgColor
                bottomColor = UIColor(hex: 0xA5BABD).cgColor
            case .snow:
                topColor = UIColor(hex: 0x2E63DC).cgColor
                bottomColor = UIColor(hex: 0x431C71).cgColor
            }
        }
    }
}
