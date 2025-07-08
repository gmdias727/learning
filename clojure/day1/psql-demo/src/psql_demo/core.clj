(ns psql-demo.core
  (:require [clojure.java.jdbc :as jdbc])
  (:gen-class))

(def db-spec
  {:dbtype "postgresql"
   :dbname "dev"
   :host "localhost"
   :port 5432
   :user "dev"
   :password "dev"})

(defn get-version []
  (jdbc/query db-spec ["SELECT version()"]))

(defn create-users-table []
  (jdbc/execute! db-spec
                 ["CREATE TABLE IF NOT EXISTS users (
                    id SERIAL PRIMARY KEY,
                    name VARCHAR(100) NOT NULL,
                    email VARCHAR(100) UNIQUE NOT NULL,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)"]))

(defn add-user [name email]
  (jdbc/insert! db-spec :users {:name name
                                 :email email}))

(defn tables []
  (create-users-table))
tables

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (println "I don't do a whole lot ... yet.")
  (println "Connecting to PostgreSQL database...")
  (println "Database version:")
  (let [version (first (get-version))]
    (println (:version version)))
  (println "Done.")
  (println get-version))
