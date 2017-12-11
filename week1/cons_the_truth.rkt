#lang racket

(provide (all-defined-out))

;;; pair and lists are just cons, lists end with null
(define pr (cons 1 (cons #t "hi")))
(define lst (cons 1 (cons #t (cons "hi" null))))