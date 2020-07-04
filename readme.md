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
-m, --memory [bytes]  deprecated due to dynamic resizing of memory
```

### Test it
1. Run a web server.
  - `python -m http.server 8000` will work.
2. Open `localhost:8000` in the browser of your choice.

## Notes
Memory is now dynamically resized even with pthreads thanks to [this](https://github.com/emscripten-core/emscripten/pull/8365).

Audio doesn't work (?) with a message of
```
The AudioContext was not allowed to start. It must be resumed (or created) after a user gesture on the page. https://goo.gl/7K7WLu
```

## Building
Clone the [megasource](https://github.com/Davidobot/megasource/tree/emscripten) and [love](https://github.com/Davidobot/love/tree/emscripten) and then run `build_lovejs.sh` (with minor changes for file paths)

On MacOS (maybe other system), the initial build will fail due to a `-lnul` flag in `build/release/love/CMakeFiles/love.dir/linklibs.rsp`. Not sure what causes this behaviour (probably some libraries that don't link/exist on Mac), but it can be mitigated by just removing the flag from the specified file, commenting out the `emcmake` command in `build_lovejs.sh` and re-running it. Issue tracked [here](https://github.com/OGStudio/openscenegraph-cross-platform-guide/issues/8#issuecomment-653736397).