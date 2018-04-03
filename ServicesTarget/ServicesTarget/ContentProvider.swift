//
//  ContentProvider.swift
//  ServicesTarget
//
//  Created by Jaime D. Vega on 4/1/18.
//  Copyright © 2018 Reaxtion. All rights reserved.
//

import UIKit

public protocol ContentProvidable: class {
    var identifer: String {get}
}

extension UIView: ContentProvidable {
    public var identifer: String {
        return String(describing: self)
    }
}

public class ContentProvider {
    
    typealias BannerProvider = () -> UIView
    private var bannerContentProviders = [BannerProvider]()
    public static var sharedInstance = ContentProvider()
    
    // MARK: Banner Registration
    
    public func registerBanner<BannerContent: UIView>(provider: @escaping () -> BannerContent) {
        bannerContentProviders.append(provider)
    }
    
    public static func register<BannerContent: UIView>(provider: @escaping () -> BannerContent) {
        sharedInstance.registerBanner(provider: provider)
    }
    
    // MARK: Banner Resolution
    
    public static func resolveBanner<BannerContent: UIView>() -> [() -> BannerContent] {
        return sharedInstance.resolveBanner()
    }

    public func resolveBanner<BannerContent: UIView>() -> [() -> BannerContent] {
        var resolvedProviders = [() -> BannerContent]()
        
        for provider in bannerContentProviders  {
            if let provider = provider as? () -> BannerContent {
                resolvedProviders.append(provider)
            }
        }
        
        return resolvedProviders
    }
//
//    public func resolveBanners() -> [UIView] {
//
//    }
}

