//
//  ViewController.swift
//  MultiTarget
//
//  Created by Jaime D. Vega on 3/29/18.
//  Copyright © 2018 Reaxtion. All rights reserved.
//

import UIKit
import TargetKit
import ServicesTarget

class ViewController: UIViewController {
    let provider = ViewProvider()
    let serviceLocator = ServiceLocator.sharedInstance

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

