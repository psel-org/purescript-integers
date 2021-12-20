;; -*- lexical-binding: t; -*-

(require 'psel)

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

;; JSと挙動を合せるなら s < 0 の場合 0 を返すべきか？
(defvar Data.Int.Bits.shl
  (lambda (i)
    (lambda (s)
      (ash i s))))

(defvar Data.Int.Bits.shr
  (lambda (i)
    (lambda (s)
      (ash i (- s)))))

;; bignumを持つemacsではあまり意味ある演算ではないし、JSと乖離しているため
;; unspportで。実装するとしたら (lsh i (- s)) かな？
(defvar Data.Int.Bits.zshr
  (lambda (i)
    (lambda (s)
      (psel/unrecoverable-error "Data.Int.Bits.zshr not supported"))))

(defvar Data.Int.Bits.complement
  (lambda (i)
    (lognot i)))
