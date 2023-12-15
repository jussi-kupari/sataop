#lang racket/base

(module+ test
  (require rackunit))

#|Exercise 1.14
Decide whether the following expressions are true or false:

a. (symbol? (car '(cat mouse)))
b. (symbol? (cdr '((cat mouse))))
c. (symbol? (cdr '(cat mouse)))
d. (pair? (cons 'hound '(dog)))
e. (pair? (car '(Cheshire cat)))
f. (pair? (cons '() '()))|#

(module+ test
  ;; a. True
  (check-true (symbol? (car '(cat mouse))))

  ;; b. False, '() is a list
  (check-false (symbol? (cdr '((cat mouse)))))

  ;; c. False, '(mouse) is a list
  (check-false (symbol? (cdr '(cat mouse))))

  ;; d. True, '(hound dog) is a list and a pair
  (check-true (pair? (cons 'hound '(dog))))

  ;; e. False, 'Cheshire is a symbol
  (check-false (pair? (car '(Cheshire cat))))

  ;; f. True, '(() ()) is a list and a pair
  (check-true (pair? (cons '() '())))
  )