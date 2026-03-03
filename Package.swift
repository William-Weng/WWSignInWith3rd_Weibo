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
        .binaryTarget(
            name: "SinaWeibonSDK",
            url: "https://github.com/William-Weng/WWSignInWith3rd_Weibo/releases/download/1.2.1/SinaWeibonSDK.xcframework.zip",
            checksum: "2b16600954f2c3d43c2811113ef9c6e2965b2e42999572bd211aedeebbb1fab4")
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
