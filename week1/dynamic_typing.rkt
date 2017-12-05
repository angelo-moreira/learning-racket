#lang racket

(provide (all-defined-out))

(define xs (list 4 5 6))
(define ys (list (list 4 (list 5 0)) 6 7 (list 8) 9 2 3 (list 0 1)))
(define zs (list (list "hi" (list 4)) 5 (list 7 2)))

;;; Throws an error if you send a not integer type
(define (sum1 xs)
    (if (null? xs)
        0
        (if (number? (car xs))
            (+ (car xs) (sum1 (cdr xs)))
            (+ (sum1 (car xs)) (sum1 (cdr xs))))))

;;; This checks if there is anything but a list and ignores it
(define (sum2 xs)
    (if (null? xs)
        0
        (if (number? (car xs))
            (+ (car xs) (sum2 (cdr xs)))
            (if (list? (car xs))
                (+ (sum2 (car xs)) (sum2 (cdr xs)))
                (sum2 (cdr xs))))))
