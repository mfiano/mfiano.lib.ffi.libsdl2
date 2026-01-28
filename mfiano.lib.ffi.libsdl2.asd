(asdf:defsystem #:mfiano.lib.ffi.libsdl2
  :description "Low-level libSDL2 bindings and opinionated wrappers"
  :author "Michael Fiano <michael.fiano@gmail.com>"
  :license "MIT"
  :homepage "https://github.com/mfiano/mfiano.lib.ffi.libsdl2"
  :encoding :utf-8
  :depends-on
  (#:mfiano.lib.base
   #:cffi
   #:trivial-features)
  :pathname "src"
  :serial t
  :components
  ((:file "package")
   (:file "common")
   (:file "types")
   (:file "functions")
   (:file "wrappers")))
