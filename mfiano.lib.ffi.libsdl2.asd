(asdf:defsystem #:mfiano.lib.ffi.libsdl2
  :description "Low-level libSDL2 bindings and opinionated wrappers"
  :author "Michael Fiano <michael.fiano@gmail.com>"
  :license "MIT"
  :homepage "https://github.com/mfiano/mfiano.lib.ffi.libsdl2"
  :encoding :utf-8
  :depends-on
  (#:mfiano.lib.base
   #:cffi
   #:static-vectors
   #:trivial-features)
  :in-order-to ((test-op (test-op #:mfiano.lib.ffi.libsdl2/test)))
  :pathname "src"
  :serial t
  :components
  ((:file "package")
   (:file "common")
   (:file "types")
   (:file "functions")
   (:file "wrappers")))

(asdf:defsystem #:mfiano.lib.ffi.libsdl2/test
  :description "Unit tests for mfiano.lib.ffi.libsdl2"
  :author "Michael Fiano <michael.fiano@gmail.com>"
  :license "MIT"
  :homepage "https://github.com/mfiano/mfiano.lib.ffi.libsdl2"
  :encoding :utf-8
  :depends-on
  (#:1am
   #:cffi
   #:mfiano.lib.ffi.libsdl2
   #:static-vectors)
  :perform (test-op (o c) (symbol-call '#:1am '#:run))
  :pathname "test"
  :serial t
  :components
  ((:file "helpers")
   (:file "test")))
