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
    
    struct Config {
        static let defaultLedGpioName = GPIOName.P27
        static let defaultPWMLedGpioName = GPIOName.P18
    }
    
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
        let ledGPIO = gpios[Config.defaultLedGpioName]!
        let pwms = SwiftyGPIO.hardwarePWMs(for: .RaspberryPi2)!
        let ledPWM = pwms[0]![Config.defaultPWMLedGpioName]!
        let pwmLed = PWMLed(pwm: ledPWM)
        let led = Led(gpio: ledGPIO)
        self.init(led: led, pwmLed: pwmLed)
    }
    
    // MARK: Public methods
    
    func switchLedOn() {
        print("\(#function) called on \(String(describing: type(of: self)))")
        led.switchOn()
    }
    
    func switchLedOff() {
        print("\(#function) called on \(String(describing: type(of: self)))")
        led.switchOff()
    }
    
    func startLedBlink() {
        print("\(#function) called on \(String(describing: type(of: self)))")
        led.startBlink()
    }
    
    func stopLedBlink() {
        print("\(#function) called on \(String(describing: type(of: self)))")
        led.stopBlink()
    }
    
    func setLedIntensity(_ intensity: Double) {
        print("\(#function) called on \(String(describing: type(of: self)))")
        pwmLed.setIntensity(intensity)
    }
}
