//
//  RGBLed.swift
//  experimental-swift-server
//
//  Created by Piotr Gorzelany on 02/05/2017.
//
//

import Foundation
import SwiftyGPIO
import Vapor

class RGBLed {
    
    enum Color: String, Parameterizable {
        
        case red, green, blue
        
        static let uniqueSlug = "color"
        
        static func make(for parameter: String) throws -> RGBLed.Color {
            guard let color = Color(rawValue: parameter) else {
                throw Abort.badRequest
            }
            
            return color
        }
    }
    
    // MARK: Properties
    
    private let redGpio: GPIO
    private let greenGpio: GPIO
    private let blueGpio: GPIO
    private let gpios: [GPIO]
    
    // MARK: Initializer
    
    init(red: GPIO, green: GPIO, blue: GPIO) {
        self.redGpio = red
        self.greenGpio = green
        self.blueGpio = blue
        self.gpios = [red, green, blue]
        configureGpios()
    }
    
    // MARK: Private methods
    
    private func configureGpios() {
        gpios.forEach { (gpio) in
            gpio.direction = .OUT
            gpio.value = 0
        }
    }
    
    // MARK: Public methods 
    
    func toggleColor(_ color: Color) {
        switch color {
        case .red:
            redGpio.value = redGpio.value == 1 ? 0 : 1
        case .green:
            greenGpio.value = greenGpio.value == 1 ? 0 : 1
        case .blue:
            blueGpio.value = blueGpio.value == 1 ? 0 : 1
        }
    }
    
}
