FROM mysql
COPY ./stydentDump.sql /docker-entrypoint-initdb.d/
