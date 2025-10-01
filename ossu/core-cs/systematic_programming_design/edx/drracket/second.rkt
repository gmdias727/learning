;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname second) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(circle 10 "solid" "red")
(rectangle 30 60 "outline" "blue")
(text "hello" 24 "orange")

(above (beside (overlay (circle 10 "solid" "red") (circle 20 "solid" "yellow") (circle 30 "solid" "blue")) (circle 5 "solid" "white") (overlay (circle 10 "solid" "red") (circle 20 "solid" "yellow") (circle 30 "solid" "blue"))) (text "UU" 22 "red"))

; constant definitions
(define WIDTH 400)
(define HEIGHT 600)
(* WIDTH HEIGHT)

(define (bulb term)
  (circle 40 "solid" term))

(bulb "black")

; (define (chromosome x y))
; (chromosome x x) 'female
; (chromosome x y) 'male

(define (chromosome first second)
  (cond
    [(equal? first second) 'female]
    [elsez 'male]))

(chromosome "X" "Y")
(chromosome "X" "X")

;(define (factorial x)
;  (cond
;    [(equal? 0 (% x/2))]
;    [else (factorial (- x 1))]))

(define (factorial x)
  (cond
    [(= x 0) 1]
    [else (* x (factorial (- x 1)))]))

(factorial 5)
;(factorial 10)
;(factorial 15)
;(factorial 20)
;(factorial 25)
;(factorial 30)
;(factorial 40)
;(factorial 50)
;(factorial 1000)

(string=? "foo" "bar")
(string=? "bar" "bar")

(define I1 (rectangle 10 20 "solid" "red"))
(define I2 (rectangle 20 10 "solid" "blue"))

; question must produce boolean
(< (image-width I1)
   (image-width I2))

(if (< (image-width I1)
       (image-width I2))
    "tall"
    "wide")

(if (> (image-width I1)
       (image-width I2))
    "tall"
    "wide")

(if (< (image-width I1)
       (image-width I2))
    (image-width I2)
    (image-height I2))

(if (< (image-width I1)
       (image-width I2))
    (image-height I2)
    (image-width I2))