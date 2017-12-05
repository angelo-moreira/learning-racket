#lang racket

(provide (all-defined-out))
(define x 3)
(define y (+ x 2))

;;; lambda is a keyword for anonymous functions
(define cube1
  (lambda (x)
    (* x (* x x))))

(define cube2
  (lambda (x)
    (* x x x)))

;;; we dont need to define a name for our anonymous function
(define (cube3 x)
  (* x x x))

;;; recursion
(define (pow1 x y)
  (if (= y 0)
    1
    (* x (pow1 x (- y 1)))))

;;; currying not very common because we have multi arguments functions
(define pow2
  (lambda (x)
    (lambda (y)
      (pow1 x y))))

;;; example of partial application
(define three-to-the (pow2 3))

;;; Apply a normal function and then a curried function
(define twentyfive (pow1 5 2))
(define sixteen ((pow2 4) 2))