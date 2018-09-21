//
//  ReactModuleProvider.swift
//  brownfield
//
//  Created by Anna Elisabeth Garcia on 9/21/18.
//  Copyright © 2018 Anna Elisabeth Garcia. All rights reserved.
//

import UIKit
import Foundation
import React

class ReactModuleProvider: NSObject {
    // use singleton pattern to lazily create an instance when first accessed
    static let sharedInstance = ReactModuleProvider()
    var bridge: RCTBridge?

    func createBridgeIfNeeded() -> RCTBridge {
        return bridge ?? RCTBridge(delegate: self, launchOptions: nil)
    }

    func viewForModule(_ moduleName: String, initialProperties: [String : Any]?) -> RCTRootView {
        let viewBridge = createBridgeIfNeeded()
        return RCTRootView(
            bridge: viewBridge,
            moduleName: moduleName,
            initialProperties: initialProperties)
    }

}

extension ReactModuleProvider: RCTBridgeDelegate {
    func sourceURL(for bridge: RCTBridge!) -> URL! {
        //        return Bundle.main.url(forResource: "main", withExtension: "jsbundle")
        return URL(string: "http://localhost:8081/index.bundle?platform=ios")
    }
}
