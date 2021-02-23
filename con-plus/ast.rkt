#lang racket
(provide (all-defined-out))

;; type Expr =
;; | (Int Integer)
;; | (Prim1 Op Expr)
;; | (IfZero Expr Expr Expr)
;; | (Cond ClauseList)

;; type Op = 'add1 | 'sub1 | 'abs | 'neg


;; TODO: Add other forms of expression to the comment above and fill in your new structures below

(struct Int (i)           #:prefab)
(struct Prim1 (p e)       #:prefab)
(struct IfZero (e1 e2 e3) #:prefab)
(struct Cond (cs)         #:prefab)
(struct Clause (e1 e2)    #:prefab)


