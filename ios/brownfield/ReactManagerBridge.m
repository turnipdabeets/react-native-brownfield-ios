//
//  ReactManagerBridge.m
//  brownfield
//
//  Created by Anna Elisabeth Garcia on 9/21/18.
//  Copyright © 2018 Anna Elisabeth Garcia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(ReactManager, NSObject)
// React Native will default to initializing all native modules on a background thread unless explicitly opted-out of
+ (BOOL)requiresMainQueueSetup { return YES; }

RCT_EXTERN_METHOD(dismissPresentedViewController:(nonnull NSNumber *)reactTag)
@end
