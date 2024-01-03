#lang racket/base

;; Program 7.5 writeln

(provide writeline)

;; This function is the same as the Scheme writeln in the book
;; Racket has a writeln with slightly different functionality

;; writeline
(define writeline
  (λ args
    (for-each display args)
    (newline)))