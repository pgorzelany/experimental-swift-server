import Vapor

let drop = try Droplet()
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

drop.patch("digitSegment", Int.parameter) { (request) -> ResponseRepresentable in
    let rawDigit = try request.parameters.next(Int.self)
    guard let digit = OneDigitSegmentDisplay.Digit(rawValue: rawDigit) else {
        throw Abort.badRequest
    }
    raspberry.displayDigit(digit)
    return "OK"
}

drop.patch("digitSegment", "switchOff") { (request) in
    raspberry.switchDigitDisplaySegmentOff()
    return "OK"
}

drop.patch("rgbLed", RGBLed.Color.parameter, "toggle") { (request) in
    let color = try request.parameters.next(RGBLed.Color.self)
    raspberry.toggleRGBLedColor(color)
    return "OK"
}

try drop.run()
