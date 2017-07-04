import PackageDescription

let package = Package(
    name: "experimental-swift-server",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2, minor: 1),
        .Package(url: "https://github.com/uraimo/SwiftyGPIO.git", majorVersion: 0, minor: 8)
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
    ]
)
