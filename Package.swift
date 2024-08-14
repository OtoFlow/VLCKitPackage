// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VLCKitPackage",
    platforms: [.iOS(.v12), .tvOS(.v12), .macOS(.v10_13)],
    products: [
        .library(name: "VLCKitPackage", targets: ["TheVLCKit"]),
    ],
    targets: [
        .target(
            name: "TheVLCKit",
            dependencies: [
                .target(name: "MobileVLCKitPackage", condition: .when(platforms: [.iOS])),
                .target(name: "TVVLCKitPackage", condition: .when(platforms: [.tvOS])),
                .target(name: "VLCKitPackage", condition: .when(platforms: [.macOS])),
            ],
            linkerSettings: [
                .linkedFramework("AudioToolbox"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CFNetwork"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreText"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("Foundation"),
                .linkedLibrary("bz2"),
                .linkedLibrary("c++"),
                .linkedLibrary("iconv"),
                .linkedLibrary("xml2"),
                .linkedFramework("OpenGLES"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("Security"),
                .linkedFramework("VideoToolbox"),
                .linkedFramework("UIKit", .when(platforms: [.iOS, .tvOS])),
            ]
        ),
        .binaryTarget(name: "MobileVLCKitPackage", url: "https://github.com/OtoFlow/VLCKitPackage/releases/download/3.6.0/MobileVLCKit.xcframework.zip", checksum: "af8fb27b80e1e8fc7ed7e3f3569c7b5b973adf5684b4d686f923f593d97172c9"),
        .binaryTarget(name: "TVVLCKitPackage", url: "https://github.com/OtoFlow/VLCKitPackage/releases/download/3.6.0/TVVLCKit.xcframework.zip", checksum: "037f4ae468362fc339b69aa984fd46a5461d8e47e70074cfde1a0207c85d721e"),
        .binaryTarget(name: "VLCKitPackage", url: "https://github.com/OtoFlow/VLCKitPackage/releases/download/3.6.0/VLCKit.xcframework.zip", checksum: "c782a5ae77c705ec65dcbf7cc012052defb30ff1dc6bdd55b4ef182bc4f99a7d"),
    ]
)
