Love.js for LÖVE v11.3
============
Basically trying to adapt [love.js](https://github.com/TannerRogalsky/love.js) to the latest and greatest versions of LÖVE and Emscripten.

## Usage
```
npm install
love.js [options] <input> <output>
```

`<input>` can either be a folder or a `.love` file.
`<output>` is a folder that will hold debug and release web pages.

## Options:
```
-h, --help            output usage information
-V, --version         output the version number
-t, --title <string>  specify game name
-m, --memory [bytes]  how much memory your game will require [16777216]
```

### Test it
1. Run a web server.
  - `python -m http.server 8000` will work.
2. Open `localhost:8000` in the browser of your choice.

## Notes
Currently does not work due to what looks to be a bitness error somewhere:
```
Error: main.lua:31: Cannot push love object to Lua: unexpected alignment (pointer is 0xd9a258 but alignment should be 16)
```

## Contributing
Please consider submitting a test. Any functionality that isn't covered in `spec/tests` would be very useful.
