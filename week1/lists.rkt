#lang racket

(provide (all-defined-out))

;;; List processing: null, cons, null?, car, cdr
;;; car takes the first element of a list
;;; cdr takes the last element of a list
;;; to check if null we must use null?
;;; cons
;;; we won't use pattern matching in racker

;;; sum all the numbers in a list
(define (sum xs)
    (if (null? xs)
        0
        (+ (car xs) (sum (cdr xs)))))

;;; append
(define (my-append xs ys)
    (if (null? xs)
        ys
        (cons (car xs) (my-append (cdr xs) ys))))

;;; map
(define (my-map f xs)
    (if (null? xs)
        null
        (cons (f (car xs))
            (my-map f (cdr xs)))))