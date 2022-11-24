#lang sicp 
;chap1 ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

#|
S式とは...
アトムはS式
リストはS式
S式を要素に持つリストもS式

アトムとは...
アルファベットと()以外の記号からなる文字列
数値

リストとは...
()：要素を持たないリストもリスト。空リスト、empty list, null listと呼ぶ。
(a b c)：アトムを要素に持つリスト
((a) (b) (c))：リストを要素に持つリスト
(a (b) ((c d)))：アトム、リスト、リストのリストを要素にもつリスト
(()()()())：これもリスト
(a) b：カッコで括られていないのでリストではない。リストとアトムが並んでいるだけ。
|#

;(car l)：空でないリストlに大して、最初のs式を返す。
(car '(car cdr))
(car '(car?))
    ;(car '())
    #|error-message
    mcar: contract violation
    expected: mpair?
    given: ()
    |#

;(cdr l)：空でないリストlに対して、(car l)を取り去ったリストを返す
(cdr '(car cdr cddr cdddr))
(cdr '(guessWhat))
    ;(cdr '())
    #|error-message
    mcdr: contract violation
    expected: mpair?
    given: ()
    |#

;(cons s l)：第一引数にs式、第二引数にリストをとり、lのcar lとしてsをくっつけたリストを返す。
(cons '() '());(())
(cons 'atom '(is not list));(atom is not list)
(cons '() 'iMatom);(() . iMatom); ドット表記になる。

;(null? l)：リストlに対して、それが空リストなら#t、そうでないなら#fを返す
(null? '(atom)) ;#f
(null? '()) ;#t
(null? 123) ;引数がアトムだと偽を返す(racket)

;(atom? s)：s式sに対して、それがアトムなら#t, そうでないなら#fを返す
;atom?を定義する
(define atom?
    (lambda (x)
        (and (not (pair? x)) (not (null? x)))))

(atom? 'atom);#t
(atom? 42);#t
(atom? #t);#t
(atom? '());#f
(atom? '(()));#f

;(eq? a1 a2)：第一、第二引数に数でないアトムを取り、それらが同一なら#t、そうでないなら#fを返す
(eq? 'Harry 'Harry);#t
(eq? 'margarine 'butter);#f
(eq? '() '(strawberry));#f
(eq? 6 7);#f 引数の型違いエラーではなく、#fを返す
(eq? 6 6);#t 本文では数のアトムに対しては答えなしだがracketでは#tを返す。


;chap2 ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

;chap3 ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
;chap4 ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
;chap5 ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
;chap6 ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
;chap7 ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
;chap8 ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
;chap9 ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
;chap10 ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

