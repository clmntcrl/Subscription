// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "Subscription",
    products: [
        .library(
            name: "Subscription",
            targets: ["Subscription"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Subscription",
            dependencies: []),
        .testTarget(
            name: "SubscriptionTests",
            dependencies: ["Subscription"]),
    ]
)
