#!/bin/bash
cd /home/ubuntu/target 
export PATH=$PATH:/home/ubuntu/target/agendaAcademica.jar
java -jar agendaAcademica.jar --server.port=8080