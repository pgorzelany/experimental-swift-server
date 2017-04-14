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
    
    let pwm: PWMOutput
    var intensity = 1.0
    private var defaultPeriod = 300
    
    // MARK: Lifecycle
    
    init(pwm: PWMOutput) {
        self.pwm = pwm
        pwm.initPWM()
    }
    
    // MARK: Public methods
    
    func setIntensity(_ intensity: Double) {
        self.intensity = intensity
        switchOn()
    }
    
    func switchOn() {
        let dutyCycle = getPWMDutyCycle(for: intensity)
        pwm.startPWM(period: defaultPeriod, duty: dutyCycle)
    }
    
    func switchOff() {
        pwm.stopPWM()
    }
    
    // MARK: Private methods
    
    private func getPWMDutyCycle(for intensity: Double) -> Int {
        return Int(intensity * 100)
    }
}
