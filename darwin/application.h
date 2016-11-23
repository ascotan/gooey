// +build darwin

#import <Cocoa/Cocoa.h>

void* SharedApplication(void);
void SetAppDelegate(void *ns_application, void *app_delegate);
void *SetApplicationIcon(void *ns_application, void *image_data, int size);
void Run(void *app);
