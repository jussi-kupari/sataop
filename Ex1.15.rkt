#lang racket/base

#|Exercise 1.15
Decide whether the following expressions are true or false:

a. (eqv? (car '(a b)) (car (cdr '(b a))))
b. (eqv? 'flea (car (cdr '(dog flea))))
c. (eq? (cons 'a '(b c)) (cons 'a '(b c)))
d. (eqv? (cons 'a '(b c)) (cons 'a '(b c)))
e. (equal? (cons 'a '(b c)) (cons 'a '(b c)))
f. (null? (cdr (cdr '((a b c) d))))
g. (null? (car '(())))
h. (null? (car '((()))))|#

(module+ test
  (require rackunit))

(module+ test
  ;; a. True, the symbols 'a and 'a are identical
  (check-true (eqv? (car '(a b)) (car (cdr '(b a)))))

  ;; b.True, the symbols 'flea and 'flea are identical
  (check-true (eqv? 'flea (car (cdr '(dog flea)))))

  ;; c. False, The two lists look identical but are different to eq?
  (check-false (eq? (cons 'a '(b c)) (cons 'a '(b c))))

  ;; d. False, The two lists look identical but are different to eqv?
  (check-false (eqv? (cons 'a '(b c)) (cons 'a '(b c))))

  ;; e. True, The two identical to equal?
  (check-true (equal? (cons 'a '(b c)) (cons 'a '(b c))))

  ;; f. True, the tail of the list '(d) is the null list '()
  (check-true (null? (cdr (cdr '((a b c) d)))))

  ;; g. True, the head of the list is the null list '()
  (check-true (null? (car '(()))))

  ;; h. False, The head of the list is a list containing the null list '()
  (check-false (null? (car '((()))))))
