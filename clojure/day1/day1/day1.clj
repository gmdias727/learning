(ns day1)

(str "Hello" " " "World!")
(println (str "Hello" " " "World!")) ; println is for humans

(def items ["Gabriel" :a 1 (list :b 2) \c {:d 4 } #{5 6 7}])
(println items)

(def items2 [hello :a 1 (:b 2) \c {:d 4} #{5 6 7}])
(println items2)