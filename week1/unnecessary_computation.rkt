#lang racket

(provide (all-defined-out))

;;; creating a silly slow function to demonstrate the trade offs of pre-computing results
(define (slow-add x y)
    (letrec ([slow-id (lambda(y z)
                        (if (= z 0)
                            y
                            (slow-id y (- z 1))))])
    (+ (slow-id x 500000000) y)))

(define (my-mult x y-thunk)
    (cond [(= x 0) 0]
          [(= x 1) (y-thunk)]
          [#t (+ (y-thunk) (my-mult (- x 1) y-thunk))]))

;;; first call is very fast, subsequent calls are going to be exponantially slow
;;; (my-mult 0 (lambda() (slow-add 3 4)))
;;; (my-mult 4 (lambda() (slow-add 3 4)))

;;; the calls are going to take about the same time since we "eagerly evaluate" x
;;; (my-mult 0 (let ([x (slow-add 3 4)]) (lambda() x)))
;;; (my-mult 4 (let ([x (slow-add 3 4)]) (lambda() x)))

