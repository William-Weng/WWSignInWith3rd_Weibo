//
//  AppDelegate.swift
//  Example
//
//  Created by William.Weng on 2026/2/24.
//

import UIKit
import WWSignInWith3rd_Apple
import WWSignInWith3rd_Weibo

// MARK: - SceneDelegate
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        _ = WWSignInWith3rd.Weibo.shared.configure(appKey: "<WeiboAppKey>", secret: "<WeiboSecret>", universalLink: "https://api.weibo.com/oauth2", redirectURI: "https://api.weibo.com/oauth2")
    }
}

// MARK: - 處理熱啟動 (APP已開啟) DeepLink / UniversalLink / PushNotification
extension SceneDelegate {
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let urlContext = URLContexts.first else { return }
        _ = WWSignInWith3rd.Weibo.shared.canOpenURL(urlContext.url)
    }
    
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        _ = WWSignInWith3rd.Weibo.shared.canOpenUniversalLink(userActivity: userActivity)
    }
}
