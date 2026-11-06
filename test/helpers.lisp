(in-package #:mfiano.lib.base.pkg)

(define-package #:mfiano.lib.ffi.libsdl2/test
  (:local-nicknames
   (#:c #:cffi)
   (#:sdl #:mfiano.lib.ffi.libsdl2))
  (:use #:mfiano.lib.base.util #:1am))

(in-package #:mfiano.lib.ffi.libsdl2/test)

(c:defcfun ("SDL_GetHint" %get-hint) :string
  (name :string))

(c:defcfun ("SDL_GetWindowFlags" %get-window-flags) sdl::window-flags
  (window :pointer))

(c:defcfun ("SDL_PushEvent" %push-event) :int
  (event :pointer))

(c:defcfun ("SDL_RenderReadPixels" %render-read-pixels) :int
  (renderer :pointer)
  (rect :pointer)
  (format sdl::pixel-format-type)
  (pixels :pointer)
  (pitch :int))

(defmacro with-video (() &body body)
  `(progn
     (sdl::%set-hint "SDL_VIDEODRIVER" "offscreen")
     (sdl:init :video)
     (unwind-protect (progn ,@body)
       (sdl:quit))))

(defmacro with-window ((window &key (width 8) (height 4)) &body body)
  `(with-video ()
     (let ((,window (sdl:make-window ,width ,height :flags '(:hidden))))
       (unwind-protect (progn ,@body)
         (sdl:destroy-window ,window)))))

(defmacro with-renderer ((window renderer &key (width 8) (height 4)) &body body)
  `(with-window (,window :width ,width :height ,height)
     (let ((,renderer (sdl:make-renderer ,window :flags '(:software :target-texture))))
       (unwind-protect (progn ,@body)
         (sdl:destroy-renderer ,renderer)))))

(defmacro with-texture ((texture renderer width height &key (access :target)) &body body)
  `(let ((,texture (sdl:make-texture ,renderer ,width ,height :access ,access)))
     (unwind-protect (progn ,@body)
       (sdl:destroy-texture ,texture))))

(defmacro with-event ((event) &body body)
  `(let ((,event (sdl:make-event)))
     (unwind-protect (progn ,@body)
       (sdl:destroy-event ,event))))

(defun rgba (r g b a)
  (logior (ash r 24) (ash g 16) (ash b 8) a))

(defun make-pixels (width height)
  (let ((pixels (make-u32-array (* width height))))
    (dotimes (i (* width height) pixels)
      (setf (aref pixels i) (rgba (* i 15) (- 255 (* i 15)) (* i 7) 255)))))

(defun region (pixels width x y region-width region-height)
  (let ((result (make-u32-array (* region-width region-height))))
    (dotimes (row region-height result)
      (dotimes (column region-width)
        (setf (aref result (+ (* row region-width) column))
              (aref pixels (+ (* (+ y row) width) x column)))))))

(defun mirror (pixels width height)
  (let ((result (make-u32-array (* width height))))
    (dotimes (row height result)
      (dotimes (column width)
        (setf (aref result (+ (* row width) column))
              (aref pixels (+ (* row width) (- width column 1))))))))

(defun read-pixels (renderer width height)
  (let ((pixels (make-u32-array (* width height))))
    (sdl:with-rect (rect :width width :height height)
      (c:with-pointer-to-vector-data (pointer pixels)
        (assert (zerop (%render-read-pixels renderer rect :rgba8888 pointer (* width 4))))))
    pixels))

(defun every-pixel? (pixels value)
  (every (lambda (x) (= x value)) pixels))

(defun window-events (event)
  (loop :while (sdl:poll-event event)
        :when (eq (sdl:get-event-type event) :window-event)
          :collect (sdl:get-window-event-type event)))

(defun drain-events (event)
  (loop :while (sdl:poll-event event)))

(defun fill-event (event type &rest slots)
  (let ((struct `(:struct ,type)))
    (dotimes (i (c:foreign-type-size '(:struct sdl::event)))
      (setf (c:mem-aref event :uint8 i) 0))
    (do-plist (slot value slots)
      (setf (c:foreign-slot-value event struct slot) value))
    event))

(defun scribble-event (event)
  (dotimes (i (c:foreign-type-size '(:struct sdl::event)) event)
    (setf (c:mem-aref event :uint8 i) #xff)))

(defun push-event (event)
  (assert (= (%push-event event) 1)))

(defun push-key-event (event window scancode keycode)
  (fill-event event 'sdl::keyboard-event
              'type :key-down
              'sdl::window-id (sdl:get-window-id window)
              'sdl::state t)
  (let ((keysym (c:foreign-slot-pointer event '(:struct sdl::keyboard-event) 'sdl::keysym)))
    (setf (c:foreign-slot-value keysym '(:struct sdl::keysym) 'sdl::scancode) scancode
          (c:foreign-slot-value keysym '(:struct sdl::keysym) 'sdl::sym) keycode))
  (push-event event))

(defun poll-event-of-type (event type)
  (loop :while (sdl:poll-event event)
        :when (eq (sdl:get-event-type event) type)
          :return t))
