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
