;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname main) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(+ 3 4)

(sqr 3)

(sqrt 16)


;(+ sqr ((sqr 3) (sqr 4)))

(sqrt (+ (sqr 3) (sqr 4)))

(/ (* 2 3) (- 3 1))

(/ 3 (+ 6.2 -12 4))
(/ (+ -8 6.2) 3)
(/ (+ 4 6.2 -12) 3)

; Evaluation Steps
(+ 2(* 3 4)(- (+ 1 2) 3))
(+ 2 12 (- (+ 1 2) 3))
(+ 2 12 (- 3 3))
(+ 2 12)
8


"Ada"

"Apple"

(string-append "Ada" " " "Lovelace")
(string-append "Ada" "Lovelace")

; start at first and end just before the last
(substring "Caribou" 2 4)
;          "01[23]45678"

