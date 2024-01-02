#lang racket/base

;; Program 2.5 remove-1st-trace

(provide remove-1st-trace)

(require (only-in "Prog2.6.rkt" entering)
         (only-in "Prog2.7.rkt" leaving))

;; remove-1st-trace
(define remove-1st-trace
  (λ (item ls)
    (cond
      ((entering (null? ls) ls 1)
       (leaving '() 1))
      ((entering (equal? (car ls) item) ls 2)
       (leaving (cdr ls) 2))
      ((entering 'else ls 3)
       (leaving
        (cons (car ls) (remove-1st-trace item (cdr ls)))
        3)))))