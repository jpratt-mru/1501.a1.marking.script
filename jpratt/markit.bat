
rmdir /S /Q bin

javac -d bin -cp "tests;src;jars/*" tests/*.java src/*.java

java -jar .\jars\junit-platform-console-standalone-1.3.0-M1.jar --class-path "bin;tests;jars\assertj-core-3.13.2.jar;jars\client-combined-3.141.59.jar;jars\guava-25.0-jre.jar;jars\okio-1.14.0.jar;jars\okhttp-3.11.0.jar;jars\selenium-chrome-driver-3.141.59.jar;jars\commons-exec-1.3.jar" --scan-class-path --details tree
