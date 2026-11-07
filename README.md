# mfiano.lib.ffi.libsdl2

CFFI bindings for SDL2 (Simple DirectMedia Layer 2.x), with thin Common Lisp wrappers over them.

The wrappers keep the shape and naming of SDL's API. They take keywords where SDL takes enums or flags, and they signal `sdl-error` when SDL reports a failure.

## What's in here

- CFFI bindings for a practical subset of SDL2.
- Wrapper functions, which make up the exported API.

## Requirements

- The SDL2 runtime installed on the system.
  - Arch: `pacman -S sdl2`
  - Ubuntu/Debian: `apt install libsdl2-2.0-0`
  - macOS (Homebrew): `brew install sdl2`
- Common Lisp libraries:
  - `cffi`
  - `static-vectors`
  - `trivial-features`
  - `mfiano.lib.base`

## Loading

ASDF system name:

```lisp
(asdf:load-system :mfiano.lib.ffi.libsdl2)
```

Package:

```lisp
(defpackage #:my-demo
  (:use #:cl #:mfiano.lib.ffi.libsdl2))
```

## Example

This opens a window and clears it every frame until the window is closed.

```lisp
(in-package #:my-demo)

(defun run ()
  (init :video :events)
  (let ((window (make-window 800 450 :title "My Demo"))
        (renderer nil)
        (event (make-event)))
    (unwind-protect
        (progn
          (setf renderer (make-renderer window))
          (loop
            ;; Pump events.
            (loop :while (poll-event event)
                  :do (when (eq (get-event-type event) :quit)
                        (return-from run nil)))
            ;; Draw.
            (set-render-draw-color renderer :r 20 :g 20 :b 20 :a 255)
            (render-clear renderer)
            (render-present renderer)))
      (when renderer (destroy-renderer renderer))
      (destroy-window window)
      (destroy-event event)
      (quit))))
```

## Conventions

- Where SDL expects a bitmask or enum, the wrappers usually accept keywords:
  - `(init :video :events)`
  - `(make-window ... :flags '(:shown :resizable))`
  - `(make-renderer window :flags '(:accelerated :present-vsync))`
- `render-copy` and `render-copy-f` flip with the generalized booleans `:flip-x` and `:flip-y`, so `(render-copy renderer texture :flip-x t)` mirrors the texture horizontally.
- The exported wrappers are the public API. The bindings are generated with the `define-sdl-function` macro, and their `%`-prefixed names stay internal.
- Each wrapper is named after the SDL2 function it calls, in Lisp style: `SDL_RenderClear` is `render-clear` and `SDL_PollEvent` is `poll-event`. Constructors are `make-*` and destructors are `destroy-*`.

## Error handling

Most bindings check SDL's result and signal `sdl-error` on failure. The condition reports the message from `SDL_GetError`.

```lisp
(handler-case (init :video)
  (sdl-error (c)
    (format *error-output* "~a~%" c)))
```

## Memory management

SDL objects created through this library are foreign pointers, and the library sets no finalizers on them. Free each one with the matching destroy function:

* `make-window` / `destroy-window`
* `make-renderer` / `destroy-renderer`
* `make-texture` / `destroy-texture`
* `make-event` / `destroy-event`

`with-rect` and `with-frect` allocate a temporary rectangle and free it when the body exits.

## Coverage

The library covers these areas of SDL2:

* init/quit and error strings
* windows and display info
* renderers and textures
* OpenGL contexts
* events, with keyboard and mouse helpers
* pixel formats
* timing
* base and preference paths
* the CPU count

Surfaces are not supported, and neither are the custom cursors made from them. SDL requires a surface to be freed before the pixel data it borrows, which this library cannot ensure for a Lisp array. The renderer needs no surfaces, since `update-texture/from-array` uploads a Lisp array into a texture.

To add an SDL2 function this library lacks, bind it in `src/functions.lisp` with `define-sdl-function` from `src/common.lisp`, and wrap it in `src/wrappers.lisp`.

## License

Licensed under the MIT License.
