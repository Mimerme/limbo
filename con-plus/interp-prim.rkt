#lang racket
(provide interp-prim1)

;; Op Integer -> Integer
(define (interp-prim1 op i)
  (match op
    ['add1 (add1 i)]
    ['sub1 (sub1 i)]
    ['abs (abs i)]
    ['neg (- 0 i)]
    ))

