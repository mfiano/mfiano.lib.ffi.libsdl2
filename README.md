# mfiano.lib.ffi.libsdl2

CFFI bindings plus thin, Lisp-friendly wrappers for **SDL2 (Simple DirectMedia Layer 2.x)**.

The design goal is "no drama": keep the API close to SDL, but make it comfortable from Common Lisp: keywords for enums/flags, predictable wrapper names, and errors signaled as Lisp conditions.

## What's in here

- CFFI bindings for a practical subset of SDL2.
- Wrapper functions that:
  - accept keyword flags (often `&rest`),
  - convert common things to the right C shapes,
  - and signal `sdl-error` when SDL reports failure.

It's intentionally not a huge framework layer.

## Requirements

- **SDL2 runtime** installed on your system.
  - Arch: `pacman -S sdl2`
  - Ubuntu/Debian: `apt install libsdl2-2.0-0`
  - macOS (Homebrew): `brew install sdl2`
- Common Lisp libraries:
  - `cffi`
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

## Quickstart (window + event loop)

This is deliberately "SDL-shaped" code.

```lisp
(in-package #:my-demo)

(defun run ()
  (init :video :events)
  (let ((window (make-window "SDL2 demo" 800 450 :title "My Demo"))
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

A few patterns show up everywhere:

* **Keyword enums/flags.** Where SDL expects a bitmask or enum, the wrappers typically accept keywords.

  * Example: `(init :video :events)`
  * Example: `(make-window ... :flags '(:shown :resizable))`
  * Example: `(make-renderer window :flags '(:accelerated :presentvsync))`

* **Wrappers are the public API.** Internally, the bindings are generated with a macro (`define-sdl-function`) and usually have a `%`-prefixed entrypoint. The exported functions are the ergonomic wrappers.

* **Naming is SDL-ish.** Functions keep SDL naming where it's helpful (e.g., `render-clear`, `render-present`, `poll-event`, `wait-event`), but use a consistent Lisp prefix style (`make-window`, `destroy-window`, `get-*`, `set-*`).

## Error handling

Most SDL failures are converted into a Lisp condition:

* Condition type: `sdl-error`
* Message: taken from `SDL_GetError`

So you can do the usual:

```lisp
(handler-case (init :video)
  (sdl-error (c)
    (format *error-output* "SDL exploded: ~a~%" c)))
```

## Memory management

SDL objects created through this library are **foreign pointers**. This library does not try to be clever with GC finalizers: you are expected to call the matching destroy/free function.

Typical pairs:

* `make-window` / `destroy-window`
* `make-renderer` / `destroy-renderer`
* `create-texture` / `destroy-texture`
* `make-event` / `destroy-event`

For temporary rectangles there are helpers like:

* `with-rect` and `with-frect` (allocated and freed via `cffi:with-foreign-object`)

## What SDL2 areas are covered?

This repo focuses mainly on the pieces most games/tools need immediately:

* init/quit, error strings
* windows + display info
* renderers + textures
* events + keyboard/mouse state helpers
* surfaces/pixel formats (where needed for textures)
* a handful of small utilities (timing, hints, clipboard, etc.)

If you need something SDL2 exposes but this wrapper doesn't, adding it is usually straightforward: follow the pattern in `src/common.lisp` (`define-sdl-function`) and mirror the style used in `src/functions.lisp` and `src/wrappers.lisp`.

## License

Licensed under the MIT License.
