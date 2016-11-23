// +build darwin

#include "app_delegate.h"

@implementation AppDelegate
  - (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
      return YES;
  }
@end

void *NewAppDelegate() {
    AppDelegate *delegate = [[AppDelegate alloc] init];
    return delegate;
}
