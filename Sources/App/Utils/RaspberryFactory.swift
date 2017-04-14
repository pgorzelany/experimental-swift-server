//
//  RaspberryFactory.swift
//  experimental-swift-server
//
//  Created by PiotrGorzelanyMac on 14/04/2017.
//
//

import Foundation

final class RaspberryFactory {
    
    static func getRaspberry() -> RaspberryApi {
        let raspberry: RaspberryApi
        
        #if os(Linux)
            raspberry = Raspberry.shared
        #else
            raspberry = MockRaspberry.shared
        #endif
        
        return raspberry
    }
}
