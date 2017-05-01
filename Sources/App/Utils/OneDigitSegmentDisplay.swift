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
        
        self.agpio = gpios[0]
        self.bgpio = gpios[1]
        self.cgpio = gpios[2]
        self.dgpio = gpios[3]
        self.egpio = gpios[4]
        self.fgpio = gpios[5]
        self.ggpio = gpios[6]
        self.agpio.direction = .OUT
        self.bgpio.direction = .OUT
        self.cgpio.direction = .OUT
        self.dgpio.direction = .OUT
        self.egpio.direction = .OUT
        self.fgpio.direction = .OUT
        self.ggpio.direction = .OUT
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
        switch digit {
        default:
            switchSegment(.a, to: 1)
        }
    }
    
    
}
