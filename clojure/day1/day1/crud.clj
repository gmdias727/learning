(ns crud)

(defn -main []
  (def pg-conn {
                :subprotocol "postgresql"
                :subname "//localhost:5432/mydb"
                :user "postgres"
                :password "postgres"
                })
  (println "Conectando ao banco de dados..."))

pg-conn ;; Conexão com o banco de dados

(defn list-users [users]
  (println "Listando usuários..."))