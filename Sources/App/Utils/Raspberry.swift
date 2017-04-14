//
//  Raspberry.swift
//  experimental-swift-server
//
//  Created by Piotr Gorzelany on 14/04/2017.
//
//

import Foundation
import SwiftyGPIO

class Raspberry: RaspberryApi {
    
    // MARK: Shared instance
    
    static let shared = Raspberry()
    
    // MARK: Properties
    
    private let led: Led
    private let pwmLed: PWMLed
    
    // MARK: Lifecycle
    
    init(led: Led, pwmLed: PWMLed) {
        self.led = led
        self.pwmLed = pwmLed
    }
    
    convenience init() {
        let gpios = SwiftyGPIO.GPIOs(for: .RaspberryPi2)
        let ledGPIO = gpios[GPIOName.P0]!
        let pwms = SwiftyGPIO.hardwarePWMs(for: .RaspberryPi2)!
        let ledPWM = pwms[0]![GPIOName.P0]!
        let pwmLed = PWMLed(pwm: ledPWM)
        let led = Led(gpio: ledGPIO)
        self.init(led: led, pwmLed: pwmLed)
    }
    
    // MARK: Public methods
    
    func switchLedOn() {
        print("\(#function) called on \(String(describing: type(of: self)))")
    }
    
    func switchLedOff() {
        print("\(#function) called on \(String(describing: type(of: self)))")
    }
    
    func startLedBlink() {
        print("\(#function) called on \(String(describing: type(of: self)))")
    }
    
    func stopLedBlink() {
        print("\(#function) called on \(String(describing: type(of: self)))")
    }
    
    func setLedIntensity(_ intensity: Double) {
        print("\(#function) called on \(String(describing: type(of: self)))")
    }
}
