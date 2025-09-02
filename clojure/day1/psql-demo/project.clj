(defproject psql-demo "0.1.0-SNAPSHOT"
  :description "An attempt to make a simple backend in clojure"
  :url "http://example.com/FIXME"
  :license {:name "EPL-2.0 OR GPL-2.0-or-later WITH Classpath-exception-2.0"
            :url "https://www.eclipse.org/legal/epl-2.0/"}
  :dependencies [[org.clojure/clojure "1.11.1"]
                 [org.clojure/java.jdbc "0.7.12"]
                 [org.postgresql/postgresql "42.6.0"]
                 [environ "1.2.0"]]
  :main ^:skip-aot psql-demo.core
  :target-path " target/%s "
  :profiles
  {:dev {:env {:db-type "postgresql"
               :db-name "mydb"
               :db-host "dev"
               :db-port "5432"
               :db-user "dev"
               :db-password "dev"}}
  :uberjar {:aot :all
             :jvm-opts [" -Dclojure.compiler.direct-linking=true "]}})
