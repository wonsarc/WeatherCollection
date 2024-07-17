//
//  WeatherView.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 17.07.2024.
//

import UIKit

final class WeatherView: UIView {

    // MARK: - Public Properties

    var weatherLayers: [CALayer] = []

    // MARK: - Private Properties

    private var blurEffectView: UIVisualEffectView?

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func clearWeatherLayers() {
        for layer in weatherLayers {
            layer.removeFromSuperlayer()
        }
        weatherLayers.removeAll()
        removeBlurEffect()
    }

    func setupBlurEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
        sendSubviewToBack(blurEffectView)
        self.blurEffectView = blurEffectView
    }

    func removeBlurEffect() {
        blurEffectView?.removeFromSuperview()
        blurEffectView = nil
    }
}
