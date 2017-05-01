//
//  Raspberry.swift
//  experimental-swift-server
//
//  Created by Piotr Gorzelany on 14/04/2017.
//
//

import Foundation

protocol RaspberryApi: class {
    
    func switchLedOn()
    func switchLedOff()
    func startLedBlink()    
    func stopLedBlink()
    func setLedIntensity(_ intensity: Double)
    func displayDigit(_ digit: OneDigitSegmentDisplay.Digit)
}
