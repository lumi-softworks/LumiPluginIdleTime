// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "LumiPluginIdleTime",
    defaultLocalization: "en",
    platforms: [.macOS(.v14), .iOS(.v17)],
    products: [
        .library(
            name: "PluginIdleTime",
            targets: ["PluginIdleTime"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/lumi-softworks/LumiLogging.git", from: "1.0.1"),
        .package(url: "https://github.com/lumi-softworks/LumiKernel.git", from: "1.1.0"),
        .package(url: "https://github.com/lumi-softworks/LumiLocalization.git", from: "1.0.1"),
        .package(url: "https://github.com/lumi-softworks/LumiUI.git", from: "1.11.1"),
        .package(url: "https://github.com/lumi-softworks/LumiProviders.git", from: "1.18.0")
    ],
    targets: [
        .target(
            name: "PluginIdleTime",
            dependencies: [
                .product(name: "LumiLoggingKit", package: "LumiLogging"),
                .product(name: "KernelCore", package: "LumiKernel"),
                .product(name: "LumiLocalizationKit", package: "LumiLocalization"),
                .product(name: "LumiUI", package: "LumiUI"),
                .product(name: "ProviderDocsView", package: "LumiProviders"),
                .product(name: "ProviderIdleTime", package: "LumiProviders"),
            ],
            path: "Sources/PluginIdleTime",
            resources: [
                .process("../../Resources")
            ]
        ),
        .testTarget(
            name: "PluginIdleTimeTests",
            dependencies: [
                "PluginIdleTime",
                .product(name: "KernelCore", package: "LumiKernel"),
                .product(name: "ProviderDocsView", package: "LumiProviders"),
                .product(name: "ProviderIdleTime", package: "LumiProviders"),
            ],
            path: "Tests/PluginIdleTimeTests"
        )
    ]
)