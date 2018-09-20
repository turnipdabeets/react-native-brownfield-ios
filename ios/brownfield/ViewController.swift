//
//  ViewController.swift
//  brownfield
//
//  Created by Anna Elisabeth Garcia on 9/19/18.
//  Copyright © 2018 Anna Elisabeth Garcia. All rights reserved.
//

import UIKit
import React

class ViewController: UIViewController {

    @IBAction func toReact(_ sender: UIButton) {
        let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")
        let data:NSDictionary = ["initialProps":
            [
                "title":"Hello React",
            ]
        ]
        let rootView = RCTRootView(
            bundleURL: jsCodeLocation,
            moduleName: "App",
            initialProperties: data as [NSObject: AnyObject],
            launchOptions: nil
        )
        let vc = UIViewController()
        vc.view = rootView
        self.present(vc, animated: true, completion: nil)
    }

}

