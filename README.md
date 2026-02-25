# [WWSignInWith3rd+Weibo](https://github.com/William-Weng?tab=repositories&q=+WWSignInWith3rd)

[![Swift-5.6](https://img.shields.io/badge/Swift-5.6-orange.svg?style=flat)](https://developer.apple.com/swift/) [![iOS-15.0](https://img.shields.io/badge/iOS-15.0-pink.svg?style=flat)](https://developer.apple.com/swift/) ![](https://img.shields.io/github/v/tag/William-Weng/WWSignInWith3rd_Weibo) [![Swift Package Manager-SUCCESS](https://img.shields.io/badge/Swift_Package_Manager-SUCCESS-blue.svg?style=flat)](https://developer.apple.com/swift/) [![LICENSE](https://img.shields.io/badge/LICENSE-MIT-yellow.svg?style=flat)](https://developer.apple.com/swift/)

### [Introduction - 簡介](https://swiftpackageindex.com/William-Weng)
- [Use Weibo third-party login.](https://github.com/sinaweibosdk/weibo_ios_sdk)
- [使用新浪微博的第三方登入。](https://open.weibo.com/wiki/Sdk/ios)

### [Installation with Swift Package Manager](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/使用-spm-安裝第三方套件-xcode-11-新功能-2c4ffcf85b4b)
```js
dependencies: [
    .package(url: "https://github.com/William-Weng/WWSignInWith3rd_Weibo.git", .upToNextMajor(from: "1.2.0"))
]
```

### 必要設定
#### info.plist
```xml
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>weibosdk</string>
    <string>sinaweibohd</string>
    <string>sinaweibo</string>
    <string>sinaweibosso</string>
    <string>weibosdk3.3</string>
    <string>sinaweibohdsso</string>
</array>

<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLName</key>
        <string>sinaweibosso</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>&lt;WeiboAppKey&gt;</string>
        </array>
    </dict>
</array>
```

### Function - 可用函式
|函式|功能|
|-|-|
|configure(appKey:secret:universalLink:redirectURI:isEnableDebugMode:)|參數設定|
|login(request:completion:)|登入|
|logout(with:)|登出|
|canOpenURL(_:)|在外部由URL Scheme開啟|
|canOpenUniversalLink(userActivity:)|在外部由UniversalLink開啟|

### Example
#### SceneDelegate.swift
```swift
import UIKit
import WWSignInWith3rd_Apple
import WWSignInWith3rd_Weibo

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        _ = WWSignInWith3rd.Weibo.shared.configure(appKey: "<WeiboAppKey>", secret: "<WeiboSecret>", universalLink: "https://api.weibo.com/oauth2", redirectURI: "https://api.weibo.com/oauth2")
    }
}

extension SceneDelegate {
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let urlContext = URLContexts.first else { return }
        _ = WWSignInWith3rd.Weibo.shared.canOpenURL(urlContext.url)
    }
    
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        _ = WWSignInWith3rd.Weibo.shared.canOpenUniversalLink(userActivity: userActivity)
    }
}
```

#### ViewController.swift


```swift
import UIKit
import WWSignInWith3rd_Apple
import WWSignInWith3rd_Weibo

final class ViewController: UIViewController {
        
    @IBAction func signInWithWeibo(_ sender: UIButton) {
        
        WWSignInWith3rd.Weibo.shared.login { request in
            print(request)
        } completion: { result in
            switch result {
            case .failure(let error): print(error)
            case .success(let info): print(info)
            }
        }
    }
}
```
