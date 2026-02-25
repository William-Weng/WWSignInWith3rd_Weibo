// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWSignInWith3rd_Weibo",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(name: "WWSignInWith3rd_Weibo", targets: ["WWSignInWith3rd_Weibo"]),
    ],
    dependencies: [
        .package(url: "https://github.com/William-Weng/WWSignInWith3rd_Apple", .upToNextMinor(from: "1.1.4"))
    ],
    targets: [
        .target(
            name: "WWSignInWith3rd_Weibo",
            dependencies: ["WWSignInWith3rd_Apple", "SinaWeibonSDK"],
            resources: [.process("WeiboSDK"), .copy("Privacy")]
        ),
        .binaryTarget(name: "SinaWeibonSDK", path: "SinaWeibonSDK.xcframework")
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
