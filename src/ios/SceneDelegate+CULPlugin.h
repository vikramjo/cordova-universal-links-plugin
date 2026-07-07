//
//  SceneDelegate+CULPlugin.h
//  App
//
//  Created by Pierre Zeeman on 06/07/2026.
//


#import <Cordova/CDVSceneDelegate.h>

@interface CDVSceneDelegate (CULPlugin)

- (void) scene:(UIScene *) scene continueUserActivity:(NSUserActivity *) userActivity;

@end
