package main

import (
  "github.com/ascotan/gooey/darwin"
)

func main() {
  app := darwin.SharedApplication()
  delegate := darwin.NewAppDelegate()
  app.SetAppDelegate(delegate)
  window := darwin.NewWindow(100, 100, 200, 200)
  window.SetTitle("Title")
  window.MakeKeyAndOrderFront()
  window.SetLevel(darwin.NSStatusWindowLevel)
  window.Center()

  app.Run()
}
