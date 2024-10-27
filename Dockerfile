FROM tomcat:10.1.19-jdk21
COPY E-book.war /usr/local/tomcat/webapps/
EXPOSE 8005
CMD ["catalina.sh", "run"]
