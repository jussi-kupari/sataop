#lang racket/base

#|Exercise 1.2
Assume that the following definitions have been made in the given order:

                     (define big-number 10500900)
                     (define small-number 0.00000025)
                     (define Cheshire 'cat)
                     (define number 1 big-number)
                     (define number2 'big-number)

What values are returned when the following are entered in response to the
prompt?

a. big-number        b. small-number
c. 'big-number       d. Cheshire
e. 'Cheshire         f. number1
g. number2           h. 'number1

Conduct the experiment on the computer in order to verify your answers.|#

;; Values returned by Racket
(define big-number 10500900)     ; 10500900
(define small-number 0.00000025) ; 2.5e-7
(define Cheshire 'cat)           ; 'cat
(define number1 big-number)      ; 10500900
(define number2 'big-number)     ; 'big-number