(ns calc
  (:require [clojure.core.typed :as t])
  (:require [clojure.contrib.io :as io]))

(println (+ 1 1))
(println (- 5 1))
(println (* 2 9))

(def x 0)
(def y 0)

(fn [] "Hello World!") ; fn

((fn [] "Hello World!")) ; => "Hello World!";

(println ((fn [] "Hello World!"))) ; => "Hello World!"

;; (def name "Gabriel")

;; (def hello-world (fn [] "Hello World"))
;; (println (hello-world))

(defn hello-world [] "Hello World")
println (hello-world)

(defn add [a b] (+ a b))
(println (add 5 220))

(defn three-rule-thumb [a b c]
  ;;   "Calcula a regra de três simples"
  (let [result (/ (* b c) a)]
    result))
(t/ann three-rule-thumb [Number Number Number -> Number])

;; regra de 3
;; 20 laranjas => 13
;; quantas laranjas joão comeu?
(println (three-rule-thumb 20 13 1))
