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
    
    init(pwm: PWMOutput) {
        self.pwm = pwm
    }
}
