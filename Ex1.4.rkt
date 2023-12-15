#lang racket/base

#|Exercise 1.4
Write the Scheme expressions that denote the same calculation as the following
arithmetic expressions. Verify your answers by conducting the appropriate
experiment on the computer.

a. (4 * 7) - (13 + 5)
b. (3 * (4 + (-5 - -3)))
c. (2.5 / (5 * (1 / 10)))
d. 5 * ((537 * (98.3 + (375 - (2.5 * 153)))) + 255)|#

(- (* 4 7) (+ 13 5))                               ; ==> 10
(* 3 (+ 4 (- -5 -3)))                              ; ==> 5
(/ 2.5 (* 5 (/ 1 10)))                             ; ==> 5.0
(* 5 (+ (* 537 (+ 98.3 (- 375 (* 2.5 153)))) 255)) ; ==> 245073.0