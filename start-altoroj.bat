@echo off
rem Start AltoroJ (Tomcat 9 on port 8080)
set "JAVA_HOME=C:\Program Files\Java\jdk-26"
set "CATALINA_HOME=C:\Users\chuhe\apache-tomcat-9.0.91"
set "CATALINA_BASE=C:\Users\chuhe\apache-tomcat-9.0.91"
call "%CATALINA_HOME%\bin\catalina.bat" start
echo.
echo AltoroJ should be available at: http://localhost:8080/altoromutual/
