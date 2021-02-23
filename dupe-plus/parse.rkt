#lang racket
(provide parse)
(require "ast.rkt")

(define (parse-clauses h t)
  (match h
    [(list e1 e2)  (match e1
                     ['else (parse e2)]
                     [_ (If (parse e1) (parse e2) (parse-clauses (first t) (rest t)))])])
)

;; S-Expr -> Expr
(define (parse s)
  (cond
    [(integer? s) (Int s)]
    [(boolean? s) (Bool s)]
    [else
     (match s
       [(list 'add1 e)  (Prim1 'add1 (parse e))]
       [(list 'sub1 e)  (Prim1 'sub1 (parse e))]
       [(list 'abs e)    (Prim1 'abs (parse e))]
       [(list '- e)      (Prim1 'neg (parse e))]
       [(list 'cond e ...) (parse-clauses (first e) (rest e))]
       [(list 'zero? e) (Prim1 'zero? (parse e))]
       [(list 'not e)                   (Prim1 'not (parse e))]
       [(list 'if e1 e2 e3)
        (If (parse e1) (parse e2) (parse e3))]
       )]))


