package darwin

// +build darwin

// #cgo CFLAGS: -x objective-c
// #cgo LDFLAGS: -framework Foundation -framework AppKit
// #import <Foundation/Foundation.h>
// #import <AppKit/AppKit.h>
// #include "app_delegate.h"
import "C"
import "unsafe"

type AppDelegate struct {
	ptr unsafe.Pointer
}

func NewAppDelegate() (*AppDelegate) {
	d := new(AppDelegate)
	d.ptr = C.NewAppDelegate()
	return d
}
