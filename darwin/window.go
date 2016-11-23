package darwin

// +build darwin

// #cgo CFLAGS: -x objective-c
// #cgo LDFLAGS: -framework Foundation -framework AppKit -framework CoreGraphics
// #import <Foundation/Foundation.h>
// #import <AppKit/AppKit.h>
// #include "window.h"
// #include <CoreGraphics/CGWindowLevel.h>
import "C"
import "unsafe"

const (
  NSStatusWindowLevel C.int = C.kCGStatusWindowLevelKey
)

type Window struct {
	ptr unsafe.Pointer
}

func NewWindow(x, y, width, height int) (*Window) {
	w := new(Window)
	w.ptr = C.NewWindow(C.int(x), C.int(y), C.int(width), C.int(height))
	return w
}

func (self *Window) MakeKeyAndOrderFront() {
	C.MakeKeyAndOrderFront(self.ptr)
}

func (self *Window) SetLevel(level C.int) {
	C.SetLevel(self.ptr, level)
}

func (self *Window) SetTitle(title string) {
	C.SetTitle(self.ptr, C.CString(title))
}

func (self *Window) Center() {
	C.Center(self.ptr)
}
