(ns main
  (:require [clojure.string :as str])
  (:gen-class))


;; As a clojure developer is discouraged to define custom types
(defn is_even [numbers]
  (filter #(zero? (mod % 2)) numbers))

(println "First List" (is_even [1 2 3 4 5 6 7 8 9 10]))
(println "Second List" (is_even [5]))
(println "Third List" (is_even [10]))
(println "Fourth List" (is_even [11]))
(println "Fifth List" (is_even [2,9,3]))
(println "Sixth List" (is_even [5,6]))

(def random_letters "abcdefghab")

(defn find-duplicates [s]
  (->> s
       (group-by identity)
       (filter (fn [[_ v]] (> (count v) 1)))
       (map first)))

(println "Seventh List" (find-duplicates random_letters))

;; (defn is-email-valid [s]
;;   (->> s
;;        (group-by identity)
;;        (filter (fn [[_ v]] (if (.contains (str v) "@") true false)))
;;        s))

(defn is-email-valid [s]
  (some #(.contains (str %) "@") s))

(defn extract-domain-better [email]
  (some->> email
           (#(str/split % #"@"))
           (drop 1)
           first))

(defn extract-domain-better2 [email]
  (some->> email
           ((partial str/split #"@") email)
           (drop 1)
           first))

(def domains-file (slurp "domains.txt"))

;; contains? checks if a key exists in a collection (like a map or set)
;; .contains checks if a string contains a substring

;; Implementation
(defn valid-domains? [domain domains-set]
  (contains? domains-set domain))

(defn extract-domain [email]
  (second (clojure.string/split email #"@")))

(defn load-domains [filename]
  (->> filename
       slurp ;; filename goes here at the end
       (str/split-lines)
       (map #(str/replace % #"," ""))
       (map str/trim)
       set))

(defn is-email-valid? [email domains-set]
  (boolean
   (some-> email
            extract-domain
            (valid-domains? domains-set))))

(def domains-set (load-domains "domains.txt"))

(println "Domains Set" domains-set)
;; (println "Is given email valid?" (is-email-valid? "gabrieldias7200@gmail.com" domains-set))
(println (extract-domain "gabrieldias7200@gmail.com"))
(println (is-email-valid? "gabrieldias7200@gmail.com" domains-set))

