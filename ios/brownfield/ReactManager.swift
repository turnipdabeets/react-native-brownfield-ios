//
//  ReactManager.swift
//  brownfield
//
//  Created by Anna Elisabeth Garcia on 9/21/18.
//  Copyright © 2018 Anna Elisabeth Garcia. All rights reserved.
//

import UIKit
import Foundation
import React

@objc(ReactManager)
class ReactManager: RCTEventEmitter {
    // Needed so bridge is not nil and to conform to RCTEventEmitter
    override func supportedEvents() -> [String]! {
        return ["ReactManagerEventPlaceholder"]
    }

    // Dismiss view controller
    @objc func dismissPresentedViewController(_ reactTag: NSNumber) {
        DispatchQueue.main.async {
            if let view = self.bridge.uiManager.view(forReactTag: reactTag) {
                // Add Transition Animation, RN is displayed as a modal and will otherwise slide up
                let transition = CATransition()
                transition.duration = 0.5
                transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
                transition.type = kCATransitionPush
                transition.subtype = kCATransitionFromLeft
                let presentedViewController: UIViewController! = view.reactViewController()
                presentedViewController.view.window?.layer.add(transition, forKey: nil)
                presentedViewController.dismiss(animated: false, completion: nil)
            }
        }
    }
}
