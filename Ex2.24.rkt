#lang racket/base

#|Exercise 2.24: describe
With describe defined as

(define describe
  (λ (s)
    (cond
      ((null? s) (quote '()))
      ((number? s) s)
      ((symbol? s) (list 'quote s))
      ((pair? s) (list 'cons (describe (car s)) (describe (cdr s))))
      (else s))))

evaluate each of the following expressions:
a. (describe 347)
b. (describe 'hello)
c. (describe '(1 2 button my shoe))
d. (describe '(a (b c (d e) f g) h))|#

;; describe
(define describe
  (λ (s)
    (cond
      ((null? s) (quote '()))
      ((number? s) s)
      ((symbol? s) (list 'quote s))
      ((pair? s) (list 'cons (describe (car s)) (describe (cdr s))))
      (else s))))

#| Racket doesn't behave quite like the book is intending in some of the cases. For example:
   (list 'quote hello) evaluates to ''hello, when, I assume it is meant in the book to
   return (quote hello) or something similar. This is likely because of implementation differences
   betweem Racket and a Scheme from 1989. |#

#| Answers:
   a. 347
   b. '(quote hello)
   c. '(cons 1 (cons 2 (cons 'button (cons 'my (cons 'shoe '())))))
   d. '(cons
       'a
       (cons
        (cons
         'b
         (cons
          'c
          (cons (cons 'd (cons 'e '())) (cons 'f (cons 'g '())))))
        (cons 'h '())))

   describe returns the symbolic/literal version of the expression that evaluates to the given input. |#