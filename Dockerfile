FROM tomcat

RUN apt-get update && apt-get install -y elinks nano

RUN elinks https://hotspot.t-mobile.net/wlan/index.do?username=4915111408377@t-mobile.de&password=8a4-8h5-9aq&strHinweis=Zahlungsbedingungen&strAGB=AGB

RUN curl "https://experience.jupitercloud.de/nexus/service/local/artifact/maven/redirect?r=snapshots&g=Berry1&a=fischkudder&e=war&v=LATEST" \
          -o /usr/local/tomcat/webapps/HelloWorld.war

RUN /usr/local/tomcat/shutdown.sh
RUN /usr/local/tomcat/startup.sh    

VOLUME ["/usr/local/tomcat/webapps"]

EXPOSE 8080
