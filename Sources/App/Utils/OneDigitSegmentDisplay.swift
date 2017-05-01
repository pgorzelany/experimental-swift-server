//
//  OneDigitSegmentDisplay.swift
//  experimental-swift-server
//
//  Created by Piotr Gorzelany on 01/05/2017.
//
//

import Foundation
import SwiftyGPIO

class OneDigitSegmentDisplay {
    
    enum Digit: Int {
        case zero = 0 ,one, two ,three, four, five, six, seven, eight, nine
    }
    
    private enum Segment {
        case a,b,c,d,e,f,g
    }
    
    // MARK: Properties
    
    private let gpios: [GPIO]
    private let agpio: GPIO
    private let bgpio: GPIO
    private let cgpio: GPIO
    private let dgpio: GPIO
    private let egpio: GPIO
    private let fgpio: GPIO
    private let ggpio: GPIO
    
    // Lifecycle
    
    init(gpios: [GPIO]) {
        guard gpios.count == 7 else {
            fatalError("There should be 7 gpios for the one digit segment display")
        }
        
        self.gpios = gpios
        self.agpio = gpios[0]
        self.bgpio = gpios[1]
        self.cgpio = gpios[2]
        self.dgpio = gpios[3]
        self.egpio = gpios[4]
        self.fgpio = gpios[5]
        self.ggpio = gpios[6]
        self.gpios.forEach { (gpio) in
            gpio.direction = .OUT
        }
    }
    
    // MARK: Private methods
    
    private func switchSegment(_ segment: Segment, to value: Int) {
        switch segment {
        case .a:
            agpio.value = value
        case .b:
            bgpio.value = value
        case .c:
            cgpio.value = value
        case .d:
            dgpio.value = value
        case .e:
            egpio.value = value
        case .f:
            fgpio.value = value
        case .g:
            ggpio.value = value
        }
    }
    
    // MARK: Public methods
    
    func displayDigit(_ digit: Digit) {
        switchOff()
        switch digit {
        case .zero:
            switchSegment(.a, to: 1)
            switchSegment(.b, to: 1)
            switchSegment(.c, to: 1)
            switchSegment(.d, to: 1)
            switchSegment(.e, to: 1)
            switchSegment(.f, to: 1)
        case .one:
            break
        case .two:
            break
        case .three:
            break
        case .four:
            break
        case .five:
            break
        case .six:
            break
        case .seven:
            break
        case .eight:
            break
        case .nine:
            break
        }
    }
    
    func switchOff() {
        self.gpios.forEach { (gpio) in
            gpio.value = 0
        }
    }
}
