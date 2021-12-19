;; -*- lexical-binding: t; -*-

;; ref
;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Bitwise-Operations.html

(defvar Data.Int.Bits.and
  (lambda (a)
    (lambda (b)
      (logand a b))))

(defvar Data.Int.Bits.or
  (lambda (a)
    (lambda (b)
      (logior a b))))

(defvar Data.Int.Bits.xor
  (lambda (a)
    (lambda (b)
      (logxor a b))))

(defvar Data.Int.Bits.shl
  (lambda (i)
    (lambda (s)
      (ash i s))))

(defvar Data.Int.Bits.shr
  (lambda (i)
    (lambda (s)
      (ash i (- s)))))

(defvar Data.Int.Bits.zshr
  (lambda (i)
    (lambda (s)
      (lsh i (- s)))))

(defvar Data.Int.Bits.complement
  (lambda (i)
    (lognot i)))
