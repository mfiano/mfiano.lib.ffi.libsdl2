(in-package #:mfiano.lib.ffi.libsdl2)

(c:defcfun ("SDL_GetError" %get-error) :string)
(c:defcfun ("SDL_ClearError" %clear-error) :void)
(c:defcfun ("SDL_free" %free) :void (pointer :pointer))

(define-sdl-function %alloc-format ()
  (:name "SDL_AllocFormat"
   :type (:pointer (:struct pixel-format))
   :check #'valid-pointer?)
  (pixel-format pixel-format-type))

(define-sdl-function %create-color-cursor ()
  (:name "SDL_CreateColorCursor"
   :type (:pointer (:struct cursor))
   :check #'valid-pointer?)
  (surface (:pointer (:struct surface)))
  (hot-x :int)
  (hot-y :int))

(define-sdl-function %create-rgb-surface-with-format ()
  (:name "SDL_CreateRGBSurfaceWithFormat"
   :type (:pointer (:struct surface))
   :check #'valid-pointer?)
  (flags :uint32)
  (width :int)
  (height :int)
  (depth :int)
  (format pixel-format-type))

(define-sdl-function %create-rgb-surface-with-format-from ()
  (:name "SDL_CreateRGBSurfaceWithFormatFrom"
   :type (:pointer (:struct surface))
   :check #'valid-pointer?)
  (pixels :pointer)
  (width :int)
  (height :int)
  (depth :int)
  (pitch :int)
  (format pixel-format-type))

(define-sdl-function %create-renderer ()
  (:name "SDL_CreateRenderer"
   :type (:pointer (:struct renderer))
   :check #'valid-pointer?)
  (window (:pointer (:struct window)))
  (index :int)
  (flags renderer-flags))

(define-sdl-function %create-texture ()
  (:name "SDL_CreateTexture"
   :type (:pointer (:struct texture))
   :check #'valid-pointer?)
  (renderer (:pointer (:struct renderer)))
  (format pixel-format-type)
  (access texture-access)
  (w :int)
  (h :int))

(define-sdl-function %create-texture-from-surface ()
  (:name "SDL_CreateTextureFromSurface"
   :type (:pointer (:struct texture))
   :check #'valid-pointer?)
  (renderer (:pointer (:struct renderer)))
  (surface (:pointer (:struct surface))))

(define-sdl-function %create-window ()
  (:name "SDL_CreateWindow"
   :type (:pointer (:struct window))
   :check #'valid-pointer?)
  (title :string)
  (x window-position)
  (y window-position)
  (width :int)
  (height :int)
  (flags window-flags))

(define-sdl-function %destroy-renderer ()
  (:name "SDL_DestroyRenderer")
  (renderer (:pointer (:struct renderer))))

(define-sdl-function %destroy-texture ()
  (:name "SDL_DestroyTexture")
  (texture (:pointer (:struct texture))))

(define-sdl-function %destroy-window ()
  (:name "SDL_DestroyWindow")
  (window (:pointer (:struct window))))

(define-sdl-function %free-cursor ()
  (:name "SDL_FreeCursor")
  (cursor (:pointer (:struct cursor))))

(define-sdl-function %free-format ()
  (:name "SDL_FreeFormat")
  (format (:pointer (:struct pixel-format))))

(define-sdl-function %free-surface ()
  (:name "SDL_FreeSurface")
  (surface (:pointer (:struct surface))))

(define-sdl-function %get-base-path ()
  (:name "SDL_GetBasePath"
   :type :pointer
   :check #'valid-pointer?))

(define-sdl-function %get-cpu-count ()
  (:name "SDL_GetCPUCount"
   :type :int))

(define-sdl-function %get-current-display-mode ()
  (:name "SDL_GetCurrentDisplayMode"
   :type :int
   :check #'zerop)
  (display-index :int)
  (mode (:pointer (:struct display-mode))))

(define-sdl-function %get-display-name ()
  (:name "SDL_GetDisplayName"
   :type :string
   :check #'stringp)
  (display-index :int))

(define-sdl-function %get-key-from-scancode ()
  (:name "SDL_GetKeyFromScancode"
   :type keycode)
  (scancode scancode))

(define-sdl-function %get-performance-counter ()
  (:name "SDL_GetPerformanceCounter"
   :type :uint64))

(define-sdl-function %get-performance-frequency ()
  (:name "SDL_GetPerformanceFrequency"
   :type :uint64))

(define-sdl-function %get-pref-path ()
  (:name "SDL_GetPrefPath"
   :type (:string :free-from-foreign t)
   :check #'stringp)
  (org :string)
  (app :string))

(define-sdl-function %get-relative-mouse-mode ()
  (:name "SDL_GetRelativeMouseMode"
   :type :boolean))

(define-sdl-function %get-render-draw-blend-mode ()
  (:name "SDL_GetRenderDrawBlendMode"
   :type :int
   :check #'zerop)
  (renderer (:pointer (:struct renderer)))
  (blend-mode (:pointer blend-mode)))

(define-sdl-function %get-render-draw-color ()
  (:name "SDL_GetRenderDrawColor"
   :type :int
   :check #'zerop)
  (renderer (:pointer (:struct renderer)))
  (r (:pointer :uint8))
  (g (:pointer :uint8))
  (b (:pointer :uint8))
  (a (:pointer :uint8)))

(define-sdl-function %get-render-target ()
  (:name "SDL_GetRenderTarget"
   :type (:pointer (:struct texture)))
  (renderer (:pointer (:struct renderer))))

(define-sdl-function %get-renderer ()
  (:name "SDL_GetRenderer"
   :type (:pointer (:struct renderer))
   :check #'valid-pointer?)
  (window (:pointer (:struct window))))

(define-sdl-function %get-renderer-info ()
  (:name "SDL_GetRendererInfo"
   :type :int
   :check #'zerop)
  (renderer (:pointer (:struct renderer)))
  (render-info (:pointer (:struct renderer-info))))

(define-sdl-function %get-renderer-output-size ()
  (:name "SDL_GetRendererOutputSize")
  (renderer (:pointer (:struct renderer)))
  (w (:pointer :int))
  (h (:pointer :int)))

(define-sdl-function %get-rgb ()
  (:name "SDL_GetRGB")
  (pixel :uint32)
  (format (:pointer (:struct pixel-format)))
  (r (:pointer :uint8))
  (g (:pointer :uint8))
  (b (:pointer :uint8)))

(define-sdl-function %get-rgba ()
  (:name "SDL_GetRGBA")
  (pixel :uint32)
  (format (:pointer (:struct pixel-format)))
  (r (:pointer :uint8))
  (g (:pointer :uint8))
  (b (:pointer :uint8))
  (a (:pointer :uint8)))

(define-sdl-function %get-scancode-from-key ()
  (:name "SDL_GetScancodeFromKey"
   :type scancode)
  (key keycode))

(define-sdl-function %get-texture-alpha-mod ()
  (:name "SDL_GetTextureAlphaMod"
   :type :int
   :check #'zerop)
  (texture (:pointer (:struct texture)))
  (alpha (:pointer :uint8)))

(define-sdl-function %get-texture-blend-mode ()
  (:name "SDL_GetTextureBlendMode"
   :type :int
   :check #'zerop)
  (texture (:pointer (:struct texture)))
  (blend-mode (:pointer blend-mode)))

(define-sdl-function %get-texture-color-mod ()
  (:name "SDL_GetTextureColorMod"
   :type :int
   :check #'zerop)
  (texture (:pointer (:struct texture)))
  (r (:pointer :uint8))
  (g (:pointer :uint8))
  (b (:pointer :uint8)))

(define-sdl-function %get-texture-scale-mode ()
  (:name "SDL_GetTextureScaleMode"
   :type :int
   :check #'zerop)
  (texture (:pointer (:struct texture)))
  (scale-mode (:pointer scale-mode)))

(define-sdl-function %get-window-display-index ()
  (:name "SDL_GetWindowDisplayIndex"
   :type :int
   :check (complement #'minusp))
  (window (:pointer (:struct window))))

(define-sdl-function %get-window-display-mode ()
  (:name "SDL_GetWindowDisplayMode"
   :type :int
   :check #'zerop)
  (window (:pointer (:struct window)))
  (mode (:pointer (:struct display-mode))))

(define-sdl-function %get-window-from-id ()
  (:name "SDL_GetWindowFromID"
   :type (:pointer (:struct window))
   :check #'valid-pointer?)
  (id :uint32))

(define-sdl-function %get-window-id ()
  (:name "SDL_GetWindowID"
   :type :uint32
   :check #'plusp)
  (window (:pointer (:struct window))))

(define-sdl-function %get-window-pixel-format ()
  (:name "SDL_GetWindowPixelFormat"
   :type :uint32
   :check #'plusp)
  (window (:pointer (:struct window))))

(define-sdl-function %get-window-position ()
  (:name "SDL_GetWindowPosition")
  (window (:pointer (:struct window)))
  (x (:pointer :int))
  (y (:pointer :int)))

(define-sdl-function %get-window-size ()
  (:name "SDL_GetWindowSize")
  (window (:pointer (:struct window)))
  (width (:pointer :int))
  (height (:pointer :int)))

(define-sdl-function %get-window-size-in-pixels ()
  (:name "SDL_GetWindowSizeInPixels")
  (window (:pointer (:struct window)))
  (width (:pointer :int))
  (height (:pointer :int)))

(define-sdl-function %get-window-title ()
  (:name "SDL_GetWindowTitle"
   :type :string
   :check #'stringp)
  (window (:pointer (:struct window))))

(define-sdl-function %gl-create-context ()
  (:name "SDL_GL_CreateContext"
   :type gl-context
   :check #'valid-pointer?)
  (window (:pointer (:struct window))))

(define-sdl-function %gl-delete-context ()
  (:name "SDL_GL_DeleteContext")
  (context gl-context))

(define-sdl-function %gl-get-attribute ()
  (:name "SDL_GL_GetAttribute"
   :type :int
   :check #'zerop)
  (attribute gl-attr)
  (value (:pointer :int)))

(define-sdl-function %gl-get-current-context ()
  (:name "SDL_GL_GetCurrentContext"
   :type gl-context
   :check #'valid-pointer?))

(define-sdl-function %gl-get-current-window ()
  (:name "SDL_GL_GetCurrentWindow"
   :type (:pointer (:struct window))
   :check #'valid-pointer?))

(define-sdl-function %gl-get-drawable-size ()
  (:name "SDL_GL_GetDrawableSize")
  (window (:pointer (:struct window)))
  (width (:pointer :int))
  (height (:pointer :int)))

(define-sdl-function %gl-get-swap-interval ()
  (:name "SDL_GL_GetSwapInterval"
   :type :int))

(define-sdl-function %gl-make-current ()
  (:name "SDL_GL_MakeCurrent"
   :type :int
   :check #'zerop)
  (window (:pointer (:struct window)))
  (context gl-context))

(define-sdl-function %gl-reset-attributes ()
  (:name "SDL_GL_ResetAttributes"))

(define-sdl-function %gl-set-attribute ()
  (:name "SDL_GL_SetAttribute"
   :type :int
   :check #'zerop)
  (attribute gl-attr)
  (value :int))

(define-sdl-function %gl-set-swap-interval ()
  (:name "SDL_GL_SetSwapInterval"
   :type :int
   :check #'zerop)
  (interval :int))

(define-sdl-function %gl-swap-window ()
  (:name "SDL_GL_SwapWindow")
  (window (:pointer (:struct window))))

(define-sdl-function %has-intersection ()
  (:name "SDL_HasIntersection"
   :type :boolean)
  (a (:pointer (:struct rect)))
  (b (:pointer (:struct rect))))

(define-sdl-function %has-intersection-f ()
  (:name "SDL_HasIntersectionF"
   :type :boolean)
  (a (:pointer (:struct frect)))
  (b (:pointer (:struct frect))))

(define-sdl-function %hide-window ()
  (:name "SDL_HideWindow")
  (window (:pointer (:struct window))))

(define-sdl-function %init ()
  (:name "SDL_Init"
   :type :int
   :check #'zerop)
  (flags init-flags))

(define-sdl-function %intersect-rect ()
  (:name "SDL_IntersectRect"
   :type :boolean)
  (a (:pointer (:struct rect)))
  (b (:pointer (:struct rect)))
  (result (:pointer (:struct rect))))

(define-sdl-function %intersect-rect-f ()
  (:name "SDL_IntersectFRect"
   :type :boolean)
  (a (:pointer (:struct frect)))
  (b (:pointer (:struct frect)))
  (result (:pointer (:struct frect))))

(define-sdl-function %lock-texture ()
  (:name "SDL_LockTexture"
   :type :int
   :check #'zerop)
  (texture (:pointer (:struct texture)))
  (rect (:pointer (:struct rect)))
  (pixels (:pointer :pointer))
  (pitch (:pointer :int)))

(define-sdl-function %map-rgb ()
  (:name "SDL_MapRGB"
   :type :uint32)
  (pixel-format (:pointer (:struct pixel-format)))
  (r :uint8)
  (g :uint8)
  (b :uint8))

(define-sdl-function %map-rgba ()
  (:name "SDL_MapRGBA"
   :type :uint32)
  (pixel-format (:pointer (:struct pixel-format)))
  (r :uint8)
  (g :uint8)
  (b :uint8)
  (a :uint8))

(define-sdl-function %maximize-window ()
  (:name "SDL_MaximizeWindow")
  (window (:pointer (:struct window))))

(define-sdl-function %minimize-window ()
  (:name "SDL_MinimizeWindow")
  (window (:pointer (:struct window))))

(define-sdl-function %poll-event ()
  (:name "SDL_PollEvent"
   :type :boolean)
  (event (:pointer (:struct event))))

(define-sdl-function %query-texture ()
  (:name "SDL_QueryTexture"
   :type :int
   :check #'zerop)
  (texture (:pointer (:struct texture)))
  (format (:pointer pixel-format-type))
  (access (:pointer :int))
  (w (:pointer :int))
  (h (:pointer :int)))

(define-sdl-function %quit ()
  (:name "SDL_Quit"))

(define-sdl-function %raise-window ()
  (:name "SDL_RaiseWindow")
  (window (:pointer (:struct window))))

(define-sdl-function %render-clear ()
  (:name "SDL_RenderClear"
   :type :int
   :check #'zerop)
  (renderer (:pointer (:struct renderer))))

(define-sdl-function %render-copy-ex ()
  (:name "SDL_RenderCopyEx"
   :type :int
   :check #'zerop)
  (renderer (:pointer (:struct renderer)))
  (texture (:pointer (:struct texture)))
  (source-rect (:pointer (:struct rect)))
  (dest-rect (:pointer (:struct rect)))
  (angle :double)
  (center (:pointer (:struct point)))
  (flip renderer-flip))

(define-sdl-function %render-copy-ex-f ()
  (:name "SDL_RenderCopyExF"
   :type :int
   :check #'zerop)
  (renderer (:pointer (:struct renderer)))
  (texture (:pointer (:struct texture)))
  (source-rect (:pointer (:struct rect)))
  (dest-rect (:pointer (:struct frect)))
  (angle :double)
  (center (:pointer (:struct fpoint)))
  (flip renderer-flip))

(define-sdl-function %render-draw-line-f ()
  (:name "SDL_RenderDrawLineF"
   :type :int
   :check #'zerop)
  (renderer (:pointer (:struct renderer)))
  (x1 :float)
  (y1 :float)
  (x2 :float)
  (y2 :float))

(define-sdl-function %render-fill-rect ()
  (:name "SDL_RenderFillRect"
   :type :int
   :check #'zerop)
  (renderer (:pointer (:struct renderer)))
  (rect (:pointer (:struct rect))))

(define-sdl-function %render-fill-rect-f ()
  (:name "SDL_RenderFillRectF"
   :type :int
   :check #'zerop)
  (renderer (:pointer (:struct renderer)))
  (rect (:pointer (:struct frect))))

(define-sdl-function %render-get-clip-rect ()
  (:name "SDL_RenderGetClipRect")
  (renderer (:pointer (:struct renderer)))
  (rect (:pointer (:struct rect))))

(define-sdl-function %render-get-scale ()
  (:name "SDL_RenderGetScale")
  (renderer (:pointer (:struct renderer)))
  (scale-x (:pointer :float))
  (scale-y (:pointer :float)))

(define-sdl-function %render-get-viewport ()
  (:name "SDL_RenderGetViewport")
  (renderer (:pointer (:struct renderer)))
  (rect (:pointer (:struct rect))))

(define-sdl-function %render-get-window ()
  (:name "SDL_RenderGetWindow"
   :type (:pointer (:struct window))
   :check #'valid-pointer?)
  (renderer (:pointer (:struct renderer))))

(define-sdl-function %render-is-clip-enabled ()
  (:name "SDL_RenderIsClipEnabled"
   :type :boolean)
  (renderer (:pointer (:struct renderer))))

(define-sdl-function %render-present ()
  (:name "SDL_RenderPresent")
  (renderer (:pointer (:struct renderer))))

(define-sdl-function %render-set-clip-rect ()
  (:name "SDL_RenderSetClipRect"
   :type :int
   :check #'zerop)
  (renderer (:pointer (:struct renderer)))
  (rect (:pointer (:struct rect))))

(define-sdl-function %render-set-scale ()
  (:name "SDL_RenderSetScale"
   :type :int
   :check #'zerop)
  (renderer (:pointer (:struct renderer)))
  (scale-x :float)
  (scale-y :float))

(define-sdl-function %render-set-viewport ()
  (:name "SDL_RenderSetViewport"
   :type :int
   :check #'zerop)
  (renderer (:pointer (:struct renderer)))
  (rect (:pointer (:struct rect))))

(define-sdl-function %restore-window ()
  (:name "SDL_RestoreWindow")
  (window (:pointer (:struct window))))

(define-sdl-function %set-cursor ()
  (:name "SDL_SetCursor")
  (cursor (:pointer (:struct cursor))))

(define-sdl-function %set-hint ()
  (:name "SDL_SetHint")
  (name :string)
  (value :string))

(define-sdl-function %set-relative-mouse-mode ()
  (:name "SDL_SetRelativeMouseMode"
   :type :int
   :check #'zerop)
  (enabled :boolean))

(define-sdl-function %set-render-draw-blend-mode ()
  (:name "SDL_SetRenderDrawBlendMode"
   :type :int
   :check #'zerop)
  (renderer (:pointer (:struct renderer)))
  (blend-mode blend-mode))

(define-sdl-function %set-render-draw-color ()
  (:name "SDL_SetRenderDrawColor"
   :type :int
   :check #'zerop)
  (renderer (:pointer (:struct renderer)))
  (r :uint8)
  (g :uint8)
  (b :uint8)
  (a :uint8))

(define-sdl-function %set-render-target ()
  (:name "SDL_SetRenderTarget"
   :type :int
   :check #'zerop)
  (renderer (:pointer (:struct renderer)))
  (texture (:pointer (:struct texture))))

(define-sdl-function %set-texture-alpha-mod ()
  (:name "SDL_SetTextureAlphaMod"
   :type :int
   :check #'zerop)
  (texture (:pointer (:struct texture)))
  (alpha :uint8))

(define-sdl-function %set-texture-blend-mode ()
  (:name "SDL_SetTextureBlendMode"
   :type :int
   :check #'zerop)
  (texture (:pointer (:struct texture)))
  (blend-mode blend-mode))

(define-sdl-function %set-texture-color-mod ()
  (:name "SDL_SetTextureColorMod"
   :type :int
   :check #'zerop)
  (texture (:pointer (:struct texture)))
  (r :uint8)
  (g :uint8)
  (b :uint8))

(define-sdl-function %set-texture-scale-mode ()
  (:name "SDL_SetTextureScaleMode"
   :type :int
   :check #'zerop)
  (texture (:pointer (:struct texture)))
  (scale-mode scale-mode))

(define-sdl-function %set-window-always-on-top ()
  (:name "SDL_SetWindowAlwaysOnTop")
  (window (:pointer (:struct window)))
  (on-top :boolean))

(define-sdl-function %set-window-fullscreen ()
  (:name "SDL_SetWindowFullscreen"
   :type :int
   :check #'zerop)
  (window (:pointer (:struct window)))
  (flags window-fullscreen-flags))

(define-sdl-function %set-window-keyboard-grab ()
  (:name "SDL_SetWindowKeyboardGrab")
  (window (:pointer (:struct window)))
  (grabbed :boolean))

(define-sdl-function %set-window-maximum-size ()
  (:name "SDL_SetWindowMaximumSize")
  (window (:pointer (:struct window)))
  (width :int)
  (height :int))

(define-sdl-function %set-window-minimum-size ()
  (:name "SDL_SetWindowMinimumSize")
  (window (:pointer (:struct window)))
  (width :int)
  (height :int))

(define-sdl-function %set-window-position ()
  (:name "SDL_SetWindowPosition")
  (window (:pointer (:struct window)))
  (x :int)
  (y :int))

(define-sdl-function %set-window-resizable ()
  (:name "SDL_SetWindowResizable")
  (window (:pointer (:struct window)))
  (resizable :boolean))

(define-sdl-function %set-window-size ()
  (:name "SDL_SetWindowSize")
  (window (:pointer (:struct window)))
  (width :int)
  (height :int))

(define-sdl-function %set-window-title ()
  (:name "SDL_SetWindowTitle")
  (window (:pointer (:struct window)))
  (title :string))

(define-sdl-function %show-cursor ()
  (:name "SDL_ShowCursor"
   :type :int
   :check (complement #'minusp))
  (toggle :int))

(define-sdl-function %show-window ()
  (:name "SDL_ShowWindow")
  (window (:pointer (:struct window))))

(define-sdl-function %unlock-texture ()
  (:name "SDL_UnlockTexture")
  (texture (:pointer (:struct texture))))

(define-sdl-function %update-texture ()
  (:name "SDL_UpdateTexture")
  (texture (:pointer (:struct texture)))
  (rect (:pointer (:struct rect)))
  (pixels :pointer)
  (pitch :int))

(define-sdl-function %warp-mouse-in-window ()
  (:name "SDL_WarpMouseInWindow")
  (window (:pointer (:struct window)))
  (x :int)
  (y :int))

(define-sdl-function %was-init ()
  (:name "SDL_WasInit"
   :type init-flags)
  (flags init-flags))
