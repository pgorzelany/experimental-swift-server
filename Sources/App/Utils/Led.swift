//
//  Led.swift
//  experimental-swift-server
//
//  Created by Piotr Gorzelany on 14/04/2017.
//
//

import Foundation
import SwiftyGPIO
import RxSwift

class Led {
    
    // MARK: Properties
    
    let gpio: GPIO
    var defaultBlinkInterval = 0.5
    
    private var blinkDisposeBag = DisposeBag()
    
    // MARK: Lifecycle
    
    init(gpio: GPIO) {
        self.gpio = gpio
        gpio.direction = .OUT
        gpio.value = 0
    }
    
    // MARK: Public Methods
    
    func switchOn() {
        gpio.value = 1
    }
    
    func switchOff() {
        gpio.value = 0
    }
    
    func toggle() {
        print("\(#function) called on \(String(describing: type(of: self)))")
        gpio.value = gpio.value == 0 ? 1 : 0
    }
    
    func startBlink() {
        print("\(#function) called on \(String(describing: type(of: self)))")
        Observable<Int>.interval(defaultBlinkInterval, scheduler: MainScheduler.instance)
            .subscribe { [unowned self] _ in
                self.toggle()
            }.addDisposableTo(blinkDisposeBag)
    }
    
    func stopBlink() {
        blinkDisposeBag = DisposeBag()
        switchOff()
    }
}
