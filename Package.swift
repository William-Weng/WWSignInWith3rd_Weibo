// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWSignInWith3rd_Weibo",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(name: "WWSignInWith3rd_Weibo", targets: ["WWSignInWith3rd_Weibo"]),
    ],
    dependencies: [
        .package(url: "https://github.com/William-Weng/WWSignInWith3rd_Apple", .upToNextMinor(from: "1.1.0")),
        .package(url: "https://github.com/William-Weng/WWPrint", .upToNextMinor(from: "1.3.0")),
    ],
    targets: [
        .target(
            name: "WWSignInWith3rd_Weibo",
            dependencies: ["WWPrint", "WWSignInWith3rd_Apple", "SinaWeibonSDK"],
            resources: [.process("WeiboSDK"), .copy("Privacy")]
        ),
        .binaryTarget(name: "SinaWeibonSDK", path: "SinaWeibonSDK.xcframework")
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
