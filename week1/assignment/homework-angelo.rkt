
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

(define (sequence low high stride)
    (cond
        [(< low high) (cons low (sequence (+ low stride) high stride))]
        [#t (cons high null)]))

(define (string-append-map xs suffix)
    (map (lambda(x) (string-append x suffix)) xs))

(define (list-nth-mod xs n)
    (cond [(< n 0) (error "list-nth-mod: negative number")]
          [(empty? xs) (error "list-nth-mod: empty list")]
          [#t (car (list-tail xs (remainder n (length xs))))]))

(define ones (lambda () (cons 1 ones)))

(define (stream-for-n-steps s n)
    (letrec ([f (lambda(s n)
                (cond [(= n 1) (cons (car (s)) null)]
                      [#t (cons (car (s)) (f s (- n 1)))]))])
        (f s n)))

