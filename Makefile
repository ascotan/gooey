all: build

build:
	go build -v -race

app: build
	mkdir -p Gooey.app/Contents/MacOS/
	mkdir -p Gooey.app/Contents/Resources/
	cp resources/icon.icns Gooey.app/Contents/Resources/
	cp resources/Info.plist Gooey.app/Contents/
	cp gooey Gooey.app/Contents/MacOS/

clean:
	rm -f gooey
	rm -rf Gooey.app
