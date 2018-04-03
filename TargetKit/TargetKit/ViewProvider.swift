//
//  ViewProvider.swift
//  TargetKit
//
//  Created by Jaime D. Vega on 3/29/18.
//  Copyright © 2018 Reaxtion. All rights reserved.
//

import Foundation

public protocol ActionableViewProvider {
    func viewForModel<M>(model: M, action: (UIViewController) -> Void) -> UIView 
}

public class ViewProvider {
    public var actionableViewProviders = [ActionableViewProvider]()
    public init() {
        
    }
}
