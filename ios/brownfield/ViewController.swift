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
        let addHelloView = ReactModuleProvider.sharedInstance.viewForModule(
            "HelloReact",
            initialProperties: ["name": getTextInput()])
        let vc = UIViewController()
        vc.view = addHelloView
        self.present(vc, animated: true, completion: nil)
    }

    func getTextInput() -> String {
        return enterName.text ?? ""
    }

}

