#lang racket/base

#|Exercise 2.25
Write a trace similar to the one used in remove-1st-trace to trace the procedure swapper, showing
the binding of the parameter Is each time the cond expression is entered and whenever a cond clause
is exited. Invoke the traced procedure swapper-trace on the arguments b, d, and (a b c d b) used in
the example in this section.|#

(require
  (only-in "Prog2.6.rkt" entering)
  (only-in "Prog2.7.rkt" leaving))

(module+ test
  (require rackunit))

;; swapper-trace : Item Item List -> List
;; Produces a list where the two items have changed places together with tracing output.
(define swapper-trace
  (λ (x y ls)
    (cond
      ((entering (null? ls) ls 1)
       (leaving '() 1))
      ((entering (equal? (car ls) x) (car ls) 2)
       (leaving (cons y (swapper-trace x y (cdr ls))) 2))
      ((entering (equal? (car ls) y) (car ls) 3)
       (leaving (cons x (swapper-trace x y (cdr ls))) 3))
      ((entering 'else ls 4)
       (leaving (cons (car ls) (swapper-trace x y (cdr ls))) 4)))))

(module+ test
  ;; Returns
  (check-equal? (swapper-trace 'b 'd '(a b c d b)) '(a d c b d))

  #| Output
     Entering cond-clause-4 with ls = (a b c d b)
     Entering cond-clause-2 with ls = b
     Entering cond-clause-4 with ls = (c d b)
     Entering cond-clause-3 with ls = d
     Entering cond-clause-2 with ls = b
     Entering cond-clause-1 with ls = ()
    Leaving cond-clause-1 with result  = ()
    Leaving cond-clause-2 with result  = (d)
    Leaving cond-clause-3 with result  = (b d)
    Leaving cond-clause-4 with result  = (c b d)
    Leaving cond-clause-2 with result  = (d c b d)
    Leaving cond-clause-4 with result  = (a d c b d)
    '(a d c b d)
|#
  )