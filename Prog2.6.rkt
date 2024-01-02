#lang racket/base

;; Program 2.6 entering

(provide entering)

(require (only-in "Prog7.5.rkt" writeline))

;; entering
(define entering
  (λ (test input cond-clause-number)
    (begin
      ;; For one-sided conditionals Racket uses 'when' and 'unless'
      (when test (writeline " Entering cond-clause-"
                            cond-clause-number " with ls = " input))
      test)))