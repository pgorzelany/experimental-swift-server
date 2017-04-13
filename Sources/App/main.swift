import Vapor
import SwiftyGPIO

let drop = Droplet()

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
