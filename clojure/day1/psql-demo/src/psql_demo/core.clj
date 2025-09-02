(ns psql-demo.core
  (:require [clojure.java.jdbc :as jdbc] 
            [environ.core :refer [env]])
  (:gen-class))

(def db
  {:dbtype (env :db-type)
   :dbname (env :db-name)
   :host (env :db-host)
   :port  (env :db-port)
   :user (env :db-user)
   :password (env :db-password)})

(defn get-version []
  (jdbc/query db ["SELECT version()"]))

(defn create-users-table []
  (jdbc/execute! db
                 ["CREATE TABLE IF NOT EXISTS users (
                    id SERIAL PRIMARY KEY,
                    name VARCHAR(100) NOT NULL,
                    email VARCHAR(100) UNIQUE NOT NULL,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)"]))

(defn add-user [name email]
  (jdbc/insert! db :users {:name name
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
  (println "ENVIRON DEBUG:" (env))
  (println "Done.")
  (println get-version))
