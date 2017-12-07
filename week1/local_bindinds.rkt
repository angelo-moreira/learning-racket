#lang racket

(provide (all-defined-out))

(define (max-of-list xs)
    (cond
        [(null? xs) (error "max-of-list given empty list")]
        [(null? (cdr xs)) (car xs)]
        [#t (let ([tlans (max-of-list (cdr xs))])
                (if (> tlans (car xs))
                    tlans
                    (car xs)))]))


(define (silly-double x)
    (let ([x (+ x 3)]
         [y (+ x 2)]) ; the x is bound to the parameter because thats why let works
      (+ x y -5)))

(define (silly-double2 x)
    (let*  ([x (+ x 3)]
            [y (+ x 2)]) ; the x is bound to the previous x
        (+ x y -8)))

;;; expresssions are evaluated with all the bindings, its especially needed for mutual recursion
;;; w works in the lambda (+ z y w x) because it's evaluated once it gets called
(define (silly-triple x)
    (letrec ([y (+ x 2)]
             [f (lambda (z) (+ z y w x))]
             [w (+ x 7)])
        (f -9)))

