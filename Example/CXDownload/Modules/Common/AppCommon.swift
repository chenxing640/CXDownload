//
//  AppCommon.swift
//  CXDownload_Example
//
//  Created by chenxing on 2023/7/7.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

// MARK: - Const

public let kScreen  = UIScreen.main.bounds
public let kScreenW = UIScreen.main.bounds.size.width
public let kScreenH = UIScreen.main.bounds.size.height

public let kMargin = kFitScale(AT: 10)
public let kLineMargin = kFitScale(AT: 1)

public let isIphoneX = { () -> Bool in
    var isX = false
    if #available(iOS 11.0, *) {
        isX = (UIApplication.shared.activeKeyWindow?.safeAreaInsets.bottom ?? 0) > CGFloat(0.0)
    }
    return isX
}

public let kSafeAreaInset = { () -> UIEdgeInsets in
    var insets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    if #available(iOS 11.0, *) {
        insets = UIApplication.shared.activeKeyWindow?.safeAreaInsets ?? insets
    }
    return insets
}

public let kSafeAreaTop = kSafeAreaInset().top == 0 ? 20 : kSafeAreaInset().top
public let kSafeAreaBottom = kSafeAreaInset().bottom
public let kStatusH = kSafeAreaTop
public let kNavigaH = 44 + kStatusH
public let kTabBarH = 49 + kSafeAreaBottom

// 6s's dimension
public func kFitScale(AT: CGFloat) -> CGFloat {
    return (kScreenW / 375) * AT
}

extension UIApplication {
    
    /// Get the active key window.
    public var activeKeyWindow: UIWindow? {
        var keyWindow: UIWindow?
        if #available(iOS 13.0, *) {
            keyWindow = UIApplication.shared.connectedScenes
                .filter({ $0.activationState == .foregroundActive })
                .map({ $0 as? UIWindowScene })
                .compactMap({ $0 })
                .first?.windows
                .filter({ $0.isKeyWindow }).first
        } else {
            keyWindow = UIApplication.shared.windows
                .filter({ $0.isKeyWindow }).first
        }
        return keyWindow
    }
    
}
