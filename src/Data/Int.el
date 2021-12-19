;; -*- lexical-binding: t; -*-

(require 'calc-bin)

(defvar Data.Int.fromNumberImpl
  (lambda (just)
    (lambda (nothing)
      (lambda (n)
        (if (or (isnan n) (= n 1.0e+INF) (= n -1.0e+INF))
            nothing
          (let ((i (round n)))
            (if (= i n)
                (funcall just i)
              nothing)))))))

(defvar Data.Int.toNumber
  (symbol-function 'float))

(defvar Data.Int.quot
  (lambda (x)
    (lambda (y)
      (/ x y))))

(defvar Data.Int.rem
  (lambda (x)
    (lambda (y)
      (% x y))))

(defvar Data.Int.pow
  (lambda (x)
    (lambda (y)
      (truncate (expt x y)))))

;; Number と違い Intの場合は正確に正規表現でチェック可能なので、
;; string-to-numberのややこしいケースを考える必要はない。
(defvar Data.Int.fromStringAsImpl
  (lambda (just)
    (lambda (nothing)
      (lambda (radix)
        (let* ((digits
                (cond ((< radix 11) (concat "[0-" (number-to-string (1- radix)) "]"))
                      ((= radix 10) "[0-9a]")
                      (t (concat "[0-9a-" (char-to-string (+ 86 radix)) "]"))))
               (pattern
                (concat "^[-+]?" digits "+$")))
          (lambda (s)
            (if (string-match pattern s)
                (funcall just (string-to-number s radix))
              nothing)))))))

;; use calc-bin's math-format-radix
(defvar Data.Int.toStringAs
  (lambda (radix)
    (lambda (i)
      (let ((calc-number-radix radix))
        (downcase (math-format-radix i))))))
