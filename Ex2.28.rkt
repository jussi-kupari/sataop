#lang racket/base
#|Exercise 2.28: tracing, test-tracing
A more generally applicable tracing tool than the procedure leaving given
in Program 2.7 is the procedure tracing defined by

(define tracing
  (λ (message result)
    (begin
      (writeln message result)
      result)))

Similarly, the procedure test-tracing defined by

(define test-tracing
  (λ (test message input)
    (begin
      (if test (tracing message input))
      test)))

is useful for tracing the test part of a conditional expression. Rewrite the
definition of remove-1st-trace using test-tracing and tracing instead of
entering and leaving in such a way as to produce exactly the same output
as that generated using entering and leaving. |#

(provide tracing test-tracing)

(require (only-in "Prog7.5.rkt" writeline))

;; tracing
(define tracing
  (λ (message result)
    (begin
      (writeline message result)
      result)))

;; test-tracing
(define test-tracing
  (λ (test message input)
    (begin
      (when test (tracing message input))
      test)))


;; remove-1st-trace : Item List -> List
;; Produce the list with first occurrence of item removed with tracing
(define remove-1st-trace
  (λ (item ls)
    (cond
      ((test-tracing (null? ls) " Entering cond-clause-1 with ls = " ls)
       (tracing "Leaving cond-clause-1 with result  = " '()))
      ((test-tracing (equal? (car ls) item) " Entering cond-clause-2 with ls = " ls)
       (tracing "Leaving cond-clause-2 with result  = " (cdr ls) ))
      ((test-tracing 'else " Entering cond-clause-3 with ls = " ls)
       (tracing
        "Leaving cond-clause-3 with result  = "
        (cons (car ls) (remove-1st-trace item (cdr ls))))))))


(module+ test
  (require rackunit)

  (check-equal? (remove-1st-trace 'c '(a b c d)) '(a b d))

  #|Prints
 Entering cond-clause-3 with ls = (a b c d)
 Entering cond-clause-3 with ls = (b c d)
 Entering cond-clause-2 with ls = (c d)
Leaving cond-clause-2 with result  = (d)
Leaving cond-clause-3 with result  = (b d)
Leaving cond-clause-3 with result  = (a b d) |# 
  )