import PackageDescription

let package = Package(
    name: "experimental-swift-server",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1, minor: 5),
        .Package(url: "https://github.com/uraimo/SwiftyGPIO.git", majorVersion: 0, minor: 8),
        .Package(url: "https://github.com/ReactiveX/RxSwift.git", majorVersion: 3, minor: 3)
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
    ]
)

