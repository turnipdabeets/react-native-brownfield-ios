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

    @IBOutlet weak var inputText: UITextField!

    @IBAction func toReact(_ sender: UIButton) {
        let addHelloView = ReactModuleProvider.sharedInstance.viewForModule(
            "HelloReact",
            initialProperties: ["name": getTextInput()])
        let vc = UIViewController()
        vc.view = addHelloView
        self.present(vc, animated: true, completion: nil)
    }

    func getTextInput() -> String {
        return inputText.text ?? ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "React Native Brownfield"
        self.inputText.delegate = self
    }
    
}

extension ViewController: UITextFieldDelegate {
    // Add action on return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == inputText {
            textField.resignFirstResponder()
            return false
        }
        return true
    }
}

