(in-package #:mfiano.lib.ffi.libsdl2/test)

(test bindings.resolve
  (dolist (name sdl::*functions*)
    (is (c:foreign-symbol-pointer name))))

(test bindings.status.update-texture
  (with-renderer (window renderer)
    (with-texture (texture renderer 2 2 :access :static)
      (signals sdl:sdl-error (sdl::%update-texture texture (c:null-pointer) (c:null-pointer) 8)))))

(test bindings.status.renderer-output-size
  (with-video ()
    (c:with-foreign-objects ((width :int) (height :int))
      (signals sdl:sdl-error (sdl::%get-renderer-output-size (c:null-pointer) width height)))))

(test bindings.status.set-hint
  (is (eq (sdl::%set-hint "SDL_RENDER_SCALE_QUALITY" "1") t)))

(test error.signal
  (with-video ()
    (signals sdl:sdl-error (sdl:get-window-from-id 0))))

(test init.was-init
  (with-video ()
    (is (equal (sdl:was-init :video) '(:video))))
  (is (null (sdl:was-init :video))))

(test system.cpu-count
  (is (plusp (sdl:get-cpu-count))))

(test system.performance
  (let ((start (sdl:get-performance-counter)))
    (is (plusp (sdl:get-performance-frequency)))
    (is (>= (sdl:get-performance-counter) start))))

(test system.base-path
  (let ((path (sdl:get-base-path)))
    (is (stringp path))
    (is (char= (char path (1- (length path))) #\/))))

(test rect.make
  (sdl:with-rect (rect :width 3 :height 4 :x -1 :y 2)
    (is (= (sdl:rect-width rect) 3))
    (is (= (sdl:rect-height rect) 4))
    (is (= (sdl:rect-x rect) -1))
    (is (= (sdl:rect-y rect) 2))
    (is (equal (multiple-value-list (sdl:get-rect-position rect)) '(-1 2)))
    (is (equal (multiple-value-list (sdl:get-rect-size rect)) '(3 4)))))

(test rect.make.float
  (let ((rect (sdl:make-rect 3.7f0 4.2f0 :x 1.9f0 :y -0.5f0)))
    (unwind-protect
         (is (equal (multiple-value-list (sdl:get-rect-size rect)) '(3 4)))
      (sdl:destroy-rect rect))))

(test rect.make.defaults
  (sdl:with-rect (rect)
    (is (equal (multiple-value-list (sdl:get-rect-position rect)) '(0 0)))
    (is (equal (multiple-value-list (sdl:get-rect-size rect)) '(0 0)))))

(test rect.setf
  (sdl:with-rect (rect :width 1 :height 1)
    (setf (sdl:rect-x rect) -5
          (sdl:rect-y rect) -6
          (sdl:rect-width rect) 7
          (sdl:rect-height rect) 8)
    (is (equal (multiple-value-list (sdl:get-rect-position rect)) '(-5 -6)))
    (is (equal (multiple-value-list (sdl:get-rect-size rect)) '(7 8)))))

(test rect.update
  (sdl:with-rect (rect :width 1 :height 2 :x 3 :y 4)
    (sdl:update-rect rect :width 5 :y -6)
    (is (equal (multiple-value-list (sdl:get-rect-position rect)) '(3 -6)))
    (is (equal (multiple-value-list (sdl:get-rect-size rect)) '(5 2)))))

(test rect.copy
  (sdl:with-rect (rect :width 1 :height 2 :x 3 :y 4)
    (let ((copy (sdl:copy-rect rect)))
      (unwind-protect
           (progn
             (setf (sdl:rect-x rect) 9)
             (is (equal (multiple-value-list (sdl:get-rect-position copy)) '(3 4)))
             (is (equal (multiple-value-list (sdl:get-rect-size copy)) '(1 2))))
        (sdl:destroy-rect copy)))))

(test rect.intersection
  (sdl:with-rect (a :width 4 :height 4)
    (sdl:with-rect (b :width 4 :height 4 :x 2 :y 3)
      (sdl:with-rect (c :width 1 :height 1 :x 10 :y 10)
        (is (sdl:has-intersection? a b))
        (is (not (sdl:has-intersection? a c)))
        (is (null (sdl:intersect-rect a c)))
        (let ((result (sdl:intersect-rect a b)))
          (unwind-protect
               (progn
                 (is (equal (multiple-value-list (sdl:get-rect-position result)) '(2 3)))
                 (is (equal (multiple-value-list (sdl:get-rect-size result)) '(2 1))))
            (sdl:destroy-rect result)))))))

(test frect.make
  (sdl:with-frect (frect :width 3.5f0 :height 4f0 :x -1.25f0 :y 2f0)
    (is (= (sdl:frect-width frect) 3.5f0))
    (is (= (sdl:frect-height frect) 4f0))
    (is (= (sdl:frect-x frect) -1.25f0))
    (is (= (sdl:frect-y frect) 2f0))
    (is (equal (multiple-value-list (sdl:get-frect-position frect)) '(-1.25f0 2f0)))
    (is (equal (multiple-value-list (sdl:get-frect-size frect)) '(3.5f0 4f0)))))

(test frect.make.defaults
  (sdl:with-frect (frect)
    (is (equal (multiple-value-list (sdl:get-frect-position frect)) '(0f0 0f0)))
    (is (equal (multiple-value-list (sdl:get-frect-size frect)) '(0f0 0f0)))))

(test frect.setf
  (sdl:with-frect (frect :width 1f0 :height 1f0)
    (setf (sdl:frect-x frect) -5.5f0
          (sdl:frect-y frect) 6.5f0
          (sdl:frect-width frect) 7.5f0
          (sdl:frect-height frect) 8.5f0)
    (is (equal (multiple-value-list (sdl:get-frect-position frect)) '(-5.5f0 6.5f0)))
    (is (equal (multiple-value-list (sdl:get-frect-size frect)) '(7.5f0 8.5f0)))))

(test frect.update
  (sdl:with-frect (frect :width 1f0 :height 2f0 :x 3f0 :y 4f0)
    (sdl:update-frect frect :height 5f0 :x -6f0)
    (is (equal (multiple-value-list (sdl:get-frect-position frect)) '(-6f0 4f0)))
    (is (equal (multiple-value-list (sdl:get-frect-size frect)) '(1f0 5f0)))))

(test frect.intersection
  (sdl:with-frect (a :width 4f0 :height 4f0)
    (sdl:with-frect (b :width 4f0 :height 4f0 :x 2.5f0 :y 3f0)
      (sdl:with-frect (c :width 1f0 :height 1f0 :x 10f0 :y 10f0)
        (is (sdl:has-intersection-f? a b))
        (is (not (sdl:has-intersection-f? a c)))
        (is (null (sdl:intersect-rect-f a c)))
        (let ((result (sdl:intersect-rect-f a b)))
          (unwind-protect
               (progn
                 (is (equal (multiple-value-list (sdl:get-frect-position result)) '(2.5f0 3f0)))
                 (is (equal (multiple-value-list (sdl:get-frect-size result)) '(1.5f0 1f0))))
            (sdl:destroy-frect result)))))))

(test pixel.format
  (let ((format (sdl:make-pixel-format :rgba8888)))
    (is (c:pointerp format))
    (is (null (multiple-value-list (sdl:destroy-pixel-format format))))))

(test pixel.map-rgb
  (is (equal (multiple-value-list (sdl:map-rgb 1 2 3)) '(1 2 3)))
  (is (equal (multiple-value-list (sdl:map-rgb 1 2 3 :pixel-format :bgr888)) '(3 2 1))))

(test pixel.map-rgba
  (is (equal (multiple-value-list (sdl:map-rgba 1 2 3 4)) '(1 2 3 4)))
  (is (equal (multiple-value-list (sdl:map-rgba 1 2 3 4 :pixel-format :argb8888)) '(4 1 2 3))))

(test pixel.get-rgb
  (is (equal (multiple-value-list (sdl:get-rgb #x010203)) '(1 2 3))))

(test pixel.get-rgba
  (is (equal (multiple-value-list (sdl:get-rgba #x01020304)) '(1 2 3 4))))

(test window.make
  (with-video ()
    (let ((window (sdl:make-window 6 5 :title "biodrift" :flags '(:hidden))))
      (unwind-protect
           (progn
             (is (equal (multiple-value-list (sdl:get-window-size window)) '(6 5)))
             (is (string= (sdl:get-window-title window) "biodrift"))
             (is (c:pointer-eq (sdl:get-window-from-id (sdl:get-window-id window)) window)))
        (is (null (multiple-value-list (sdl:destroy-window window))))))))

(test window.title
  (with-window (window)
    (sdl:set-window-title window "drift")
    (is (string= (sdl:get-window-title window) "drift"))))

(test window.size
  (with-window (window)
    (sdl:set-window-size window 10 6)
    (is (equal (multiple-value-list (sdl:get-window-size window)) '(10 6)))
    (is (equal (multiple-value-list (sdl:get-window-size-in-pixels window)) '(10 6)))))

(test window.position
  (with-window (window)
    (sdl:set-window-position window :x 10 :y 20)
    (is (equal (multiple-value-list (sdl:get-window-position window)) '(10 20)))))

(test window.position.keywords
  (with-window (window)
    (is (null (multiple-value-list (sdl:set-window-position window))))
    (is (null (multiple-value-list (sdl:set-window-position window :x :centered :y :centered))))))

(test window.minimum-size
  (with-window (window)
    (sdl:set-window-minimum-size window 12 6)
    (sdl:set-window-size window 4 2)
    (is (equal (multiple-value-list (sdl:get-window-size window)) '(12 6)))))

(test window.maximum-size
  (with-window (window)
    (sdl:set-window-maximum-size window 12 6)
    (sdl:set-window-size window 20 10)
    (is (equal (multiple-value-list (sdl:get-window-size window)) '(12 6)))))

(test window.pixel-format
  (with-window (window)
    (is (member (sdl:get-window-pixel-format window)
                (c:foreign-enum-keyword-list 'sdl::pixel-format-type)))))

(test window.display
  (with-window (window)
    (let ((index (sdl:get-window-display-index window)))
      (is (= index 0))
      (is (stringp (sdl:get-display-name index)))
      (multiple-value-bind (format width height refresh-rate)
          (sdl:get-current-display-mode window)
        (is (keywordp format))
        (is (plusp width))
        (is (plusp height))
        (is (= (sdl:get-refresh-rate window) refresh-rate)))
      (is (keywordp (sdl:get-window-display-mode window))))))

(test window.show-hide
  (with-window (window)
    (with-event (event)
      (drain-events event)
      (sdl:show-window window)
      (is (member :shown (window-events event)))
      (sdl:hide-window window)
      (is (member :hidden (window-events event))))))

(test window.fullscreen
  (with-window (window)
    (sdl:set-window-fullscreen window :fullscreen)
    (is (member :fullscreen (%get-window-flags window)))
    (sdl:set-window-fullscreen window :windowed)
    (is (not (member :fullscreen (%get-window-flags window))))))

(test window.keyboard-grab
  (with-window (window)
    (sdl:set-window-keyboard-grab window)
    (is (member :keyboard-grabbed (%get-window-flags window)))
    (sdl:set-window-keyboard-grab window nil)
    (is (not (member :keyboard-grabbed (%get-window-flags window))))))

(test window.state
  (with-window (window)
    (sdl:show-window window)
    (is (null (multiple-value-list (sdl:maximize-window window))))
    (is (null (multiple-value-list (sdl:restore-window window))))
    (is (null (multiple-value-list (sdl:minimize-window window))))
    (is (null (multiple-value-list (sdl:restore-window window))))
    (is (null (multiple-value-list (sdl:raise-window window))))
    (is (null (multiple-value-list (sdl:set-window-resizable window))))
    (is (null (multiple-value-list (sdl:set-window-always-on-top window))))))

(test event.make
  (with-event (event)
    (is (eq (sdl:get-event-type event) :first-event))))

(test event.quit
  (with-video ()
    (with-event (event)
      (drain-events event)
      (push-event (fill-event event 'sdl::quit-event 'type :quit))
      (is (poll-event-of-type event :quit)))))

(test event.type.width
  (with-video ()
    (with-event (event)
      (drain-events event)
      (scribble-event event)
      (setf (c:foreign-slot-value event '(:struct sdl::quit-event) 'type) :quit)
      (push-event event)
      (is (poll-event-of-type event :quit)))))

(test event.keyboard
  (with-window (window)
    (with-event (event)
      (drain-events event)
      (push-key-event event window :b :b)
      (is (poll-event-of-type event :key-down))
      (is (eq (sdl:get-scancode-from-event event) :b))
      (is (eq (sdl:get-keycode-from-event event) :b)))))

(test event.mouse-motion
  (with-window (window)
    (with-event (event)
      (drain-events event)
      (push-event (fill-event event 'sdl::mouse-motion-event
                              'type :mouse-motion
                              'sdl::window-id (sdl:get-window-id window)
                              'sdl::x 3
                              'sdl::y 2
                              'sdl::x-rel -1
                              'sdl::y-rel 1))
      (is (poll-event-of-type event :mouse-motion))
      (is (equal (multiple-value-list (sdl:get-mouse-motion-from-event event)) '(3 2 -1 1))))))

(test event.mouse-button
  (with-window (window)
    (with-event (event)
      (drain-events event)
      (push-event (fill-event event 'sdl::mouse-button-event
                              'type :mouse-button-down
                              'sdl::window-id (sdl:get-window-id window)
                              'sdl::button 3
                              'sdl::state t))
      (is (poll-event-of-type event :mouse-button-down))
      (is (= (sdl:get-mouse-button-from-event event) 3)))))

(test keyboard.key-from-scancode
  (with-video ()
    (is (eq (sdl:get-key-from-scancode :a) :a))
    (is (eq (sdl:get-key-from-scancode :return) :return))))

(test keyboard.scancode-from-key
  (with-video ()
    (is (eq (sdl:get-scancode-from-key :a) :a))
    (is (eq (sdl:get-scancode-from-key :escape) :escape))))

(test mouse.cursor.visibility
  (with-window (window)
    (sdl:hide-cursor)
    (is (= (sdl:show-cursor) 0))
    (is (= (sdl:show-cursor) 1))))

(test mouse.warp
  (with-window (window)
    (is (null (multiple-value-list (sdl:warp-mouse-in-window 2 1 :window window))))))

(test renderer.make
  (with-renderer (window renderer)
    (is (c:pointer-eq (sdl:get-renderer window) renderer))
    (is (c:pointer-eq (sdl:render-get-window renderer) window))
    (is (string= (sdl:get-renderer-info renderer) "software"))
    (is (every #'integerp (multiple-value-list (sdl:get-max-texture-size renderer))))))

(test renderer.output-size
  (with-renderer (window renderer :width 6 :height 3)
    (is (equal (multiple-value-list (sdl:get-renderer-output-size renderer)) '(6 3)))))

(test renderer.draw-color
  (with-renderer (window renderer)
    (sdl:set-render-draw-color renderer :r 1 :g 2 :b 3 :a 4)
    (is (equal (multiple-value-list (sdl:get-render-draw-color renderer)) '(1 2 3 4)))))

(test renderer.draw-blend-mode
  (with-renderer (window renderer)
    (sdl:set-render-draw-blend-mode renderer :add)
    (is (eq (sdl:get-render-draw-blend-mode renderer) :add))
    (sdl:set-render-draw-blend-mode renderer :none)
    (is (eq (sdl:get-render-draw-blend-mode renderer) :none))))

(test renderer.scale
  (with-renderer (window renderer)
    (sdl:render-set-scale renderer :x 2f0 :y 0.5f0)
    (is (equal (multiple-value-list (sdl:render-get-scale renderer)) '(2f0 0.5f0)))))

(test renderer.viewport
  (with-renderer (window renderer)
    (sdl:with-rect (rect :width 4 :height 2 :x 1 :y 1)
      (sdl:render-set-viewport renderer :rect rect)
      (let ((viewport (sdl:render-get-viewport renderer)))
        (unwind-protect
             (progn
               (is (equal (multiple-value-list (sdl:get-rect-position viewport)) '(1 1)))
               (is (equal (multiple-value-list (sdl:get-rect-size viewport)) '(4 2))))
          (sdl:destroy-rect viewport))))))

(test renderer.clip
  (with-renderer (window renderer)
    (is (not (sdl:render-clip-enabled? renderer)))
    (sdl:with-rect (rect :width 3 :height 2 :x 1 :y 1)
      (sdl:render-set-clip-rect renderer :rect rect)
      (is (sdl:render-clip-enabled? renderer))
      (let ((clip (sdl:render-get-clip-rect renderer)))
        (unwind-protect
             (progn
               (is (equal (multiple-value-list (sdl:get-rect-position clip)) '(1 1)))
               (is (equal (multiple-value-list (sdl:get-rect-size clip)) '(3 2))))
          (sdl:destroy-rect clip))))
    (sdl:render-set-clip-rect renderer)
    (is (not (sdl:render-clip-enabled? renderer)))))

(test renderer.scale-quality
  (sdl:set-render-scale-quality :linear)
  (is (string= (%get-hint "SDL_RENDER_SCALE_QUALITY") "1"))
  (sdl:set-render-scale-quality :best)
  (is (string= (%get-hint "SDL_RENDER_SCALE_QUALITY") "2"))
  (sdl:set-render-scale-quality)
  (is (string= (%get-hint "SDL_RENDER_SCALE_QUALITY") "0")))

(test render.clear
  (with-renderer (window renderer)
    (sdl:set-render-draw-color renderer :r 10 :g 20 :b 30)
    (sdl:render-clear renderer)
    (is (every-pixel? (read-pixels renderer 8 4) (rgba 10 20 30 255)))
    (is (null (multiple-value-list (sdl:render-present renderer))))))

(test render.fill-rect
  (with-renderer (window renderer)
    (sdl:set-render-draw-color renderer)
    (sdl:render-clear renderer)
    (sdl:set-render-draw-color renderer :r 255)
    (sdl:with-rect (rect :width 3 :height 2 :x 1 :y 1)
      (sdl:render-fill-rect renderer :rect rect))
    (let ((pixels (read-pixels renderer 8 4)))
      (is (every-pixel? (region pixels 8 1 1 3 2) (rgba 255 0 0 255)))
      (is (every-pixel? (region pixels 8 0 0 8 1) (rgba 0 0 0 255)))
      (is (every-pixel? (region pixels 8 4 1 4 3) (rgba 0 0 0 255))))))

(test render.fill-rect.all
  (with-renderer (window renderer)
    (sdl:set-render-draw-color renderer :g 255)
    (sdl:render-fill-rect renderer)
    (is (every-pixel? (read-pixels renderer 8 4) (rgba 0 255 0 255)))))

(test render.fill-rect-f
  (with-renderer (window renderer)
    (sdl:set-render-draw-color renderer)
    (sdl:render-clear renderer)
    (sdl:set-render-draw-color renderer :b 255)
    (sdl:with-frect (frect :width 2f0 :height 3f0 :x 5f0 :y 1f0)
      (sdl:render-fill-rect-f renderer :rect frect))
    (let ((pixels (read-pixels renderer 8 4)))
      (is (every-pixel? (region pixels 8 5 1 2 3) (rgba 0 0 255 255)))
      (is (every-pixel? (region pixels 8 0 0 5 4) (rgba 0 0 0 255))))))

(test render.draw-line-f
  (with-renderer (window renderer)
    (sdl:set-render-draw-color renderer)
    (sdl:render-clear renderer)
    (sdl:set-render-draw-color renderer :r 255 :g 255 :b 255)
    (sdl:render-draw-line-f renderer :x1 0f0 :y1 2f0 :x2 7f0 :y2 2f0)
    (let ((pixels (read-pixels renderer 8 4)))
      (is (every-pixel? (region pixels 8 0 2 8 1) (rgba 255 255 255 255)))
      (is (every-pixel? (region pixels 8 0 0 8 2) (rgba 0 0 0 255)))
      (is (every-pixel? (region pixels 8 0 3 8 1) (rgba 0 0 0 255))))))

(test render.target
  (with-renderer (window renderer)
    (with-texture (texture renderer 8 4)
      (is (null (sdl:get-render-target renderer)))
      (sdl:set-render-target renderer :texture texture)
      (is (c:pointer-eq (sdl:get-render-target renderer) texture))
      (sdl:set-render-draw-color renderer :r 1 :g 2 :b 3)
      (sdl:render-clear renderer)
      (is (every-pixel? (read-pixels renderer 8 4) (rgba 1 2 3 255)))
      (sdl:set-render-target renderer)
      (is (null (sdl:get-render-target renderer))))))

(test texture.make
  (with-renderer (window renderer)
    (with-texture (texture renderer 5 3 :access :streaming)
      (destructuring-bind (format access width height)
          (multiple-value-list (sdl:query-texture texture))
        (is (= (c:foreign-enum-value 'sdl::pixel-format-type format)
               (c:foreign-enum-value 'sdl::pixel-format-type :rgba8888)))
        (is (eq access :streaming))
        (is (= width 5))
        (is (= height 3))))))

(test texture.alpha-mod
  (with-renderer (window renderer)
    (with-texture (texture renderer 2 2)
      (sdl:set-texture-alpha-mod texture 7)
      (is (= (sdl:get-texture-alpha-mod texture) 7)))))

(test texture.color-mod
  (with-renderer (window renderer)
    (with-texture (texture renderer 2 2)
      (sdl:set-texture-color-mod texture :r 1 :g 2 :b 3)
      (is (equal (multiple-value-list (sdl:get-texture-color-mod texture)) '(1 2 3))))))

(test texture.blend-mode
  (with-renderer (window renderer)
    (with-texture (texture renderer 2 2)
      (sdl:set-texture-blend-mode texture :mod)
      (is (eq (sdl:get-texture-blend-mode texture) :mod)))))

(test texture.scale-mode
  (with-renderer (window renderer)
    (with-texture (texture renderer 2 2)
      (sdl:set-texture-scale-mode texture :linear)
      (is (eq (sdl:get-texture-scale-mode texture) :linear))
      (sdl:set-texture-scale-mode texture :nearest)
      (is (eq (sdl:get-texture-scale-mode texture) :nearest)))))

(test texture.update-from-array
  (with-renderer (window renderer :width 4 :height 2)
    (with-texture (texture renderer 4 2 :access :static)
      (let ((pixels (make-pixels 4 2)))
        (is (null (multiple-value-list (sdl:update-texture/from-array texture 4 2 pixels))))
        (sdl:render-copy renderer texture)
        (is (equalp (read-pixels renderer 4 2) pixels))))))

(test texture.update-from-array.offset
  (with-renderer (window renderer :width 2 :height 2)
    (with-texture (texture renderer 2 2 :access :static)
      (let ((pixels (make-pixels 4 4)))
        (sdl:update-texture/from-array texture 4 4 pixels :x 1 :y 2)
        (sdl:render-copy renderer texture)
        (is (equalp (read-pixels renderer 2 2) (region pixels 4 1 2 2 2)))))))

(test texture.lock
  (with-renderer (window renderer :width 4 :height 2)
    (with-texture (texture renderer 4 2 :access :streaming)
      (let ((pixels (make-pixels 4 2)))
        (multiple-value-bind (pointer pitch) (sdl:lock-texture texture)
          (dotimes (row 2)
            (dotimes (column 4)
              (setf (c:mem-ref pointer :uint32 (+ (* row pitch) (* column 4)))
                    (aref pixels (+ (* row 4) column))))))
        (sdl:unlock-texture texture)
        (sdl:render-copy renderer texture)
        (is (equalp (read-pixels renderer 4 2) pixels))))))

(test render.copy
  (with-renderer (window renderer)
    (with-texture (texture renderer 2 2 :access :static)
      (let ((pixels (make-pixels 2 2)))
        (sdl:update-texture/from-array texture 2 2 pixels)
        (sdl:set-render-draw-color renderer)
        (sdl:render-clear renderer)
        (sdl:with-rect (rect :width 2 :height 2 :x 3 :y 1)
          (sdl:render-copy renderer texture :dest-rect rect))
        (let ((result (read-pixels renderer 8 4)))
          (is (equalp (region result 8 3 1 2 2) pixels))
          (is (every-pixel? (region result 8 0 0 3 4) (rgba 0 0 0 255))))))))

(test render.copy.source-rect
  (with-renderer (window renderer :width 2 :height 1)
    (with-texture (texture renderer 4 2 :access :static)
      (let ((pixels (make-pixels 4 2)))
        (sdl:update-texture/from-array texture 4 2 pixels)
        (sdl:with-rect (rect :width 2 :height 1 :x 1 :y 1)
          (sdl:render-copy renderer texture :source-rect rect))
        (is (equalp (read-pixels renderer 2 1) (region pixels 4 1 1 2 1)))))))

(test render.copy.flip
  (with-renderer (window renderer :width 4 :height 2)
    (with-texture (texture renderer 4 2 :access :static)
      (let ((pixels (make-pixels 4 2)))
        (sdl:update-texture/from-array texture 4 2 pixels)
        (sdl:render-copy renderer texture :flip :horizontal)
        (is (equalp (read-pixels renderer 4 2) (mirror pixels 4 2)))))))

(test render.copy-f
  (with-renderer (window renderer)
    (with-texture (texture renderer 2 2 :access :static)
      (let ((pixels (make-pixels 2 2)))
        (sdl:update-texture/from-array texture 2 2 pixels)
        (sdl:set-render-draw-color renderer)
        (sdl:render-clear renderer)
        (sdl:with-frect (frect :width 2f0 :height 2f0 :x 5f0 :y 2f0)
          (sdl:render-copy-f renderer texture :dest-rect frect))
        (let ((result (read-pixels renderer 8 4)))
          (is (equalp (region result 8 5 2 2 2) pixels))
          (is (every-pixel? (region result 8 0 0 5 4) (rgba 0 0 0 255))))))))
