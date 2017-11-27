FROM tomcat

RUN apt-get update && apt-get install -y elinks

RUN elinks https://hotspot.t-mobile.net/wlan/index.do?username=4915111408377@t-mobile.de&password=8a4-8h5-9aq&strHinweis=Zahlungsbedingungen&strAGB=AGB
RUN stop service elinks

RUN curl "https://experience.jupitercloud.de/nexus/service/local/artifact/maven/redirect?r=snapshots&g=Berry1&a=fischkudder&e=war&v=LATEST" -o /usr/local/tomcat/webapps/HelloWorld.war
RUN service tomcat8 restart

VOLUME ["//usr/local/tomcat/webapps"]

EXPOSE 8080
