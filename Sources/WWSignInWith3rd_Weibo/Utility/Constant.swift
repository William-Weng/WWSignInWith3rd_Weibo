//
//  Constant.swift
//  WWSignInWith3rd_Weibo
//
//  Created by William.Weng on 2026/3/3.
//

import UIKit
import WeiboSDK
import WWSignInWith3rd_Apple

/// MARK: - enum
public extension WWSignInWith3rd.Weibo {
    
    /// 登入事件
    enum LoginEvent {
        case request(WBBaseRequest?)    // 發出的請求資訊
        case response(Data?)            // 回傳的回應資訊
    }
}
