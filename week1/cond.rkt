#lang racket

(provide (all-defined-out))

(define xs (list 4 5 6))
(define ys (list (list 4 (list 5 0)) 6 7 (list 8) 9 2 3 (list 0 1)))
(define zs (list (list "hi" (list 4)) 5 (list 7 2)))

;;; Rewritting sum function using cond, much better style
;;; by convention we going to use [], but in racket they are the same as ()
(define (sum3 xs)
    (cond 
        [(null? xs) 0]
        [(number? (car xs)) (+ (car xs) (sum3 (cdr xs)))]
        [#t (+ (sum3 (car xs)) (sum3 (cdr xs)))]))
        ;;; if car xs is not null or a number then it must be a list and we will treat it as such
        ;;; obv this gives us an error if an element of a list is a string

(define (sum4 xs)
    (cond
        [(null? xs) 0]
        [(number? (car xs)) (+ (car xs) (sum4 (cdr xs)))]
        [(list? (car xs)) (+ (sum4 (car xs)) (sum4 (cdr xs)))]
        [#t (sum4 (cdr xs))]))
        ;;; This version acceps string in a list of elements 
        ;;; it won't throw an error since we just ignore the first element

(define (count-falses xs)
    (cond
        [(null? xs) 0]
        [(car xs) (count-falses (cdr xs))]
        [#t (+ 1 (count-falses (cdr xs)))]))