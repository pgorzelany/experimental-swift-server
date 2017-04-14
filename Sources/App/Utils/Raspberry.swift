//
//  Raspberry.swift
//  experimental-swift-server
//
//  Created by Piotr Gorzelany on 14/04/2017.
//
//

import Foundation

class Raspberry: RaspberryApi {
    
    static let shared = Raspberry()
    
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