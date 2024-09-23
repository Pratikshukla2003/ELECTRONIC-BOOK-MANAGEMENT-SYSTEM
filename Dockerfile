FROM tomcat:9.0-jdk20
COPY E-book.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
