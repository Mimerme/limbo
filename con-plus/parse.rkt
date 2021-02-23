#lang racket
(provide parse)
(require "ast.rkt")

(define (parse-clauses h t)
  (match h
    [(list e1 e2) 
     (match e1 
       [(list 'zero? e) (IfZero (parse e) (parse e2) (parse-clauses (first t) (rest t)))]
       ['else (parse e2)])
     ]
))

;; S-Expr -> Expr
(define (parse s)
  (cond
    [(integer? s) (Int s)]
    [else
     (match s
       [(list 'add1 e)                 (Prim1 'add1 (parse e))]
       [(list 'sub1 e)                 (Prim1 'sub1 (parse e))]
       [(list 'abs e)                   (Prim1 'abs (parse e))]
       [(list '- e)                     (Prim1 'neg (parse e))]
       [(list 'cond e ...)  (parse-clauses (first e) (rest e))]
       [(list 'if z1 e2 e3)
        (match z1
          [(list 'zero? e1)
           (IfZero (parse e1) (parse e2) (parse e3))])]
       ;; TODO: Handle conditionals
       )]))

;                             [(list h t ...) (match h
;                                               [(e1 e2) IfZero (parse e1) (IfZero)])]
;;(define (parse-clauses))
