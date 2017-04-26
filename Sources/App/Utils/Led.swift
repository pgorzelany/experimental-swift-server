//
//  Led.swift
//  experimental-swift-server
//
//  Created by Piotr Gorzelany on 14/04/2017.
//
//

import Foundation
import SwiftyGPIO

class Led {
    
    // MARK: Properties
    
    let gpio: GPIO
    var defaultBlinkInterval = 0.5
    
    private var blinkTimer: Timer?
    
    // MARK: Lifecycle
    
    init(gpio: GPIO) {
        self.gpio = gpio
        gpio.direction = .OUT
        gpio.value = 0
    }
    
    // MARK: Public Methods
    
    func switchOn() {
        gpio.value = 1
    }
    
    func switchOff() {
        gpio.value = 0
    }
    
    func toggle() {
        gpio.value = gpio.value == 0 ? 1 : 0
    }
    
    func startBlink() {
        blinkTimer = Timer(timeInterval: defaultBlinkInterval, repeats: true, block: { [unowned self](timer) in
            print("Toggling led")
            self.toggle()
        })
    }
    
    func stopBlink() {
        blinkTimer?.invalidate()
        blinkTimer = nil
    }
}
