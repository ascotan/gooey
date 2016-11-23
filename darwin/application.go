package darwin

// +build darwin

// #cgo CFLAGS: -x objective-c
// #cgo LDFLAGS: -framework Foundation -framework AppKit
// #import <Foundation/Foundation.h>
// #import <AppKit/AppKit.h>
// #include "application.h"
import "C"
import "unsafe"

type Application struct {
	ptr    unsafe.Pointer
  Icon   *Image
}

type Image struct {
  ptr    unsafe.Pointer
  Bytes []byte
}

func SharedApplication() (*Application) {
	app := new(Application)
	app.ptr = C.SharedApplication()
	return app
}

func (this *Application) SetAppDelegate(delegate *AppDelegate) {
  C.SetAppDelegate(this.ptr, delegate.ptr);
}

func (this *Application) SetApplicationIcon(bytes []byte) (*Image) {
  icon := new(Image)
  icon.Bytes = bytes
  icon.ptr = C.SetApplicationIcon(this.ptr, C.CBytes(icon.Bytes), C.int(len(icon.Bytes)));
  this.Icon = icon
  return icon
}

func (this *Application) Run() {
	C.Run(this.ptr)
}
