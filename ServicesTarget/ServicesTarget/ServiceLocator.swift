//
//  ServiceLocator.swift
//  ServicesTarget
//
//  Created by Jaime D. Vega on 3/29/18.
//  Copyright © 2018 Reaxtion. All rights reserved.
//

import Foundation

public class ServiceLocator {
    private var services = [ObjectIdentifier: Any]()
    
    public static var sharedInstance = ServiceLocator()
    
    // MARK: Registration
    
    public func register<Service>(factory: @escaping () -> Service) {
        let serviceId = ObjectIdentifier(Service.self)
        services[serviceId] = factory
    }
    
    public static func register<Service>(factory: @escaping () -> Service) {
        sharedInstance.register(factory: factory)
    }
    
    public static func resolve<Service>() -> Service {
        return sharedInstance.resolve()
    }
    
    public func resolve<Service>() -> Service {
        let serviceId = ObjectIdentifier(Service.self)
        if let factory = services[serviceId] as? () -> Service {
            return factory()
        } else {
            fatalError("No registered entry for \(Service.self)")
        }
    }
}
