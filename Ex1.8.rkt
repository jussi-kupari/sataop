#lang racket/base

#|Exercise 1.8
What is the result of evaluating '(a 'b)? (Try it!) Explain this result.|#

;; This evaluates to the its literal self '(a 'b)

(module+ test
  (require rackunit)
  
  (check-equal? '(a 'b) '(a 'b))
  )