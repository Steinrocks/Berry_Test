FROM tomcat

RUN curl "https://experience.jupitercloud.de/nexus/service/local/artifact/maven/redirect?r=snapshots&g=Berry1&a=fischkudder&e=war&v=LATEST" -o /usr/local/tomcat/webapps/HelloWorld.war
RUN service tomcat8 restart

EXPOSE 8080