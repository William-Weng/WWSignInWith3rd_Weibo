//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2023/9/11.
//  ~/Library/Caches/org.swift.swiftpm/

import UIKit
import WWSignInWith3rd_Apple
import WWSignInWith3rd_Weibo

final class ViewController: UIViewController {
    
    /// [設定Build Settings -> Other Linker Flags => -ObjC -all_load](https://www.jianshu.com/p/96ce02c214aa)
    /// - Parameter sender: UIButton
    @IBAction func signInWithWeibo(_ sender: UIButton) {
        Task { await loginDemo() }
    }
    
    func loginDemo() async {
        
        do {
            for try await event in WWSignInWith3rd.Weibo.shared.login() {
                switch event {
                case .request(let request): print(request)
                case .response(let data): print(data)
                }
            }
        } catch {
            print(error)
        }
    }
}
