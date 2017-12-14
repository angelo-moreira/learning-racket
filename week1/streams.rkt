#lang racket

(provide (all-defined-out))

;;; streams return a pair, the first element and an infinite sequence
;;; gotchas we don't want to call the function, we want to return it, no parenthesis please
(define ones (lambda() (cons 1 ones)))

;;; 1 2 3 4 5 6
(define (f x) (cons x (lambda () (f (+ x 1)))))
(define nats (lambda () (f 1)))

;;; we can keep calling cdr (and execute the function) to infinity
(car ((cdr ((cdr ((cdr ((cdr (nats))))))))))

(define (nats2 y)
    (letrec ([f (lambda(x) (cons x (lambda () (f (+ x 1)))))])
        (lambda () (f y))))

(car ((cdr ((cdr ((nats2 6)))))))


(define (powers-of-two y)
    (letrec ([f (lambda(x) (cons x (lambda () (f (* x 2)))))])
        (lambda () (f y))))
