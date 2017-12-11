#lang racket

(provide (all-defined-out))

(define (slow-add x y)
    (letrec ([slow-id (lambda(y z)
                        (if (= z 0)
                            y
                            (slow-id y (- z 1))))])
    (+ (slow-id x 500000000) y)))

(define (my-delay th)
    (mcons #f th))

;;; calls the thunk only once, after that it returns the result of the computation
(define (my-force p)
    (if (mcar p)
        (mcdr p)
        (begin  (set-mcar! p #t)
                (set-mcdr! p ((mcdr p)))
                (mcdr p))))

(define (my-mult x y-thunk)
    (cond [(= x 0) 0]
          [(= x 1) (y-thunk)]
          [#t (+ (y-thunk) (my-mult (- x 1) y-thunk))]))


(my-mult 0 (let ([x (my-delay (lambda () (slow-add 3 4)))])
            (lambda () (my-force x))))

(my-mult 7 (let ([x (my-delay (lambda () (slow-add 3 4)))])
            (lambda () (my-force x))))