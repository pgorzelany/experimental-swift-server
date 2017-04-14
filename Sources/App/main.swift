import Vapor
import SwiftyGPIO

let drop = Droplet()
let raspberry: RaspberryApi

#if os(Linux)
    raspberry = Raspberry.shared
#else
    raspberry = MockRaspberry.shared
#endif

drop.get { req in
    return "Success"
}

drop.patch("led", "switch_on") { (request) in
    raspberry.switchLedOn()
    return "OK"
}

drop.patch("led", "switch_off") { (request) in
    raspberry.switchLedOff()
    return "OK"
}

drop.patch("led", "start_blink") { (request) in
    raspberry.startLedBlink()
    return "OK"
}

drop.patch("led", "stop_blink") { (request) in
    raspberry.stopLedBlink()
    return "OK"
}

drop.patch("led", "intensity") { (request) in
    guard let intensity = request.query?["intensity"]?.double else {
        throw Abort.badRequest
    }
    
    raspberry.setLedIntensity(intensity)
    return "Ok"
}

drop.run()
