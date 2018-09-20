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

    @IBOutlet weak var enterName: UITextField!

    @IBAction func toReact(_ sender: UIButton) {
        let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")
        let data = ["initialProps":
            [
                "name": getTextInput()
            ]
        ]
        let rootView = RCTRootView(
            bundleURL: jsCodeLocation,
            moduleName: "ReactNativeApp",
            initialProperties: data,
            launchOptions: nil
        )
        let vc = UIViewController()
        vc.view = rootView
        print("VC", vc)
        self.present(vc, animated: true, completion: nil)
    }

    func getTextInput() -> String {
        return enterName.text ?? ""
    }

}

