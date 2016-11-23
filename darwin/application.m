// +build darwin

#import "application.h"
#import "app_delegate.h"

// you create a NSApplication by invoking shared() as per:
// https://developer.apple.com/reference/appkit/nsapplication
void* SharedApplication(void) {
	return [NSApplication sharedApplication];
}

void SetAppDelegate(void *ns_application, void *app_delegate) {
  NSApplication* app = (NSApplication*)ns_application;
  AppDelegate* delegate = (AppDelegate*)app_delegate;
  [app setDelegate:delegate];
}

void *SetApplicationIcon(void *ns_application, void *image_data, int size) {
  NSApplication* app = (NSApplication*)ns_application;
  NSData *data = [[NSData alloc] initWithBytes:image_data length:size];
  NSImage* image = [[NSImage alloc]initWithData:data];
  NSLog(@"myImage: %@",image);
  [app setApplicationIconImage:image];
  return image;
}

void Run(void *ns_application) {
    @autoreleasepool {
        NSApplication* app = (NSApplication*)ns_application;
        [app setActivationPolicy:NSApplicationActivationPolicyRegular];
        [app run];
	}
}
