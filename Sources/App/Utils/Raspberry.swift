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
        static let defaultLedGpioName = GPIOName.P16
        static let defaultPWMLedGpioName = GPIOName.P18
        static let defaultOneSegmentAGpioName = GPIOName.P19
        static let defaultOneSegmentBGpioName = GPIOName.P26
        static let defaultOneSegmentCGpioName = GPIOName.P27
        static let defaultOneSegmentDGpioName = GPIOName.P17
        static let defaultOneSegmentEGpioName = GPIOName.P4
        static let defaultOneSegmentFGpioName = GPIOName.P6
        static let defaultOneSegmentGGpioName = GPIOName.P5
    }
    
    // MARK: Shared instance
    
    static let shared = Raspberry()
    
    // MARK: Properties
    
    private let led: Led
    private let pwmLed: PWMLed
    private let oneSegmentDisplay: OneDigitSegmentDisplay
    
    // MARK: Lifecycle
    
    init(led: Led, pwmLed: PWMLed, oneSegmentDisplay: OneDigitSegmentDisplay) {
        self.led = led
        self.pwmLed = pwmLed
        self.oneSegmentDisplay = oneSegmentDisplay
    }
    
    convenience init() {
        let gpios = SwiftyGPIO.GPIOs(for: .RaspberryPi2)
        let ledGPIO = gpios[Config.defaultLedGpioName]!
        let pwms = SwiftyGPIO.hardwarePWMs(for: .RaspberryPi2)!
        let ledPWM = pwms[0]![Config.defaultPWMLedGpioName]!
        let pwmLed = PWMLed(pwm: ledPWM)
        let led = Led(gpio: ledGPIO)
        let oneSegmentDisplay = OneDigitSegmentDisplay(gpios: [
            gpios[Config.defaultOneSegmentAGpioName]!,
            gpios[Config.defaultOneSegmentBGpioName]!,
            gpios[Config.defaultOneSegmentCGpioName]!,
            gpios[Config.defaultOneSegmentDGpioName]!,
            gpios[Config.defaultOneSegmentEGpioName]!,
            gpios[Config.defaultOneSegmentFGpioName]!,
            gpios[Config.defaultOneSegmentGGpioName]!,
            ])
        self.init(led: led, pwmLed: pwmLed, oneSegmentDisplay: oneSegmentDisplay)
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
        print("\(#function) called on \(String(describing: type(of: self))), with intensity: \(intensity)")
        pwmLed.setIntensity(intensity)
    }
    
    func displayDigit(_ digit: OneDigitSegmentDisplay.Digit) {
        print("\(#function) called on \(String(describing: type(of: self)))")
        oneSegmentDisplay.displayDigit(digit)
    }
    
    func switchDigitDisplaySegmentOff() {
        print("\(#function) called on \(String(describing: type(of: self)))")
        oneSegmentDisplay.switchOff()
    }
}
