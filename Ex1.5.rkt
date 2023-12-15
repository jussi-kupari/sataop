#lang racket/base

#|Exercise 1.5
If a, b, and g are any three numbers, translate each of the following Scheme
expressions into the usual arithmetical expressions. For example:

                       (+ a (+ b g)) translates into a + (b + g)

a. (+ a (- (+ b g) a))
b. (+ (* a b) (* g b))
c. (/ (- a b) (- a g))|#

; a. a + ((b + g) - a)
; b. (a * b) + (g * b)
; c. (a - b) / (a - g) 