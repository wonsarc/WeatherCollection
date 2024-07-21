//
//  WeatherView.swift
//  WeatherCollection
//
//  Created by Artem Krasnov on 21.07.2024.
//

import UIKit

protocol WeatherViewProtocol: UIView {
    var bounds: CGRect { get }
    func removeAllSublayers()
    func insertSublayer(_ layer: CALayer, at index: UInt32)
    func addSublayer(_ layer: CALayer)
}

final class WeatherView: UIView, WeatherViewProtocol {
    
    func removeAllSublayers() {
        layer.sublayers?.removeAll()
    }
    
    func insertSublayer(_ layer: CALayer, at index: UInt32) {
        self.layer.insertSublayer(layer, at: index)
    }
    
    func addSublayer(_ layer: CALayer) {
        self.layer.addSublayer(layer)
    }
}
