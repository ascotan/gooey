// +build darwin

#import <Cocoa/Cocoa.h>

@interface MainWindow : NSWindow

@end

void *NewWindow(int x, int y, int width, int height);
void MakeKeyAndOrderFront(void *);
void SetTitle(void *, char* title);
void Center(void *ns_window);
void SetLevel(void *ns_window, int cg_window_level_key);
