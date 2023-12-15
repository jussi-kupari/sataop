#lang racket/base

(module+ test
  (require rackunit))

#|Exercises
Exercise 1.6
Using the symbols one and two and the procedure cons, we can construct the
list (one two) by typing (cons 'one (cons 'two '())). Using the symbols
one, two, three, and four and the procedure cons, construct the following
lists without using quoted lists (you may use quoted symbols and the empty
list):

a. (one two three four)
b. (one (two three four))
c. (one (two three) four)
d. ((one two) (three four))
e. (((one)))|#

(module+ test
  (check-equal? (cons 'one (cons 'two (cons 'three (cons 'four '()))))
   '(one two three four))
  
  (check-equal? (cons 'one (cons (cons 'two (cons 'three (cons 'four '()))) '()))
   '(one (two three four)))
  
  (check-equal? (cons 'one (cons (cons 'two (cons 'three '()))(cons 'four '())))
  '(one (two three) four))
  
  (check-equal? (cons (cons 'one (cons 'two '())) (cons (cons 'three (cons 'four '())) '()))
   '((one two) (three four)))
  
  (check-equal? (cons (cons (cons 'one '()) '()) '())
   '(((one))))
  )