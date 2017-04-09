import Vapor
import SwiftyGPIO

let drop = Droplet()
//let gpios = SwiftyGPIO.GPIOs(for: .RaspberryPi2)
//guard let ledGpio = gpios[GPIOName.P27] else {
//    fatalError("Could not initialize gpio pin")
//}
//ledGpio.direction = .OUT

drop.get { req in
    return "To jest vapor"
}

drop.get("led", "turn_on") { (request) in
//    ledGpio.value = 1
    return "The led should turn on"
}

drop.get("led", "turn_off") { (request) in
//    ledGpio.value = 0
    return "The led should turn off"
}

drop.get("post", Int.self) { (request, postNumber) in
    return "This is the post site for post number \(postNumber)"
}

drop.run()
