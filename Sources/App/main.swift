import Vapor
import SwiftyGPIO

let drop = Droplet()
//let gpios = SwiftyGPIO.GPIOs(for: .RaspberryPi2)
//guard let ledGpio = gpios[GPIOName.P27] else {
//    fatalError("Could not initialize gpio pin")
//}
//ledGpio.direction = .OUT

drop.get { req in
    return "Success"
}

drop.patch("led", "switch_on") { (request) in
    return "OK"
}

drop.patch("led", "switch_off") { (request) in
    return "OK"
}

drop.patch("led", "start_blink") { (request) in
    return "OK"
}

drop.patch("led", "stop_blink") { (request) in
    return "OK"
}

drop.patch("led", "intensity") { (request) in
    guard let intensity = request.query?["intensity"]?.double else {
        throw Abort.badRequest
    }
    
    return "Ok"
}

drop.run()
