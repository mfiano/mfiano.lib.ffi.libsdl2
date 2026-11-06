(in-package #:mfiano.lib.ffi.libsdl2)

;;; scancode

(c:defcenum scancode
  (:unknown 0)
  (:a 4)
  (:b 5)
  (:c 6)
  (:d 7)
  (:e 8)
  (:f 9)
  (:g 10)
  (:h 11)
  (:i 12)
  (:j 13)
  (:k 14)
  (:l 15)
  (:m 16)
  (:n 17)
  (:o 18)
  (:p 19)
  (:q 20)
  (:r 21)
  (:s 22)
  (:t 23)
  (:u 24)
  (:v 25)
  (:w 26)
  (:x 27)
  (:y 28)
  (:z 29)
  (:1 30)
  (:2 31)
  (:3 32)
  (:4 33)
  (:5 34)
  (:6 35)
  (:7 36)
  (:8 37)
  (:9 38)
  (:0 39)
  (:return 40)
  (:escape 41)
  (:backspace 42)
  (:tab 43)
  (:space 44)
  (:minus 45)
  (:equals 46)
  (:leftbracket 47)
  (:rightbracket 48)
  (:backslash 49)
  (:nonushash 50)
  (:semicolon 51)
  (:apostrophe 52)
  (:grave 53)
  (:comma 54)
  (:period 55)
  (:slash 56)
  (:capslock 57)
  (:f1 58)
  (:f2 59)
  (:f3 60)
  (:f4 61)
  (:f5 62)
  (:f6 63)
  (:f7 64)
  (:f8 65)
  (:f9 66)
  (:f10 67)
  (:f11 68)
  (:f12 69)
  (:printscreen 70)
  (:scrolllock 71)
  (:pause 72)
  (:insert 73)
  (:home 74)
  (:pageup 75)
  (:delete 76)
  (:end 77)
  (:pagedown 78)
  (:right 79)
  (:left 80)
  (:down 81)
  (:up 82)
  (:numlockclear 83)
  (:kp-divide 84)
  (:kp-multiply 85)
  (:kp-minus 86)
  (:kp-plus 87)
  (:kp-enter 88)
  (:kp-1 89)
  (:kp-2 90)
  (:kp-3 91)
  (:kp-4 92)
  (:kp-5 93)
  (:kp-6 94)
  (:kp-7 95)
  (:kp-8 96)
  (:kp-9 97)
  (:kp-0 98)
  (:kp-period 99)
  (:nonusbackslash 100)
  (:application 101)
  (:power 102)
  (:kp-equals 103)
  (:f13 104)
  (:f14 105)
  (:f15 106)
  (:f16 107)
  (:f17 108)
  (:f18 109)
  (:f19 110)
  (:f20 111)
  (:f21 112)
  (:f22 113)
  (:f23 114)
  (:f24 115)
  (:execute 116)
  (:help 117)
  (:menu 118)
  (:select 119)
  (:stop 120)
  (:again 121)
  (:undo 122)
  (:cut 123)
  (:copy 124)
  (:paste 125)
  (:find 126)
  (:mute 127)
  (:volumeup 128)
  (:volumedown 129)
  (:kp-comma 133)
  (:kp-equalsas400 134)
  (:international1 135)
  (:international2 136)
  (:international3 137)
  (:international4 138)
  (:international5 139)
  (:international6 140)
  (:international7 141)
  (:international8 142)
  (:international9 143)
  (:lang1 144)
  (:lang2 145)
  (:lang3 146)
  (:lang4 147)
  (:lang5 148)
  (:lang6 149)
  (:lang7 150)
  (:lang8 151)
  (:lang9 152)
  (:alterase 153)
  (:sysreq 154)
  (:cancel 155)
  (:clear 156)
  (:prior 157)
  (:return2 158)
  (:separator 159)
  (:out 160)
  (:oper 161)
  (:clearagain 162)
  (:crsel 163)
  (:exsel 164)
  (:kp-00 176)
  (:kp-000 177)
  (:thousandsseparator 178)
  (:decimalseparator 179)
  (:currencyunit 180)
  (:currencysubunit 181)
  (:kp-leftparen 182)
  (:kp-rightparen 183)
  (:kp-leftbrace 184)
  (:kp-rightbrace 185)
  (:kp-tab 186)
  (:kp-backspace 187)
  (:kp-a 188)
  (:kp-b 189)
  (:kp-c 190)
  (:kp-d 191)
  (:kp-e 192)
  (:kp-f 193)
  (:kp-xor 194)
  (:kp-power 195)
  (:kp-percent 196)
  (:kp-less 197)
  (:kp-greater 198)
  (:kp-ampersand 199)
  (:kp-dblampersand 200)
  (:kp-verticalbar 201)
  (:kp-dblverticalbar 202)
  (:kp-colon 203)
  (:kp-hash 204)
  (:kp-space 205)
  (:kp-at 206)
  (:kp-exclam 207)
  (:kp-memstore 208)
  (:kp-memrecall 209)
  (:kp-memclear 210)
  (:kp-memadd 211)
  (:kp-memsubtract 212)
  (:kp-memmultiply 213)
  (:kp-memdivide 214)
  (:kp-plusminus 215)
  (:kp-clear 216)
  (:kp-clearentry 217)
  (:kp-binary 218)
  (:kp-octal 219)
  (:kp-decimal 220)
  (:kp-hexadecimal 221)
  (:lctrl 224)
  (:lshift 225)
  (:lalt 226)
  (:lgui 227)
  (:rctrl 228)
  (:rshift 229)
  (:ralt 230)
  (:rgui 231)
  (:mode 257)
  (:audionext 258)
  (:audioprev 259)
  (:audiostop 260)
  (:audioplay 261)
  (:audiomute 262)
  (:mediaselect 263)
  (:www 264)
  (:mail 265)
  (:calculator 266)
  (:computer 267)
  (:ac-search 268)
  (:ac-home 269)
  (:ac-back 270)
  (:ac-forward 271)
  (:ac-stop 272)
  (:ac-refresh 273)
  (:ac-bookmarks 274)
  (:brightnessdown 275)
  (:brightnessup 276)
  (:displayswitch 277)
  (:kbdillumtoggle 278)
  (:kbdillumdown 279)
  (:kbdillumup 280)
  (:eject 281)
  (:sleep 282)
  (:app1 283)
  (:app2 284)
  (:audiorewind 285)
  (:audiofastforward 286)
  (:softleft 287)
  (:softright 288)
  (:call 289)
  (:endcall 290))

;;; keycode

(c:defcenum keycode
  (:unknown 0)
  (:return #.(char-code #\return))
  (:escape #.(char-code #\escape))
  (:backspace #.(char-code #\backspace))
  (:tab #.(char-code #\tab))
  (:space #.(char-code #\space))
  (:exclaim #.(char-code #\!))
  (:quotedbl #.(char-code #\"))
  (:hash #.(char-code #\#))
  (:percent #.(char-code #\%))
  (:dollar #.(char-code #\$))
  (:ampersand #.(char-code #\&))
  (:quote #.(char-code #\'))
  (:leftparen #.(char-code #\())
  (:rightparen #.(char-code #\)))
  (:asterisk #.(char-code #\*))
  (:plus #.(char-code #\+))
  (:comma #.(char-code #\,))
  (:minus #.(char-code #\-))
  (:period #.(char-code #\.))
  (:slash #.(char-code #\/))
  (:0 #.(char-code #\0))
  (:1 #.(char-code #\1))
  (:2 #.(char-code #\2))
  (:3 #.(char-code #\3))
  (:4 #.(char-code #\4))
  (:5 #.(char-code #\5))
  (:6 #.(char-code #\6))
  (:7 #.(char-code #\7))
  (:8 #.(char-code #\8))
  (:9 #.(char-code #\9))
  (:colon #.(char-code #\:))
  (:semicolon #.(char-code #\;))
  (:less #.(char-code #\<))
  (:equals #.(char-code #\=))
  (:greater #.(char-code #\>))
  (:question #.(char-code #\?))
  (:at #.(char-code #\@))
  (:leftbracket #.(char-code #\[))
  (:backslash #.(char-code #\\))
  (:rightbracket #.(char-code #\]))
  (:caret #.(char-code #\^))
  (:underscore #.(char-code #\_))
  (:backquote #.(char-code #\`))
  (:a #.(char-code #\a))
  (:b #.(char-code #\b))
  (:c #.(char-code #\c))
  (:d #.(char-code #\d))
  (:e #.(char-code #\e))
  (:f #.(char-code #\f))
  (:g #.(char-code #\g))
  (:h #.(char-code #\h))
  (:i #.(char-code #\i))
  (:j #.(char-code #\j))
  (:k #.(char-code #\k))
  (:l #.(char-code #\l))
  (:m #.(char-code #\m))
  (:n #.(char-code #\n))
  (:o #.(char-code #\o))
  (:p #.(char-code #\p))
  (:q #.(char-code #\q))
  (:r #.(char-code #\r))
  (:s #.(char-code #\s))
  (:t #.(char-code #\t))
  (:u #.(char-code #\u))
  (:v #.(char-code #\v))
  (:w #.(char-code #\w))
  (:x #.(char-code #\x))
  (:y #.(char-code #\y))
  (:z #.(char-code #\z))
  (:capslock #.(scancode->keycode :capslock))
  (:f1 #.(scancode->keycode :f1))
  (:f2 #.(scancode->keycode :f2))
  (:f3 #.(scancode->keycode :f3))
  (:f4 #.(scancode->keycode :f4))
  (:f5 #.(scancode->keycode :f5))
  (:f6 #.(scancode->keycode :f6))
  (:f7 #.(scancode->keycode :f7))
  (:f8 #.(scancode->keycode :f8))
  (:f9 #.(scancode->keycode :f9))
  (:f10 #.(scancode->keycode :f10))
  (:f11 #.(scancode->keycode :f11))
  (:f12 #.(scancode->keycode :f12))
  (:printscreen #.(scancode->keycode :printscreen))
  (:scrolllock #.(scancode->keycode :scrolllock))
  (:pause #.(scancode->keycode :pause))
  (:insert #.(scancode->keycode :insert))
  (:home #.(scancode->keycode :home))
  (:pageup #.(scancode->keycode :pageup))
  (:delete #.(char-code #\delete))
  (:end #.(scancode->keycode :end))
  (:pagedown #.(scancode->keycode :pagedown))
  (:right #.(scancode->keycode :right))
  (:left #.(scancode->keycode :left))
  (:down #.(scancode->keycode :down))
  (:up #.(scancode->keycode :up))
  (:numlockclear #.(scancode->keycode :numlockclear))
  (:kp-divide #.(scancode->keycode :kp-divide))
  (:kp-multiply #.(scancode->keycode :kp-multiply))
  (:kp-minus #.(scancode->keycode :kp-minus))
  (:kp-plus #.(scancode->keycode :kp-plus))
  (:kp-enter #.(scancode->keycode :kp-enter))
  (:kp-1 #.(scancode->keycode :kp-1))
  (:kp-2 #.(scancode->keycode :kp-2))
  (:kp-3 #.(scancode->keycode :kp-3))
  (:kp-4 #.(scancode->keycode :kp-4))
  (:kp-5 #.(scancode->keycode :kp-5))
  (:kp-6 #.(scancode->keycode :kp-6))
  (:kp-7 #.(scancode->keycode :kp-7))
  (:kp-8 #.(scancode->keycode :kp-8))
  (:kp-9 #.(scancode->keycode :kp-9))
  (:kp-0 #.(scancode->keycode :kp-0))
  (:kp-period #.(scancode->keycode :kp-period))
  (:application #.(scancode->keycode :application))
  (:power #.(scancode->keycode :power))
  (:kp-equals #.(scancode->keycode :kp-equals))
  (:f13 #.(scancode->keycode :f13))
  (:f14 #.(scancode->keycode :f14))
  (:f15 #.(scancode->keycode :f15))
  (:f16 #.(scancode->keycode :f16))
  (:f17 #.(scancode->keycode :f17))
  (:f18 #.(scancode->keycode :f18))
  (:f19 #.(scancode->keycode :f19))
  (:f20 #.(scancode->keycode :f20))
  (:f21 #.(scancode->keycode :f21))
  (:f22 #.(scancode->keycode :f22))
  (:f23 #.(scancode->keycode :f23))
  (:f24 #.(scancode->keycode :f24))
  (:execute #.(scancode->keycode :execute))
  (:help #.(scancode->keycode :help))
  (:menu #.(scancode->keycode :menu))
  (:select #.(scancode->keycode :select))
  (:stop #.(scancode->keycode :stop))
  (:again #.(scancode->keycode :again))
  (:undo #.(scancode->keycode :undo))
  (:cut #.(scancode->keycode :cut))
  (:copy #.(scancode->keycode :copy))
  (:paste #.(scancode->keycode :paste))
  (:find #.(scancode->keycode :find))
  (:mute #.(scancode->keycode :mute))
  (:volumeup #.(scancode->keycode :volumeup))
  (:volumedown #.(scancode->keycode :volumedown))
  (:kp-comma #.(scancode->keycode :kp-comma))
  (:kp-equalsas400 #.(scancode->keycode :kp-equalsas400))
  (:alterase #.(scancode->keycode :alterase))
  (:sysreq #.(scancode->keycode :sysreq))
  (:cancel #.(scancode->keycode :cancel))
  (:clear #.(scancode->keycode :clear))
  (:prior #.(scancode->keycode :prior))
  (:return2 #.(scancode->keycode :return2))
  (:separator #.(scancode->keycode :separator))
  (:out #.(scancode->keycode :out))
  (:oper #.(scancode->keycode :oper))
  (:clearagain #.(scancode->keycode :clearagain))
  (:crsel #.(scancode->keycode :crsel))
  (:exsel #.(scancode->keycode :exsel))
  (:kp-00 #.(scancode->keycode :kp-00))
  (:kp-000 #.(scancode->keycode :kp-000))
  (:thousandsseparator #.(scancode->keycode :thousandsseparator))
  (:decimalseparator #.(scancode->keycode :decimalseparator))
  (:currencyunit #.(scancode->keycode :currencyunit))
  (:currencysubunit #.(scancode->keycode :currencysubunit))
  (:kp-leftparen #.(scancode->keycode :kp-leftparen))
  (:kp-rightparen #.(scancode->keycode :kp-rightparen))
  (:kp-leftbrace #.(scancode->keycode :kp-leftbrace))
  (:kp-rightbrace #.(scancode->keycode :kp-rightbrace))
  (:kp-tab #.(scancode->keycode :kp-tab))
  (:kp-backspace #.(scancode->keycode :kp-backspace))
  (:kp-a #.(scancode->keycode :kp-a))
  (:kp-b #.(scancode->keycode :kp-b))
  (:kp-c #.(scancode->keycode :kp-c))
  (:kp-d #.(scancode->keycode :kp-d))
  (:kp-e #.(scancode->keycode :kp-e))
  (:kp-f #.(scancode->keycode :kp-f))
  (:kp-xor #.(scancode->keycode :kp-xor))
  (:kp-power #.(scancode->keycode :kp-power))
  (:kp-percent #.(scancode->keycode :kp-percent))
  (:kp-less #.(scancode->keycode :kp-less))
  (:kp-greater #.(scancode->keycode :kp-greater))
  (:kp-ampersand #.(scancode->keycode :kp-ampersand))
  (:kp-dblampersand #.(scancode->keycode :kp-dblampersand))
  (:kp-verticalbar #.(scancode->keycode :kp-verticalbar))
  (:kp-dblverticalbar #.(scancode->keycode :kp-dblverticalbar))
  (:kp-colon #.(scancode->keycode :kp-colon))
  (:kp-hash #.(scancode->keycode :kp-hash))
  (:kp-space #.(scancode->keycode :kp-space))
  (:kp-at #.(scancode->keycode :kp-at))
  (:kp-exclam #.(scancode->keycode :kp-exclam))
  (:kp-memstore #.(scancode->keycode :kp-memstore))
  (:kp-memrecall #.(scancode->keycode :kp-memrecall))
  (:kp-memclear #.(scancode->keycode :kp-memclear))
  (:kp-memadd #.(scancode->keycode :kp-memadd))
  (:kp-memsubtract #.(scancode->keycode :kp-memsubtract))
  (:kp-memmultiply #.(scancode->keycode :kp-memmultiply))
  (:kp-memdivide #.(scancode->keycode :kp-memdivide))
  (:kp-plusminus #.(scancode->keycode :kp-plusminus))
  (:kp-clear #.(scancode->keycode :kp-clear))
  (:kp-clearentry #.(scancode->keycode :kp-clearentry))
  (:kp-binary #.(scancode->keycode :kp-binary))
  (:kp-octal #.(scancode->keycode :kp-octal))
  (:kp-decimal #.(scancode->keycode :kp-decimal))
  (:kp-hexadecimal #.(scancode->keycode :kp-hexadecimal))
  (:lctrl #.(scancode->keycode :lctrl))
  (:lshift #.(scancode->keycode :lshift))
  (:lalt #.(scancode->keycode :lalt))
  (:lgui #.(scancode->keycode :lgui))
  (:rctrl #.(scancode->keycode :rctrl))
  (:rshift #.(scancode->keycode :rshift))
  (:ralt #.(scancode->keycode :ralt))
  (:rgui #.(scancode->keycode :rgui))
  (:mode #.(scancode->keycode :mode))
  (:audionext #.(scancode->keycode :audionext))
  (:audioprev #.(scancode->keycode :audioprev))
  (:audiostop #.(scancode->keycode :audiostop))
  (:audioplay #.(scancode->keycode :audioplay))
  (:audiomute #.(scancode->keycode :audiomute))
  (:mediaselect #.(scancode->keycode :mediaselect))
  (:www #.(scancode->keycode :www))
  (:mail #.(scancode->keycode :mail))
  (:calculator #.(scancode->keycode :calculator))
  (:computer #.(scancode->keycode :computer))
  (:ac-search #.(scancode->keycode :ac-search))
  (:ac-home #.(scancode->keycode :ac-home))
  (:ac-back #.(scancode->keycode :ac-back))
  (:ac-forward #.(scancode->keycode :ac-forward))
  (:ac-stop #.(scancode->keycode :ac-stop))
  (:ac-refresh #.(scancode->keycode :ac-refresh))
  (:ac-bookmarks #.(scancode->keycode :ac-bookmarks))
  (:brightnessdown #.(scancode->keycode :brightnessdown))
  (:brightnessup #.(scancode->keycode :brightnessup))
  (:kbdillumtoggle #.(scancode->keycode :kbdillumtoggle))
  (:kbdillumdown #.(scancode->keycode :kbdillumdown))
  (:kbdillumup #.(scancode->keycode :kbdillumup))
  (:eject #.(scancode->keycode :eject))
  (:sleep #.(scancode->keycode :sleep))
  (:app1 #.(scancode->keycode :app1))
  (:app2 #.(scancode->keycode :app2))
  (:audiorewind #.(scancode->keycode :audiorewind))
  (:audiofastforward #.(scancode->keycode :audiofastforward))
  (:softleft #.(scancode->keycode :softleft))
  (:softright #.(scancode->keycode :softright))
  (:call #.(scancode->keycode :call))
  (:endcall #.(scancode->keycode :endcall)))

(c:defbitfield (keymod :uint16)
  (:none #x0000)
  (:lshift #x0001)
  (:rshift #x0002)
  (:lctrl #x0040)
  (:rctrl #x0080)
  (:lalt #x0100)
  (:ralt #x0200)
  (:lgui #x0400)
  (:rgui #x0800)
  (:num #x1000)
  (:caps #x2000)
  (:mode #x4000)
  (:scroll #x8000))

;;; keyboard

(c:defcstruct keysym
  (scancode scancode)
  (sym keycode)
  (mod keymod)
  (unused :uint32))

;;; joystick

(c:defctype joystick-id :int32)

;;; rect

(c:defcstruct point
  (x :int)
  (y :int))

(c:defcstruct fpoint
  (x :float)
  (y :float))

(c:defcstruct rect
  (x :int)
  (y :int)
  (width :int)
  (height :int))

(c:defcstruct frect
  (x :float)
  (y :float)
  (width :float)
  (height :float))

;;; blendmode

(c:defcenum (blend-mode :uint32)
  (:none #x00000000)
  (:blend #x00000001)
  (:add #x00000002)
  (:mod #x00000004)
  (:invalid #x7fffffff))

;;; pixels

(c:defcenum pixel-type
  :unknown
  :index1
  :index4
  :index8
  :packed8
  :packed16
  :packed32
  :arrayu8
  :arrayu16
  :arrayu32
  :arrayf16
  :arrayf32)

(c:defcenum bitmap-order
  :none
  :4321
  :1234)

(c:defcenum packed-order
  :none
  :xrgb
  :rgbx
  :argb
  :rgba
  :xbgr
  :bgrx
  :abgr
  :bgra)

(c:defcenum array-order
  :none
  :rgb
  :rgba
  :argb
  :bgr
  :bgra
  :abgr)

(c:defcenum packed-layout
  :none
  :332
  :4444
  :1555
  :5551
  :565
  :8888
  :2101010
  :1010102)

(c:defcenum (pixel-format-type :uint32)
  :unknown
  (:index1lsb #.(encode-pixel-format :index1 '(:4321 bitmap-order) 0 1 0))
  (:index1msb #.(encode-pixel-format :index1 '(:1234 bitmap-order) 0 1 0))
  (:index4lsb #.(encode-pixel-format :index4 '(:4321 bitmap-order) 0 4 0))
  (:index4msb #.(encode-pixel-format :index4 '(:1234 bitmap-order) 0 4 0))
  (:index8 #.(encode-pixel-format :index8 0 0 8 1))
  (:rgb332 #.(encode-pixel-format :packed8 '(:xrgb packed-order) '(:332 packed-layout) 8 1))
  (:xrgb4444 #.(encode-pixel-format :packed16 '(:xrgb packed-order) '(:4444 packed-layout) 12 2))
  (:rgb444 #.(encode-pixel-format :packed16 '(:xrgb packed-order) '(:4444 packed-layout) 12 2))
  (:xbgr4444 #.(encode-pixel-format :packed16 '(:xbgr packed-order) '(:4444 packed-layout) 12 2))
  (:bgr444 #.(encode-pixel-format :packed16 '(:xbgr packed-order) '(:4444 packed-layout) 12 2))
  (:xrgb1555 #.(encode-pixel-format :packed16 '(:xrgb packed-order) '(:1555 packed-layout) 15 2))
  (:rgb555 #.(encode-pixel-format :packed16 '(:xrgb packed-order) '(:1555 packed-layout) 15 2))
  (:xbgr1555 #.(encode-pixel-format :packed16 '(:xbgr packed-order) '(:1555 packed-layout) 15 2))
  (:bgr555 #.(encode-pixel-format :packed16 '(:xbgr packed-order) '(:1555 packed-layout) 15 2))
  (:argb4444 #.(encode-pixel-format :packed16 '(:argb packed-order) '(:4444 packed-layout) 16 2))
  (:rgba4444 #.(encode-pixel-format :packed16 '(:rgba packed-order) '(:4444 packed-layout) 16 2))
  (:abgr4444 #.(encode-pixel-format :packed16 '(:abgr packed-order) '(:4444 packed-layout) 16 2))
  (:bgra4444 #.(encode-pixel-format :packed16 '(:bgra packed-order) '(:4444 packed-layout) 16 2))
  (:argb1555 #.(encode-pixel-format :packed16 '(:argb packed-order) '(:1555 packed-layout) 16 2))
  (:rgba5551 #.(encode-pixel-format :packed16 '(:rgba packed-order) '(:5551 packed-layout) 16 2))
  (:abgr1555 #.(encode-pixel-format :packed16 '(:abgr packed-order) '(:1555 packed-layout) 16 2))
  (:bgra5551 #.(encode-pixel-format :packed16 '(:bgra packed-order) '(:5551 packed-layout) 16 2))
  (:rgb565 #.(encode-pixel-format :packed16 '(:xrgb packed-order) '(:565 packed-layout) 16 2))
  (:bgr565 #.(encode-pixel-format :packed16 '(:xbgr packed-order) '(:565 packed-layout) 16 2))
  (:rgb24 #.(encode-pixel-format :arrayu8 '(:rgb array-order) 0 24 3))
  (:bgr24 #.(encode-pixel-format :arrayu8 '(:bgr array-order) 0 24 3))
  (:rgb48 #.(encode-pixel-format :arrayu16 '(:rgb array-order) 0 48 6))
  (:bgr48 #.(encode-pixel-format :arrayu16 '(:bgr array-order) 0 48 6))
  (:rgb48-float #.(encode-pixel-format :arrayf16 '(:rgb array-order) 0 48 6))
  (:bgr48-float #.(encode-pixel-format :arrayf16 '(:bgr array-order) 0 48 6))
  (:xrgb8888 #.(encode-pixel-format :packed32 '(:xrgb packed-order) '(:8888 packed-layout) 24 4))
  (:rgb888 #.(encode-pixel-format :packed32 '(:xrgb packed-order) '(:8888 packed-layout) 24 4))
  (:rgbx8888 #.(encode-pixel-format :packed32 '(:rgbx packed-order) '(:8888 packed-layout) 24 4))
  (:xbgr8888 #.(encode-pixel-format :packed32 '(:xbgr packed-order) '(:8888 packed-layout) 24 4))
  (:bgr888 #.(encode-pixel-format :packed32 '(:xbgr packed-order) '(:8888 packed-layout) 24 4))
  (:bgrx8888 #.(encode-pixel-format :packed32 '(:bgrx packed-order) '(:8888 packed-layout) 24 4))
  (:argb8888 #.(encode-pixel-format :packed32 '(:argb packed-order) '(:8888 packed-layout) 32 4))
  (:rgba8888 #.(encode-pixel-format :packed32 '(:rgba packed-order) '(:8888 packed-layout) 32 4))
  (:abgr8888 #.(encode-pixel-format :packed32 '(:abgr packed-order) '(:8888 packed-layout) 32 4))
  (:bgra8888 #.(encode-pixel-format :packed32 '(:bgra packed-order) '(:8888 packed-layout) 32 4))
  (:xrgb2101010
   #.(encode-pixel-format :packed32 '(:xrgb packed-order) '(:2101010 packed-layout) 32 4))
  (:argb2101010
   #.(encode-pixel-format :packed32 '(:argb packed-order) '(:2101010 packed-layout) 32 4))
  (:xbgr2101010
   #.(encode-pixel-format :packed32 '(:xbgr packed-order) '(:2101010 packed-layout) 32 4))
  (:abgr2101010
   #.(encode-pixel-format :packed32 '(:abgr packed-order) '(:2101010 packed-layout) 32 4))
  (:rgba32
   #+little-endian
   #.(encode-pixel-format :packed32 '(:abgr packed-order) '(:8888 packed-layout) 32 4)
   #+big-endian
   #.(encode-pixel-format :packed32 '(:rgba packed-order) '(:8888 packed-layout) 32 4))
  (:argb32
   #+little-endian
   #.(encode-pixel-format :packed32 '(:bgra packed-order) '(:8888 packed-layout) 32 4)
   #+big-endian
   #.(encode-pixel-format :packed32 '(:argb packed-order) '(:8888 packed-layout) 32 4))
  (:bgra32
   #+little-endian
   #.(encode-pixel-format :packed32 '(:argb packed-order) '(:8888 packed-layout) 32 4)
   #+big-endian
   #.(encode-pixel-format :packed32 '(:bgra packed-order) '(:8888 packed-layout) 32 4))
  (:abgr32
   #+little-endian
   #.(encode-pixel-format :packed32 '(:rgba packed-order) '(:8888 packed-layout) 32 4)
   #+big-endian
   #.(encode-pixel-format :packed32 '(:abgr packed-order) '(:8888 packed-layout) 32 4))
  (:rgbx32
   #+little-endian
   #.(encode-pixel-format :packed32 '(:xbgr packed-order) '(:8888 packed-layout) 24 4)
   #+big-endian
   #.(encode-pixel-format :packed32 '(:rgbx packed-order) '(:8888 packed-layout) 24 4))
  (:xrgb32
   #+little-endian
   #.(encode-pixel-format :packed32 '(:bgrx packed-order) '(:8888 packed-layout) 24 4)
   #+big-endian
   #.(encode-pixel-format :packed32 '(:xrgb packed-order) '(:8888 packed-layout) 24 4))
  (:bgrx32
   #+little-endian
   #.(encode-pixel-format :packed32 '(:xrgb packed-order) '(:8888 packed-layout) 24 4)
   #+big-endian
   #.(encode-pixel-format :packed32 '(:bgrx packed-order) '(:8888 packed-layout) 24 4))
  (:xbgr32
   #+little-endian
   #.(encode-pixel-format :packed32 '(:rgbx packed-order) '(:8888 packed-layout) 24 4)
   #+big-endian
   #.(encode-pixel-format :packed32 '(:xbgr packed-order) '(:8888 packed-layout) 24 4))
  (:rgba64 #.(encode-pixel-format :arrayu16 '(:rgba array-order) 0 64 8))
  (:argb64 #.(encode-pixel-format :arrayu16 '(:argb array-order) 0 64 8))
  (:bgra64 #.(encode-pixel-format :arrayu16 '(:bgra array-order) 0 64 8))
  (:abgr64 #.(encode-pixel-format :arrayu16 '(:abgr array-order) 0 64 8))
  (:rgba64-float #.(encode-pixel-format :arrayf16 '(:rgba array-order) 0 64 8))
  (:argb64-float #.(encode-pixel-format :arrayf16 '(:argb array-order) 0 64 8))
  (:bgra64-float #.(encode-pixel-format :arrayf16 '(:bgra array-order) 0 64 8))
  (:abgr64-float #.(encode-pixel-format :arrayf16 '(:abgr array-order) 0 64 8))
  (:rgb96-float #.(encode-pixel-format :arrayf32 '(:rgb array-order) 0 96 12))
  (:bgr96-float #.(encode-pixel-format :arrayf32 '(:bgr array-order) 0 96 12))
  (:rgba128-float #.(encode-pixel-format :arrayf32 '(:rgba array-order) 0 128 16))
  (:argb128-float #.(encode-pixel-format :arrayf32 '(:argb array-order) 0 128 16))
  (:bgra128-float #.(encode-pixel-format :arrayf32 '(:bgra array-order) 0 128 16))
  (:abgr128-float #.(encode-pixel-format :arrayf32 '(:abgr array-order) 0 128 16))
  (:yv12 #.(encode-fourcc "YV12"))
  (:iyuv #.(encode-fourcc "IYUV"))
  (:yuy2 #.(encode-fourcc "YUY2"))
  (:uyvy #.(encode-fourcc "UYVY"))
  (:yvyu #.(encode-fourcc "YVYU"))
  (:nv12 #.(encode-fourcc "NV12"))
  (:nv21 #.(encode-fourcc "NV21"))
  (:p010 #.(encode-fourcc "P010"))
  (:mjpg #.(encode-fourcc "MJPG"))
  (:external-oes #.(encode-fourcc "OES ")))

(c:defcstruct color
  (r :uint8)
  (g :uint8)
  (b :uint8)
  (a :uint8))

(c:defcstruct palette
  (color-count :int)
  (colors (:pointer (:struct color)))
  (version :uint32)
  (ref-count :int))

(c:defcstruct pixel-format
  (type pixel-format-type)
  (palette (:pointer (:struct palette)))
  (bits-per-pixel :uint8)
  (bytes-per-pixel :uint8)
  (padding :uint8 :count 2)
  (red-mask :uint32)
  (green-mask :uint32)
  (blue-mask :uint32)
  (alpha-mask :uint32)
  (red-loss :uint8)
  (green-loss :uint8)
  (blue-loss :uint8)
  (alpha-loss :uint8)
  (red-shift :uint8)
  (green-shift :uint8)
  (blue-shift :uint8)
  (alpha-shift :uint8)
  (ref-count :int)
  (next (:pointer (:struct pixel-format))))

;;; surface

(c:defcstruct blit-map)

(c:defcstruct surface
  (flags :uint32)
  (format (:pointer (:struct pixel-format)))
  (w :int)
  (h :int)
  (pitch :int)
  (pixels :pointer)
  (user-data :pointer)
  (locked :int)
  (list-blitmap :pointer)
  (clip-rect (:struct rect))
  (map (:pointer (:struct blit-map)))
  (ref-count :int))

;;; cursor

(c:defcstruct cursor)

;;; video

(c:defcstruct display-mode
  (format pixel-format-type)
  (width :int)
  (height :int)
  (refresh-rate :int)
  (driver-data :pointer))

(c:defcstruct window)

(c:defbitfield (window-flags :uint32)
  (:fullscreen #x00000001)
  (:opengl #x00000002)
  (:shown #x00000004)
  (:hidden #x00000008)
  (:borderless #x00000010)
  (:resizable #x00000020)
  (:minimized #x00000040)
  (:maximized #x00000080)
  (:input-grabbed #x00000100)
  (:mouse-grabbed #x00000100)
  (:input-focus #x00000200)
  (:mouse-focus #x00000400)
  (:foreign #x00000800)
  (:fullscreen-desktop #x00001001)
  (:allow-highdpi #x00002000)
  (:mouse-capture #x00004000)
  (:always-on-top #x00008000)
  (:skip-taskbar #x00010000)
  (:utility #x00020000)
  (:tooltip #x00040000)
  (:popup-menu #x00080000)
  (:keyboard-grabbed #x00100000)
  (:vulkan #x10000000)
  (:metal #x20000000))

(c:defcenum (window-fullscreen-flags :uint32)
  (:windowed #x00000000)
  (:fullscreen #x00000001)
  (:fullscreen-desktop #x00001001))

(c:defcenum (window-position :uint32)
  (:undefined #x1fff0000)
  (:centered #x2fff0000))

(c:defcenum (window-event-id :uint8)
  :none
  :shown
  :hidden
  :exposed
  :moved
  :resized
  :size-changed
  :minimized
  :maximized
  :restored
  :enter
  :leave
  :focus-gained
  :focus-lost
  :close
  :take-focus
  :hit-test
  :iccprof-changed
  :display-changed)

(c:defcenum (display-event-id :uint8)
  :none
  :orientation
  :connected
  :disconnected
  :moved)

(c:defctype gl-context :pointer)

(c:defcenum (gl-attr :uint8)
  :red-size
  :green-size
  :blue-size
  :alpha-size
  :buffer-size
  :double-buffer
  :depth-size
  :stencil-size
  :accum-red-size
  :accum-green-size
  :accum-blue-size
  :accum-alpha-size
  :stereo
  :multisample-buffers
  :multisample-samples
  :accelerated-visual
  :retained-backing
  :context-major-version
  :context-minor-version
  :context-egl
  :context-flags
  :context-profile-mask
  :share-with-current-context
  :framebuffer-srgb-capable
  :context-release-behavior)

(c:defcenum (gl-profile :uint16)
  (:unknown #x0000)
  (:core #x0001)
  (:compatibility #x0002)
  (:es #x0004))

(c:defbitfield (gl-context-flag :uint16)
  :debug
  :forward-compatible
  :robust-access
  :reset-isolation)

(c:defcenum (gl-context-release-flag :uint16)
  :none
  :flush)

(c:defcenum (gl-context-reset-notification :uint16)
  :no-notification
  :lose-context)

;;; render

(c:defbitfield (renderer-flags :uint32)
  (:software #x00000001)
  (:accelerated #x00000002)
  (:present-vsync #x00000004)
  (:target-texture #x00000008))

(c:defcenum (renderer-flip :uint32)
  (:none #x00000000)
  (:horizontal #x00000001)
  (:vertical #x00000002))

(c:defcstruct renderer)

(c:defcstruct renderer-info
  (name :string)
  (flags renderer-flags)
  (num-texture-formats :uint32)
  (texture-formats (:array pixel-format-type 16))
  (max-texture-width :int)
  (max-texture-height :int))

(c:defcenum scale-mode
  :nearest
  :linear
  :best)

(c:defcenum texture-access
  :static
  :streaming
  :target)

(c:defcenum (texture-modulate :uint32)
  (:none #x00000000)
  (:color #x00000001)
  (:alpha #x00000002))

(c:defcstruct texture)

;;; events

(define-constant +text-editing-event-text-size+ 32)

(define-constant +text-input-event-text-size+ 32)

(c:defcenum event-state
  (:query -1)
  (:ignore 0)
  (:disable 0)
  (:enable 1))

(c:defcenum (event-type :uint32)
  (:first-event #x0000)
  (:quit #x0100)
  :app-terminating
  :app-lowmemory
  :app-will-enter-background
  :app-did-enter-background
  :app-will-enter-foreground
  :app-did-enter-foreground
  :locale-changed
  (:display-event #x0150)
  (:window-event #x0200)
  :syswm-event
  (:window-shown #x202)
  :window-hidden
  :window-exposed
  :window-moved
  :window-resized
  :window-pixel-size-changed
  :window-metal-view-resized
  :window-minimized
  :window-maximized
  :window-restored
  :window-mouse-enter
  :window-mouse-leave
  :window-focus-gained
  :window-focus-lost
  :window-close-requested
  :window-hit-test
  :window-iccprof-changed
  :window-display-changed
  :window-display-scale-changed
  :window-safe-area-changed
  :window-occuluded
  :window-enter-fullscreen
  :window-leave-fullscreen
  :window-destroyed
  :window-hdr-state-changed
  (:key-down #x0300)
  :key-up
  :text-editing
  :text-input
  :keymap-changed
  :text-editing-ext
  (:mouse-motion #x0400)
  :mouse-button-down
  :mouse-button-up
  :mouse-wheel
  (:joy-axis-motion #x0600)
  :joy-ball-motion
  :joy-hat-motion
  :joy-button-down
  :joy-button-up
  :joy-device-added
  :joy-device-removed
  :joy-battery-updated
  (:controller-axis-motion #x0650)
  :controller-button-down
  :controller-button-up
  :controller-device-added
  :controller-device-removed
  :controller-device-remapped
  :controller-touchpad-down
  :controller-touchpad-motion
  :controller-touchpad-up
  :controller-sensor-update
  (:finger-down #x0700)
  :finger-up
  :finger-motion
  (:dollar-gesture #x0800)
  :dollar-record
  :multi-gesture
  (:clipboard-update #x0900)
  (:drop-file #x1000)
  :drop-text
  :drop-begin
  :drop-complete
  (:audio-device-added #x1100)
  :audio-device-removed
  (:sensor-update #x1200)
  (:render-targets-reset #x2000)
  :render-device-reset
  (:poll-sentinel #x7f00)
  (:user-event #x8000)
  (:last-event #xffff))

(c:defcstruct audio-device-event
  (type event-type)
  (timestamp :uint32)
  (which :uint32)
  (capture? :uint8)
  (padding :uint8 :count 3))

(c:defcstruct common-event
  (type event-type)
  (timestamp :uint32))

(c:defcstruct controller-axis-event
  (type event-type)
  (timestamp :uint32)
  (which joystick-id)
  (axis :uint8)
  (padding :uint8 :count 3)
  (value :int16)
  (padding :uint8 :count 2))

(c:defcstruct controller-button-event
  (type event-type)
  (timestamp :uint32)
  (which joystick-id)
  (button :uint8)
  (state (:boolean :uint8))
  (padding :uint8 :count 2))

(c:defcstruct controller-device-event
  (type event-type)
  (timestamp :uint32)
  (which :int32))

(c:defcstruct controller-sensor-event
  (type event-type)
  (timestamp :uint32)
  (which joystick-id)
  (sensor :int32)
  (data :float :count 3)
  (timestamp-us :uint64))

(c:defcstruct controller-touchpad-event
  (type event-type)
  (timestamp :uint32)
  (which joystick-id)
  (touchpad :int32)
  (finger :int32)
  (x :float)
  (y :float)
  (pressure :float))

(c:defcstruct display-event
  (type event-type)
  (timestamp :uint32)
  (display :uint32)
  (event display-event-id)
  (padding :uint8 :count 3)
  (data1 :int32))

(c:defcstruct dollar-gesture-event
  (type event-type)
  (timestamp :uint32)
  (touch-id :int64)
  (gesture-id :int64)
  (num-fingers :uint16)
  (error :float)
  (x :float)
  (y :float))

(c:defcstruct drop-event
  (type event-type)
  (timestamp :uint32)
  (file :string)
  (window-id :uint32))

(c:defcstruct joy-axis-event
  (type event-type)
  (timestamp :uint32)
  (which joystick-id)
  (axis :uint8)
  (padding :uint8 :count 3)
  (value :int16)
  (padding :uint8 :count 2))

(c:defcstruct joy-ball-event
  (type event-type)
  (timestamp :uint32)
  (which joystick-id)
  (ball :uint8)
  (padding :uint8 :count 3)
  (x-rel :int16)
  (y-rel :int16))

(c:defcstruct joy-battery-event
  (type event-type)
  (timestamp :uint32)
  (which joystick-id)
  (level :int))

(c:defcstruct joy-button-event
  (type event-type)
  (timestamp :uint32)
  (which joystick-id)
  (button :uint8)
  (state (:boolean :uint8))
  (padding :uint8 :count 2))

(c:defcstruct joy-device-event
  (type event-type)
  (timestamp :uint32)
  (which joystick-id))

(c:defcstruct joy-hat-event
  (type event-type)
  (timestamp :uint32)
  (which joystick-id)
  (hat :uint8)
  (value :uint8)
  (padding :uint8 :count 2))

(c:defcstruct keyboard-event
  (type event-type)
  (timestamp :uint32)
  (window-id :uint32)
  (state (:boolean :uint8))
  (repeat :uint8)
  (padding :uint8 :count 2)
  (keysym (:struct keysym)))

(c:defcstruct mouse-button-event
  (type event-type)
  (timestamp :uint32)
  (window-id :uint32)
  (which :uint32)
  (button :uint8)
  (state (:boolean :uint8))
  (clicks :uint8)
  (padding :uint8)
  (x :int32)
  (y :int32))

(c:defcstruct mouse-motion-event
  (type event-type)
  (timestamp :uint32)
  (window-id :uint32)
  (which :uint32)
  (state :uint32)
  (x :int32)
  (y :int32)
  (x-rel :int32)
  (y-rel :int32))

(c:defcstruct mouse-wheel-event
  (type event-type)
  (timestamp :uint32)
  (window-id :uint32)
  (which :uint32)
  (x :int32)
  (y :int32)
  (direction :uint32)
  (precise-x :float)
  (precise-y :float)
  (mouse-x :int32)
  (mouse-y :int32))

(c:defcstruct multi-gesture-event
  (type event-type)
  (timestamp :uint32)
  (touch-id :int64)
  (d-theta :float)
  (d-dist :float)
  (x :float)
  (y :float)
  (num-fingers :uint16)
  (padding :uint8 :count 2))

(c:defcstruct os-event
  (type event-type)
  (timestamp :uint32))

(c:defcstruct quit-event
  (type event-type)
  (timestamp :uint32))

(c:defcstruct sensor-event
  (type event-type)
  (timestamp :uint32)
  (which :int32)
  (data :float :count 6)
  (timestamp-us :uint64))

(c:defcstruct syswm-event
  (type event-type)
  (timestamp :uint32)
  (msg :pointer))

(c:defcstruct text-editing-event
  (type event-type)
  (timestamp :uint32)
  (window-id :uint32)
  (text :char :count #.+text-editing-event-text-size+)
  (start :int32)
  (length :int32))

(c:defcstruct text-editing-ext-event
  (type event-type)
  (timestamp :uint32)
  (window-id :uint32)
  (text :string)
  (start :int32)
  (length :int32))

(c:defcstruct text-input-event
  (type event-type)
  (timestamp :uint32)
  (window-id :uint32)
  (text :char :count #.+text-input-event-text-size+))

(c:defcstruct touch-finger-event
  (type event-type)
  (timestamp :uint32)
  (touch-id :int64)
  (finger-id :int64)
  (x :float)
  (y :float)
  (dx :float)
  (dy :float)
  (pressure :float)
  (window-id :uint32))

(c:defcstruct user-event
  (type event-type)
  (timestamp :uint32)
  (window-id :uint32)
  (code :int32)
  (data1 :pointer)
  (data2 :pointer))

(c:defcstruct window-event
  (type event-type)
  (timestamp :uint32)
  (window-id :uint32)
  (event window-event-id)
  (padding :uint8 :count 3)
  (data1 :int32)
  (data2 :int32))

(c:defcunion event-data
  (common (:struct common-event))
  (display (:struct display-event))
  (window (:struct window-event))
  (key (:struct keyboard-event))
  (edit (:struct text-editing-event))
  (edit-ext (:struct text-editing-ext-event))
  (text (:struct text-input-event))
  (mouse-motion (:struct mouse-motion-event))
  (mouse-button (:struct mouse-button-event))
  (mouse-wheel (:struct mouse-wheel-event))
  (joystick-axis (:struct joy-axis-event))
  (joystick-ball (:struct joy-ball-event))
  (joystick-hat (:struct joy-hat-event))
  (joystick-button (:struct joy-button-event))
  (joystick-device (:struct joy-device-event))
  (joystick-battery (:struct joy-battery-event))
  (controller-axis (:struct controller-axis-event))
  (controller-button (:struct controller-button-event))
  (controller-device (:struct controller-device-event))
  (controller-touchpad (:struct controller-touchpad-event))
  (controller-sensor (:struct controller-sensor-event))
  (audio-device (:struct audio-device-event))
  (sensor (:struct sensor-event))
  (quit (:struct quit-event))
  (user (:struct user-event))
  (syswm (:struct syswm-event))
  (touch-finger (:struct touch-finger-event))
  (multi-gesture (:struct multi-gesture-event))
  (dollar-gesture (:struct dollar-gesture-event))
  (drop (:struct drop-event)))

(c:defcstruct event
  (type event-type)
  (data (:union event-data)))

;;; sdl

(c:defbitfield (init-flags :uint32)
  (:timer #x00000001)
  (:audio #x00000010)
  (:video #x00000020)
  (:joystick #x00000200)
  (:haptic #x00001000)
  (:game-controller #x00002000)
  (:events #x00004000)
  (:everything #x00007231))
