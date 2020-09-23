#lang racket
(require "../interp.rkt" "../compile.rkt" "../asm/interp.rkt" "../random.rkt" "../syntax.rkt" rackunit)

(define (check-compiler e)
  (let ((e (sexpr->ast e)))
    (check-eqv? (asm-interp (compile e))
                (interp e)
                e)))

(for ([i (in-range 500)])
  (check-compiler (random-expr)))

