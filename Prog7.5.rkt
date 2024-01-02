#lang racket/base

;; Program 7.5 writeln

(provide writeline)

;; writeln
(define writeline
  (λ args
    (for-each display args)
    (newline)))