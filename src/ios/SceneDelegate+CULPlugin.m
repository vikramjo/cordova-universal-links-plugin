//
//  SceneDelegate+CULPlugin.m
//  App
//
//  Created by Pierre Zeeman on 06/07/2026.
//

#import "SceneDelegate+CULPlugin.h"
#import "CULPlugin.h"
#import <Cordova/CDVSceneDelegate.h>

/**
 *  Plugin name in config.xml
 */
static NSString *const PLUGIN_NAME = @"UniversalLinks";

@implementation CDVSceneDelegate (CULPlugin)

- (void) scene:(UIScene *) scene continueUserActivity:(NSUserActivity *) userActivity {
  // ignore activities that are not for Universal Links
  if ([userActivity.activityType isEqualToString:NSUserActivityTypeBrowsingWeb]) {
    UIWindow *window = self.window;
    if ([window.rootViewController respondsToSelector: @selector(getCommandInstance:)]) {
      CDVViewController *viewController = (CDVViewController *)window.rootViewController;

      // get instance of the plugin and let it handle the userActivity object
      CULPlugin *plugin = (CULPlugin *)[viewController getCommandInstance:PLUGIN_NAME];
      if (plugin) {
        [plugin handleUserActivity:userActivity];
      }
    }
  }
}


@end
