Love.js for LÖVE v11.3
============
Basically trying to adapt [love.js](https://github.com/TannerRogalsky/love.js) to the latest and greatest versions of LÖVE and Emscripten.

## Demos
 * [Specification Test](https://davidobot.net/lovejs_spec/) (threads, coroutines, shaders!)
 * [Another Kind of World](https://davidobot.net/akow/)
 * [groverburger's 3D engine (g3d)](https://davidobot.net/3d/) (shaders, click canvas to lock)

## Usage
```
npm install
npm link
love-js [options] <input> <output>
```

`<input>` can either be a folder or a `.love` file.
`<output>` is a folder that will hold debug and release web pages.

You can also replace `love-js` in the above command with `index.js` (or ` node index.js` on Windows) directly if the numpy install is giving you problems.

## Options:
```
-h, --help            output usage information
-V, --version         output the version number
-t, --title <string>  specify game name
-m, --memory [bytes]  how much memory your game will require [16777216]
```

### Test it
1. Run a web server (while `cd`-ed into the `<output>` folder):
  - eg: `python -m http.server 8000`
2. Open `localhost:8000` in the browser of your choice.

## Notes
1. Probably only works with Chrome at the moment.
2. Memory is now dynamically resized even with pthreads thanks to [this](https://github.com/emscripten-core/emscripten/pull/8365). Still needs a large-enough initial memory until I figure out how to properly wait for the memory to be sized-up before initialising all the file-system stuff (pointers [here](https://emscripten.org/docs/getting_started/FAQ.html#how-can-i-tell-when-the-page-is-fully-loaded-and-it-is-safe-to-call-compiled-functions)).
3. Shaders work (check out 3D demo), but are a bit finicky. For example, when using `love.graphics.newShader`, use the `love.graphics.newShader( pixelcode, vertexcode )` version (ie specify the pixel and vertex code separately; use the default ones if you don't need one of them)
4. If you want to lock the mouse on canvas click, add something like this to the `index.html`'s script:
```
canvas.requestPointerLock = canvas.requestPointerLock ||
                            canvas.mozRequestPointerLock;
document.exitPointerLock = document.exitPointerLock ||
                           document.mozExitPointerLock;
canvas.onclick = function() {
  canvas.requestPointerLock();
}
```
(I should probably implement that as an override to LÖVE's `love.mouse.setGrabbed` or `love.mouse.setRelative`)

5. Firefox doesn't like pthreads by default and spits out a
`Uncaught ReferenceError: SharedArrayBuffer is not defined`. Fix is discussed [here](https://github.com/ggerganov/kbd-audio/issues/9). 


## Building
Clone the [megasource](https://github.com/Davidobot/megasource/tree/emscripten) and [love](https://github.com/Davidobot/love/tree/emscripten) and then run `build_lovejs.sh` (with minor changes for file paths)
