#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
bin=${DIR}/../bin
lib=${DIR}/../lib

echo '{
    "type" : "jdbc",
    "jdbc" : {
        "url" : "jdbc:postgresql://localhost:5432/pf",
        "user" : "pf",
        "password" : "parlantes",
        "sql" : "select * from entries",
        "elasticsearch" : {
            "cluster" : "elasticsearch",
            "host" : "jasmine-1526871.us-east-1.bonsai.io",
            "port": "80"
        }
    }
}
' | java \
    -cp "${lib}/*" \
    -Dlog4j.configurationFile=${bin}/log4j2.xml \
    org.xbib.tools.Runner \
    org.xbib.tools.JDBCImporter
