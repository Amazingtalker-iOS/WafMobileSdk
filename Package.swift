// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "WafMobileSdk",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "WafMobileSdk", targets: ["WafMobileSdk"])
    ],
    targets: [
        .binaryTarget(
            name: "WafMobileSdk",
            path: "./WafMobileSdk.xcframework"
        )
    ]
)
