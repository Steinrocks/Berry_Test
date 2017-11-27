FROM tomcat

Run apt-get update && apt-get install -y elinks

Run elinks hotspot
RUN stop service elinks

RUN curl "https://experience.jupitercloud.de/nexus/service/local/artifact/maven/redirect?r=snapshots&g=Berry1&a=fischkudder&e=war&v=LATEST" -o /usr/local/tomcat/webapps/HelloWorld.war
RUN service tomcat8 restart

VOLUME ["//usr/local/tomcat/webapps"]

EXPOSE 8080
