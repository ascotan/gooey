// +build darwin

#include "window.h"
#include <stdlib.h>

@implementation MainWindow

@end

void *NewWindow(int x, int y, int width, int height) {
    NSWindow* window = [[NSWindow alloc] initWithContentRect:NSMakeRect(x, y, width, height)
      styleMask:NSWindowStyleMaskTitled|
			          NSWindowStyleMaskClosable|
								NSWindowStyleMaskMiniaturizable|
								NSWindowStyleMaskResizable|
								NSWindowStyleMaskTexturedBackground
      backing:NSBackingStoreBuffered defer:NO];
    return window;
}

void MakeKeyAndOrderFront(void *ns_window) {
    NSWindow *window = (NSWindow*)ns_window;
    [window makeKeyAndOrderFront:nil];
}

// levels are defined in CoreGraphics.framework/Versions/A/Headers/CGWindowLevel.h
void SetLevel(void *ns_window, int cg_window_level_key) {
    NSWindow *window = (NSWindow*)ns_window;
		[window setLevel:cg_window_level_key];
}

void SetTitle(void *ns_window, char *title) {
    NSWindow *window = (NSWindow*)ns_window;
    NSString *nsTitle =  [NSString stringWithUTF8String:title];
    [window setTitle:nsTitle];
    free(title);
}

void Center(void *ns_window) {
    NSWindow *window = (NSWindow*)ns_window;
    [window center];
}
