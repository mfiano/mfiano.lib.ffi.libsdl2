(in-package #:mfiano.lib.ffi.libsdl2)

(defun copy-rect (rect)
  (assert (valid-pointer? rect))
  (c:with-foreign-slots ((width height x y) rect (:struct rect))
    (make-object 'rect 'width width 'height height 'x x 'y y)))

(defun destroy-event (event)
  (assert (valid-pointer? event))
  (c:foreign-free event)
  (values))

(defun destroy-frect (frect)
  (assert (valid-pointer? frect))
  (c:foreign-free frect)
  (values))

(defun destroy-gl-context (context)
  (assert (valid-pointer? context))
  (%gl-delete-context context)
  (values))

(defun destroy-rect (rect)
  (assert (valid-pointer? rect))
  (c:foreign-free rect)
  (values))

(defun destroy-pixel-format (pixel-format)
  (assert (valid-pointer? pixel-format))
  (%free-format pixel-format)
  (values))

(defun destroy-renderer (renderer)
  (assert (valid-pointer? renderer))
  (%destroy-renderer renderer)
  (values))

(defun destroy-texture (texture)
  (assert (valid-pointer? texture))
  (%destroy-texture texture)
  (values))

(defun destroy-window (window)
  (assert (valid-pointer? window))
  (%destroy-window window)
  (values))

(defun disable-relative-mouse-mode ()
  (%set-relative-mouse-mode nil)
  (values))

(defun enable-relative-mouse-mode ()
  (%set-relative-mouse-mode t)
  (values))

(defun frect-height (frect)
  (assert (valid-pointer? frect))
  (c:foreign-slot-value frect '(:struct frect) 'height))

(defun (setf frect-height) (value frect)
  (check-type value f32)
  (assert (valid-pointer? frect))
  (setf (c:foreign-slot-value frect '(:struct frect) 'height) value))

(defun frect-width (frect)
  (assert (valid-pointer? frect))
  (c:foreign-slot-value frect '(:struct frect) 'width))

(defun (setf frect-width) (value frect)
  (check-type value f32)
  (assert (valid-pointer? frect))
  (setf (c:foreign-slot-value frect '(:struct frect) 'width) value))

(defun frect-x (frect)
  (assert (valid-pointer? frect))
  (c:foreign-slot-value frect '(:struct frect) 'x))

(defun (setf frect-x) (value frect)
  (check-type value f32)
  (assert (valid-pointer? frect))
  (setf (c:foreign-slot-value frect '(:struct frect) 'x) value))

(defun frect-y (frect)
  (assert (valid-pointer? frect))
  (c:foreign-slot-value frect '(:struct frect) 'y))

(defun (setf frect-y) (value frect)
  (check-type value f32)
  (assert (valid-pointer? frect))
  (setf (c:foreign-slot-value frect '(:struct frect) 'y) value))

(defun get-base-path ()
  (let ((pointer (%get-base-path)))
    (unwind-protect (c:foreign-string-to-lisp pointer)
      (%free pointer))))

(defun get-cpu-count ()
  (%get-cpu-count))

(defun get-current-display-mode (window)
  (assert (valid-pointer? window))
  (let ((display-index (get-window-display-index window)))
    (c:with-foreign-object (mode '(:struct display-mode))
      (%get-current-display-mode display-index mode)
      (foreign-slot-values mode '(:struct display-mode)))))

(defun get-display-name (display-index)
  (check-type display-index i32!-)
  (%get-display-name display-index))

(defun get-event-type (event)
  (c:foreign-slot-value event '(:struct event) 'type))

(defun get-frect-position (frect)
  (assert (valid-pointer? frect))
  (values (c:foreign-slot-value frect '(:struct frect) 'x)
          (c:foreign-slot-value frect '(:struct frect) 'y)))

(defun get-frect-size (frect)
  (assert (valid-pointer? frect))
  (values (c:foreign-slot-value frect '(:struct frect) 'width)
          (c:foreign-slot-value frect '(:struct frect) 'height)))

(defun get-keycode-from-event (event)
  (assert (valid-pointer? event))
  (let ((key (c:foreign-slot-pointer event '(:struct keyboard-event) 'keysym)))
    (c:foreign-slot-value key '(:struct keysym) 'sym)))

(defun get-key-from-scancode (scancode)
  (check-type scancode #.(member-keys 'scancode))
  (%get-key-from-scancode scancode))

(defun get-max-texture-size (renderer)
  (assert (valid-pointer? renderer))
  (c:with-foreign-object (info '(:struct renderer-info))
    (c:with-foreign-slots ((max-texture-width max-texture-height) info (:struct renderer-info))
      (%get-renderer-info renderer info)
      (values max-texture-width max-texture-height))))

(defun get-mouse-button-from-event (event)
  (assert (valid-pointer? event))
  (c:foreign-slot-value event '(:struct mouse-button-event) 'button))

(defun get-mouse-motion-from-event (event)
  (assert (valid-pointer? event))
  (values (c:foreign-slot-value event '(:struct mouse-motion-event) 'x)
          (c:foreign-slot-value event '(:struct mouse-motion-event) 'y)
          (c:foreign-slot-value event '(:struct mouse-motion-event) 'x-rel)
          (c:foreign-slot-value event '(:struct mouse-motion-event) 'y-rel)))

(defun get-mouse-wheel-from-event (event)
  (assert (valid-pointer? event))
  (values (c:foreign-slot-value event '(:struct mouse-wheel-event) 'x)
          (c:foreign-slot-value event '(:struct mouse-wheel-event) 'y)))

(defun get-performance-counter ()
  (%get-performance-counter))

(defun get-performance-frequency ()
  (%get-performance-frequency))

(defun get-pref-path (org app)
  (check-type org string)
  (check-type app string)
  (%get-pref-path org app))

(defun get-rect-position (rect)
  (assert (valid-pointer? rect))
  (values (c:foreign-slot-value rect '(:struct rect) 'x)
          (c:foreign-slot-value rect '(:struct rect) 'y)))

(defun get-rect-size (rect)
  (assert (valid-pointer? rect))
  (values (c:foreign-slot-value rect '(:struct rect) 'width)
          (c:foreign-slot-value rect '(:struct rect) 'height)))

(defun get-refresh-rate (window)
  (nth-value 3 (get-current-display-mode window)))

(defun get-render-draw-blend-mode (renderer)
  (assert (valid-pointer? renderer))
  (c:with-foreign-object (blend-mode 'blend-mode)
    (%get-render-draw-blend-mode renderer blend-mode)
    (c:mem-ref blend-mode 'blend-mode)))

(defun get-render-draw-color (renderer)
  (assert (valid-pointer? renderer))
  (c:with-foreign-objects ((r :uint8) (g :uint8) (b :uint8) (a :uint8))
    (%get-render-draw-color renderer r g b a)
    (values (c:mem-ref r :uint8)
            (c:mem-ref g :uint8)
            (c:mem-ref b :uint8)
            (c:mem-ref a :uint8))))

(defun get-render-target (renderer)
  (assert (valid-pointer? renderer))
  (let ((target (%get-render-target renderer)))
    (unless (c:null-pointer-p target)
      target)))

(defun get-renderer (window)
  (assert (valid-pointer? window))
  (%get-renderer window))

(defun get-renderer-info (renderer)
  (assert (valid-pointer? renderer))
  (c:with-foreign-object (renderer-info '(:struct renderer-info))
    (%get-renderer-info renderer renderer-info)
    (foreign-slot-values renderer-info '(:struct renderer-info))))

(defun get-renderer-output-size (renderer)
  (assert (valid-pointer? renderer))
  (c:with-foreign-objects ((width :int) (height :int))
    (%get-renderer-output-size renderer width height)
    (values (c:mem-ref width :int)
            (c:mem-ref height :int))))

(defun get-rgb (pixel)
  (check-type pixel u24)
  (c:with-foreign-objects ((r :uint8) (g :uint8) (b :uint8))
    (let ((format (%alloc-format :rgb888)))
      (unwind-protect (%get-rgb pixel format r g b)
        (%free-format format))
      (values (c:mem-ref r :uint8)
              (c:mem-ref g :uint8)
              (c:mem-ref b :uint8)))))

(defun get-rgba (pixel)
  (check-type pixel u32)
  (c:with-foreign-objects ((r :uint8) (g :uint8) (b :uint8) (a :uint8))
    (let ((format (%alloc-format :rgba8888)))
      (unwind-protect (%get-rgba pixel format r g b a)
        (%free-format format))
      (values (c:mem-ref r :uint8)
              (c:mem-ref g :uint8)
              (c:mem-ref b :uint8)
              (c:mem-ref a :uint8)))))

(defun get-scancode-from-event (event)
  (assert (valid-pointer? event))
  (let ((key (c:foreign-slot-pointer event '(:struct keyboard-event) 'keysym)))
    (c:foreign-slot-value key '(:struct keysym) 'scancode)))

(defun get-scancode-from-key (key)
  (check-type key #.(member-keys 'keycode))
  (%get-scancode-from-key key))

(defun get-texture-alpha-mod (texture)
  (assert (valid-pointer? texture))
  (c:with-foreign-object (alpha :uint8)
    (%get-texture-alpha-mod texture alpha)
    (c:mem-ref alpha :uint8)))

(defun get-texture-blend-mode (texture)
  (assert (valid-pointer? texture))
  (c:with-foreign-object (blend-mode 'blend-mode)
    (%get-texture-blend-mode texture blend-mode)
    (c:mem-ref blend-mode 'blend-mode)))

(defun get-texture-color-mod (texture)
  (assert (valid-pointer? texture))
  (c:with-foreign-objects ((r :uint8) (g :uint8) (b :uint8))
    (%get-texture-color-mod texture r g b)
    (values (c:mem-ref r :uint8)
            (c:mem-ref g :uint8)
            (c:mem-ref b :uint8))))

(defun get-texture-scale-mode (texture)
  (assert (valid-pointer? texture))
  (c:with-foreign-object (scale-mode 'scale-mode)
    (%get-texture-scale-mode texture scale-mode)
    (c:mem-ref scale-mode 'scale-mode)))

(defun get-window-display-index (window)
  (assert (valid-pointer? window))
  (%get-window-display-index window))

(defun get-window-display-mode (window)
  (assert (valid-pointer? window))
  (c:with-foreign-object (mode '(:struct display-mode))
    (%get-window-display-mode window mode)
    (foreign-slot-values mode '(:struct display-mode))))

(defun get-window-event-type (event)
  (assert (valid-pointer? event))
  (c:foreign-slot-value event '(:struct window-event) 'event))

(defun get-window-from-id (window-id)
  (check-type window-id u32)
  (%get-window-from-id window-id))

(defun get-window-id (window)
  (assert (valid-pointer? window))
  (%get-window-id window))

(defun get-window-pixel-format (window)
  (assert (valid-pointer? window))
  (let ((pixel-format (%get-window-pixel-format window)))
    (c:foreign-enum-keyword 'pixel-format-type pixel-format)))

(defun get-window-position (window)
  (assert (valid-pointer? window))
  (c:with-foreign-objects ((x :int) (y :int))
    (%get-window-position window x y)
    (values (c:mem-ref x :int)
            (c:mem-ref y :int))))

(defun get-window-size (window)
  (assert (valid-pointer? window))
  (c:with-foreign-objects ((width :int) (height :int))
    (%get-window-size window width height)
    (values (c:mem-ref width :int)
            (c:mem-ref height :int))))

(defun get-window-size-in-pixels (window)
  (assert (valid-pointer? window))
  (c:with-foreign-objects ((width :int) (height :int))
    (%get-window-size-in-pixels window width height)
    (values (c:mem-ref width :int)
            (c:mem-ref height :int))))

(defun get-window-title (window)
  (assert (valid-pointer? window))
  (%get-window-title window))

(defun gl-get-attribute (attribute)
  (check-type attribute #.(member-keys 'gl-attr))
  (c:with-foreign-object (value :int)
    (%gl-get-attribute attribute value)
    (c:mem-ref value :int)))

(defun gl-get-current-context ()
  (%gl-get-current-context))

(defun gl-get-current-window ()
  (%gl-get-current-window))

(defun gl-get-drawable-size (window)
  (assert (valid-pointer? window))
  (c:with-foreign-objects ((width :int) (height :int))
    (%gl-get-drawable-size window width height)
    (values (c:mem-ref width :int)
            (c:mem-ref height :int))))

(defun gl-get-swap-interval ()
  (%gl-get-swap-interval))

(defun gl-make-current (window context)
  (assert (valid-pointer? window))
  (assert (valid-pointer? context))
  (%gl-make-current window context)
  (values))

(defun gl-reset-attributes ()
  (%gl-reset-attributes))

(defun gl-set-attribute (attribute value)
  (check-type attribute #.(member-keys 'gl-attr))
  (check-type value i32)
  (%gl-set-attribute attribute value)
  (values))

(defun gl-set-swap-interval (interval)
  (check-type interval i32)
  (%gl-set-swap-interval interval)
  (values))

(defun gl-swap-window (window)
  (assert (valid-pointer? window))
  (%gl-swap-window window)
  (values))

(defun has-intersection? (rect1 rect2)
  (assert (valid-pointer? rect1))
  (assert (valid-pointer? rect2))
  (%has-intersection rect1 rect2))

(defun has-intersection-f? (frect1 frect2)
  (assert (valid-pointer? frect1))
  (assert (valid-pointer? frect2))
  (%has-intersection-f frect1 frect2))

(defun hide-cursor ()
  (%show-cursor 0))

(defun hide-window (window)
  (assert (valid-pointer? window))
  (%hide-window window)
  (values))

(defun init (&rest flags)
  (%init flags)
  (values))

(defun intersect-rect (rect1 rect2)
  (assert (valid-pointer? rect1))
  (assert (valid-pointer? rect2))
  (let ((result (make-object 'rect)))
    (if (%intersect-rect rect1 rect2 result)
        result
        (progn (free-object result) nil))))

(defun intersect-rect-f (frect1 frect2)
  (assert (valid-pointer? frect1))
  (assert (valid-pointer? frect2))
  (let ((result (make-object 'frect)))
    (if (%intersect-rect-f frect1 frect2 result)
        result
        (progn (free-object result) nil))))

(defun lock-texture (texture &key rect)
  (assert (valid-pointer? texture))
  (check-type rect (or object null))
  (let ((rect (or rect (c:null-pointer))))
    (c:with-foreign-objects ((pixels :pointer) (pitch :int))
      (%lock-texture texture rect pixels pitch)
      (values (c:mem-ref pixels :pointer)
              (c:mem-ref pitch :int)))))

(defun make-event ()
  (make-object 'event 'type :first-event))

(defun make-frect (width height &key (x 0f0) (y 0f0))
  (check-type width (or i32!- f32!-))
  (check-type height (or i32!- f32!-))
  (check-type x (or i32 f32))
  (check-type y (or i32 f32))
  (make-object 'frect 'width (f32 width) 'height (f32 height) 'x (f32 x) 'y (f32 y)))

(defun make-gl-context (window)
  (assert (valid-pointer? window))
  (%gl-create-context window))

(defun make-pixel-format (type)
  (check-type type #.(member-keys 'pixel-format-type))
  (%alloc-format type))

(defun make-rect (width height &key (x 0) (y 0))
  (check-type width (or i32!- f32!-))
  (check-type height (or i32!- f32!-))
  (check-type x (or i32 f32))
  (check-type y (or i32 f32))
  (make-object 'rect 'width (floor width) 'height (floor height) 'x (floor x) 'y (floor y)))

(defun make-renderer (window &key (index -1) flags)
  (assert (valid-pointer? window))
  (check-type index i32)
  (check-type flags list)
  (let ((flags (or flags '(:accelerated :present-vsync :target-texture))))
    (%create-renderer window index flags)))

(defun make-texture (renderer width height &key (access :target))
  (assert (valid-pointer? renderer))
  (check-type width i32+)
  (check-type height i32+)
  (%create-texture renderer :rgba8888 access width height))

(defun make-window (width height &key (x :undefined) (y :undefined) (title "") flags)
  (check-type width u16)
  (check-type height u16)
  (check-type x (or i32 #.(member-keys 'window-position)))
  (check-type y (or i32 #.(member-keys 'window-position)))
  (check-type title string)
  (check-type flags list)
  (%create-window title x y width height flags))

(defun map-rgb (r g b &key (pixel-format :rgb888))
  (check-type r u8)
  (check-type g u8)
  (check-type b u8)
  (check-type pixel-format #.(member-keys 'pixel-format-type))
  (let ((format (%alloc-format pixel-format))
        (value 0))
    (unwind-protect (setf value (%map-rgb format r g b))
      (%free-format format))
    (values (ldb (byte 8 16) value)
            (ldb (byte 8 8) value)
            (ldb (byte 8 0) value))))

(defun map-rgba (r g b a &key (pixel-format :rgba8888))
  (check-type r u8)
  (check-type g u8)
  (check-type b u8)
  (check-type a u8)
  (check-type pixel-format #.(member-keys 'pixel-format-type))
  (let ((format (%alloc-format pixel-format))
        (value 0))
    (unwind-protect (setf value (%map-rgba format r g b a))
      (%free-format format))
    (values (ldb (byte 8 24) value)
            (ldb (byte 8 16) value)
            (ldb (byte 8 8) value)
            (ldb (byte 8 0) value))))

(defun maximize-window (window)
  (assert (valid-pointer? window))
  (%maximize-window window)
  (values))

(defun minimize-window (window)
  (assert (valid-pointer? window))
  (%minimize-window window)
  (values))

(defun poll-event (event)
  (assert (valid-pointer? event))
  (%poll-event event))

(defun query-texture (texture)
  (assert (valid-pointer? texture))
  (c:with-foreign-objects ((format 'pixel-format-type)
                           (access 'texture-access)
                           (width :int)
                           (height :int))
    (%query-texture texture format access width height)
    (values (c:mem-ref format 'pixel-format-type)
            (c:mem-ref access 'texture-access)
            (c:mem-ref width :int)
            (c:mem-ref height :int))))

(defun quit ()
  (%quit)
  (values))

(defun raise-window (window)
  (assert (valid-pointer? window))
  (%raise-window window)
  (values))

(defun rect-height (rect)
  (assert (valid-pointer? rect))
  (c:foreign-slot-value rect '(:struct rect) 'height))

(defun (setf rect-height) (value rect)
  (check-type value i32!-)
  (assert (valid-pointer? rect))
  (setf (c:foreign-slot-value rect '(:struct rect) 'height) value))

(defun rect-width (rect)
  (assert (valid-pointer? rect))
  (c:foreign-slot-value rect '(:struct rect) 'width))

(defun (setf rect-width) (value rect)
  (check-type value i32!-)
  (assert (valid-pointer? rect))
  (setf (c:foreign-slot-value rect '(:struct rect) 'width) value))

(defun rect-x (rect)
  (assert (valid-pointer? rect))
  (c:foreign-slot-value rect '(:struct rect) 'x))

(defun (setf rect-x) (value rect)
  (check-type value i32)
  (assert (valid-pointer? rect))
  (setf (c:foreign-slot-value rect '(:struct rect) 'x) value))

(defun rect-y (rect)
  (assert (valid-pointer? rect))
  (c:foreign-slot-value rect '(:struct rect) 'y))

(defun (setf rect-y) (value rect)
  (check-type value i32)
  (assert (valid-pointer? rect))
  (setf (c:foreign-slot-value rect '(:struct rect) 'y) value))

(defun relative-mouse-mode? ()
  (%get-relative-mouse-mode))

(defun render-clear (renderer)
  (assert (valid-pointer? renderer))
  (%render-clear renderer)
  (values))

(defun render-clip-enabled? (renderer)
  (assert (valid-pointer? renderer))
  (%render-is-clip-enabled renderer))

(defun axis-flip (flip-x flip-y)
  (cond
    ((and flip-x flip-y)
     :horizontal-and-vertical)
    (flip-x
     :horizontal)
    (flip-y
     :vertical)
    (t
     :none)))

(defun render-copy (renderer texture
                    &key
                      source-rect
                      dest-rect
                      (angle 0d0)
                      (center-x nil)
                      (center-y nil)
                      flip-x
                      flip-y)
  (assert (valid-pointer? renderer))
  (assert (valid-pointer? texture))
  (check-type source-rect (or object null))
  (check-type dest-rect (or object null))
  (check-type angle real)
  (check-type center-x (or i32 null))
  (check-type center-y (or i32 null))
  (let* ((source-rect (or source-rect (c:null-pointer)))
         (dest-rect (or dest-rect (c:null-pointer)))
         (angle (f64 angle))
         (center? (and center-x center-y))
         (center (if center?
                     (make-object 'point 'x center-x 'y center-y)
                     (cffi:null-pointer))))
    (unwind-protect (%render-copy-ex renderer
                                     texture
                                     source-rect
                                     dest-rect
                                     angle
                                     center
                                     (axis-flip flip-x flip-y))
      (when center?
        (free-object center)))
    (values)))

(defun render-copy-f (renderer texture
                      &key
                        source-rect
                        dest-rect
                        (angle 0d0)
                        (center-x nil)
                        (center-y nil)
                        flip-x
                        flip-y)
  (assert (valid-pointer? renderer))
  (assert (valid-pointer? texture))
  (check-type source-rect (or object null))
  (check-type dest-rect (or object null))
  (check-type angle real)
  (check-type center-x (or real null))
  (check-type center-y (or real null))
  (let* ((source-rect (or source-rect (c:null-pointer)))
         (dest-rect (or dest-rect (c:null-pointer)))
         (angle (f64 angle))
         (center? (and center-x center-y))
         (center (if center?
                     (make-object 'fpoint 'x (f32 center-x) 'y (f32 center-y))
                     (cffi:null-pointer))))
    (unwind-protect (%render-copy-ex-f renderer
                                       texture
                                       source-rect
                                       dest-rect
                                       angle
                                       center
                                       (axis-flip flip-x flip-y))
      (when center?
        (free-object center)))
    (values)))

(defun render-draw-line-f (renderer &key (x1 0f0) (y1 0f0) (x2 0f0) (y2 0f0))
  (assert (valid-pointer? renderer))
  (check-type x1 f32)
  (check-type y1 f32)
  (check-type x2 f32)
  (check-type y2 f32)
  (%render-draw-line-f renderer x1 y1 x2 y2)
  (values))

(defun render-fill-rect (renderer &key rect)
  (assert (valid-pointer? renderer))
  (let ((rect (or rect (c:null-pointer))))
    (%render-fill-rect renderer rect)
    (values)))

(defun render-fill-rect-f (renderer &key rect)
  (assert (valid-pointer? renderer))
  (let ((rect (or rect (c:null-pointer))))
    (%render-fill-rect-f renderer rect)
    (values)))

(defun render-get-clip-rect (renderer)
  (assert (valid-pointer? renderer))
  (let ((rect (make-object 'rect)))
    (%render-get-clip-rect renderer rect)
    rect))

(defun render-get-scale (renderer)
  (assert (valid-pointer? renderer))
  (c:with-foreign-objects ((scale-x :float) (scale-y :float))
    (%render-get-scale renderer scale-x scale-y)
    (values (c:mem-ref scale-x :float)
            (c:mem-ref scale-y :float))))

(defun render-get-viewport (renderer)
  (assert (valid-pointer? renderer))
  (let ((rect (make-object 'rect)))
    (%render-get-viewport renderer rect)
    rect))

(defun render-get-window (renderer)
  (assert (valid-pointer? renderer))
  (%render-get-window renderer))

(defun render-present (renderer)
  (assert (valid-pointer? renderer))
  (%render-present renderer)
  (values))

(defun render-set-clip-rect (renderer &key rect)
  (assert (valid-pointer? renderer))
  (check-type rect (or object null))
  (let ((rect (or rect (c:null-pointer))))
    (%render-set-clip-rect renderer rect)
    (values)))

(defun render-set-scale (renderer &key (x 1f0) (y 1f0))
  (assert (valid-pointer? renderer))
  (check-type x f32)
  (check-type y f32)
  (%render-set-scale renderer x y)
  (values))

(defun render-set-viewport (renderer &key rect)
  (assert (valid-pointer? renderer))
  (check-type rect (or object null))
  (let ((rect (or rect (c:null-pointer))))
    (%render-set-viewport renderer rect)
    (values)))

(defun restore-window (window)
  (assert (valid-pointer? window))
  (%restore-window window)
  (values))

(defun set-render-draw-blend-mode (renderer blend-mode)
  (assert (valid-pointer? renderer))
  (check-type blend-mode #.(member-keys 'blend-mode))
  (%set-render-draw-blend-mode renderer blend-mode)
  (values))

(defun set-render-draw-color (renderer &key (r 0) (g 0) (b 0) (a 255))
  (assert (valid-pointer? renderer))
  (check-type r u8)
  (check-type g u8)
  (check-type b u8)
  (check-type a u8)
  (%set-render-draw-color renderer r g b a)
  (values))

(defun set-render-scale-quality (&optional (quality :nearest))
  (%set-hint "SDL_RENDER_SCALE_QUALITY"
             (ecase quality
               (:nearest "0")
               (:linear "1")
               (:best "2")))
  (values))

(defun set-render-target (renderer &key texture)
  (assert (valid-pointer? renderer))
  (let ((texture (or texture (c:null-pointer))))
    (%set-render-target renderer texture)
    (values)))

(defun set-texture-alpha-mod (texture alpha)
  (assert (valid-pointer? texture))
  (check-type alpha u8)
  (%set-texture-alpha-mod texture alpha)
  (values))

(defun set-texture-blend-mode (texture blend-mode)
  (assert (valid-pointer? texture))
  (check-type blend-mode #.(member-keys 'blend-mode))
  (%set-texture-blend-mode texture blend-mode)
  (values))

(defun set-texture-color-mod (texture &key (r 255) (g 255) (b 255))
  (assert (valid-pointer? texture))
  (check-type r u8)
  (check-type g u8)
  (check-type b u8)
  (%set-texture-color-mod texture r g b)
  (values))

(defun set-texture-scale-mode (texture scale-mode)
  (assert (valid-pointer? texture))
  (check-type scale-mode #.(member-keys 'scale-mode))
  (%set-texture-scale-mode texture scale-mode)
  (values))

(defun set-window-always-on-top (window &optional (on-top t))
  (assert (valid-pointer? window))
  (check-type on-top boolean)
  (%set-window-always-on-top window on-top)
  (values))

(defun set-window-fullscreen (window &optional (flag :fullscreen-desktop))
  (assert (valid-pointer? window))
  (check-type flag #.(member-keys 'window-fullscreen-flags))
  (%set-window-fullscreen window flag)
  (values))

(defun set-window-keyboard-grab (window &optional (grabbed t))
  (assert (valid-pointer? window))
  (check-type grabbed boolean)
  (%set-window-keyboard-grab window grabbed)
  (values))

(defun set-window-maximum-size (window width height)
  (assert (valid-pointer? window))
  (check-type width i32)
  (check-type height i32)
  (%set-window-maximum-size window width height)
  (values))

(defun set-window-minimum-size (window width height)
  (assert (valid-pointer? window))
  (check-type width i32)
  (check-type height i32)
  (%set-window-minimum-size window width height)
  (values))

(defun set-window-position (window &key (x :undefined) (y :undefined))
  (assert (valid-pointer? window))
  (check-type x (or i32 #.(member-keys 'window-position)))
  (check-type y (or i32 #.(member-keys 'window-position)))
  (flet ((encode (value)
           (if (keywordp value)
               (c:foreign-enum-value 'window-position value)
               value)))
    (%set-window-position window (encode x) (encode y))
    (values)))

(defun set-window-resizable (window &optional (flag t))
  (assert (valid-pointer? window))
  (check-type flag boolean)
  (%set-window-resizable window flag)
  (values))

(defun set-window-size (window width height)
  (assert (valid-pointer? window))
  (check-type width u16)
  (check-type height u16)
  (%set-window-size window width height)
  (values))

(defun set-window-title (window title)
  (assert (valid-pointer? window))
  (check-type title string)
  (%set-window-title window title)
  (values))

(defun show-cursor ()
  (%show-cursor 1))

(defun show-window (window)
  (assert (valid-pointer? window))
  (%show-window window)
  (values))

(defun update-frect (frect &key width height x y)
  (check-type width (or f32+ null))
  (check-type height (or f32+ null))
  (check-type x (or f32 null))
  (check-type y (or f32 null))
  (c:with-foreign-slots (((%width width) (%height height) (%x x) (%y y)) frect (:struct frect))
    (when width
      (setf %width width))
    (when height
      (setf %height height))
    (when x
      (setf %x x))
    (when y
      (setf %y y))))

(defun unlock-texture (texture)
  (assert (valid-pointer? texture))
  (%unlock-texture texture)
  (values))

(defun update-rect (rect &key width height x y)
  (check-type width (or i32+ null))
  (check-type height (or i32+ null))
  (check-type x (or i32 null))
  (check-type y (or i32 null))
  (c:with-foreign-slots (((%width width) (%height height) (%x x) (%y y)) rect (:struct rect))
    (when width
      (setf %width width))
    (when height
      (setf %height height))
    (when x
      (setf %x x))
    (when y
      (setf %y y))))

(defun update-texture/from-array (texture width height data &key rect (x 0) (y 0))
  (assert (valid-pointer? texture))
  (check-type width i32+)
  (check-type height i32+)
  (check-type data (u32-array (*)))
  (check-type rect (or object null))
  (check-type x i32!-)
  (check-type y i32!-)
  (multiple-value-bind (format access texture-width texture-height) (query-texture texture)
    (declare (ignore access))
    (assert (member format '(#+big-endian :rgba32 #+little-endian :abgr32 :rgba8888)))
    (let* ((dest-width texture-width)
           (dest-height texture-height)
           (pitch (* width 4))
           (offset (+ (* x 4) (* y pitch))))
      (assert (>= (array-total-size data) (* width height)))
      (when rect
        (c:with-foreign-slots ((width height x y) rect (:struct rect))
          (assert (<= 0 x (1- texture-width)))
          (assert (<= 0 y (1- texture-height)))
          (assert (<= (+ x width) texture-width))
          (assert (<= (+ y height) texture-height))
          (setf dest-width width
                dest-height height)))
      (assert (<= (+ x dest-width) width))
      (assert (<= (+ y dest-height) height))
      (sv:with-static-vector (pixels (length data) :element-type 'u32 :initial-contents data)
        (%update-texture texture
                         (or rect (c:null-pointer))
                         (sv:static-vector-pointer pixels :offset offset)
                         pitch))
      (values))))

(defun warp-mouse-in-window (x y &key window)
  (check-type x i32)
  (check-type y i32)
  (check-type window (or object null))
  (%warp-mouse-in-window (or window (c:null-pointer)) x y)
  (values))

(defun was-init (&rest flags)
  (%was-init flags))

(defmacro with-frect ((frect &key (width 0f0) (height 0f0) (x 0f0) (y 0f0)) &body body)
  `(let ((,frect (make-frect ,width ,height :x ,x :y ,y)))
     (unwind-protect (progn ,@body)
       (c:foreign-free ,frect))))

(defmacro with-rect ((rect &key (width 0) (height 0) (x 0) (y 0)) &body body)
  `(let ((,rect (make-rect ,width ,height :x ,x :y ,y)))
     (unwind-protect (progn ,@body)
       (c:foreign-free ,rect))))
