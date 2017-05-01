import Vapor

let drop = Droplet()
let raspberry = RaspberryFactory.getRaspberry()

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

drop.patch("digitSegment", Int.self) { (request, digit) in
    guard let digit = OneDigitSegmentDisplay.Digit(rawValue: digit) else {
        throw Abort.badRequest
    }
    raspberry.displayDigit(digit)
    return "OK"
}

drop.patch("digitSegment", "switchOff") { (request) in
    raspberry.switchDigitDisplaySegmentOff()
    return "OK"
}

drop.run()
