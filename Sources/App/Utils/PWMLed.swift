//
//  PMVLed.swift
//  experimental-swift-server
//
//  Created by Piotr Gorzelany on 14/04/2017.
//
//

import Foundation
import SwiftyGPIO

let pmvs = SwiftyGPIO.hardwarePWMs(for: .RaspberryPi2)

class PWMLed {
    
    // MARK: Properties
    
    private let pwm: PWMOutput
    private var intensity = 1.0
    private var defaultPeriod = 1000000
    
    // MARK: Lifecycle
    
    init(pwm: PWMOutput) {
        self.pwm = pwm
        pwm.initPWM()
        pwm.stopPWM()
    }
    
    // MARK: Public methods
    
    func setIntensity(_ intensity: Double) {
        self.intensity = intensity
        switchOn()
    }
    
    func switchOn() {
        let dutyCycle = getPWMDutyCycle(for: intensity)
        pwm.startPWM(period: defaultPeriod, duty: 50)
    }
    
    func switchOff() {
        pwm.stopPWM()
    }
    
    // MARK: Private methods
    
    private func getPWMDutyCycle(for intensity: Double) -> Int {
        return Int(intensity * 100)
    }
}
