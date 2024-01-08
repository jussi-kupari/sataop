#lang racket/base

#|Exercise 2.22
In the first trace, the second and third cond clauses were entered. In the second trace, the first
and third cond clauses were entered. Can you give a remove-1st-trace invocation that enters only the
first and second cond clauses? Explain.

;; remove-1st-trace
(define remove-lst-trace
  (λ (item ls)
    (cond
      ((entering (null? ls) ls 1)
       (leaving '() 1))
      ((entering (equal? (car ls) item) ls 2)
       (leaving (cdr ls) 2))
      ((entering 'else ls 3)
       (leaving
        (cons (car ls) (remove-lst-trace item (cdr ls)))
        3)))))

First trace:

(remove-1st-trace 'c '(a b c d))
 Entering cond-clause-3 with ls = (a b c d)
 Entering cond-clause-3 with ls = (b c d)
 Entering cond-clause-2 with ls = (c d)
Leaving cond-clause-2 with result  = (d)
Leaving cond-clause-3 with result  = (b d)
Leaving cond-clause-3 with result  = (a b d)
'(a b d)

Second trace:

(remove-1st-trace 'e ' (a b c d))
 Entering cond-clause-3 with ls = (a b c d)
 Entering cond-clause-3 with ls = (b c d)
 Entering cond-clause-3 with ls = (c d)
 Entering cond-clause-3 with ls = (d)
 Entering cond-clause-1 with ls = ()
Leaving cond-clause-1 with result  = ()
Leaving cond-clause-3 with result  = (d)
Leaving cond-clause-3 with result  = (c d)
Leaving cond-clause-3 with result  = (b c d)
Leaving cond-clause-3 with result  = (a b c d)
'(a b c d)

|#

#| Answer:
There is no invocation where both first and second cond clauses are entered. If the first cond is entered
then the original list is either empty or the searched item was not on the list and the first cond clause
is entered at the very end. If the second cond clause is entered, it will return the cdr of the list; therefore
the empty list (first cond clause) is never reached. |#