:: first off: do all static analysis (checkstyle, pmd, cpd, and spotbugs) on the src dir contents only - no tests files!
rmdir /S /Q bin

javac -d bin -cp "src;jars/*" src/*.java

:: https://spotbugs.readthedocs.io/en/stable/running.html#executing-spotbugs
:: 
echo SPOTBUGS > testing-results.txt
call spotbugs-3.1.12\bin\spotbugs.bat -textui -sortByClass -low -effort:min -longBugCodes -auxclasspath jars -sourcepath src bin >> testing-results.txt


:: https://pmd.github.io/latest/pmd_userdocs_installation.html
:: if you want to leave out any specific files from pmd testing, you can put them in the rules xml file
:: For example, if you look at the current pmd xml file I have, there's an exclusion for one file done
:: like so: <exclude-pattern>.*/src/NullWebDriver.java</exclude-pattern>
::
echo PMD >> testing-results.txt
call pmd-bin-6.17.0\bin\pmd.bat -dir src -auxclasspath jars -R pmd-settings\1501_pmd_rules.xml -no-cache >> testing-results.txt

echo CPD >> testing-results.txt
call pmd-bin-6.17.0\bin\cpd.bat --minimum-tokens 50 --files src >> testing-results.txt


:: https://checkstyle.sourceforge.io/cmdline.html
::
echo CHECKSTYLE >> testing-results.txt
java -jar automated-testing-libs\checkstyle-8.23-all.jar -c 1501-checkstyle-rules.xml src/*.java >> testing-results.txt


:: extra step you haven't done yet: copy **my** tests directory over! (to avoid student tampering)
::

echo UNIT TESTS >> testing-results.txt
:: now run the unit tests
:: https://junit.org/junit5/docs/current/user-guide/#running-tests-console-launcher-options
::
:: javac -d bin -cp "tests;src;jars/*" tests/*.java src/*.java

:: java -jar .\jars\junit-platform-console-standalone-1.3.0-M1.jar --class-path "bin;tests;jars\assertj-core-3.13.2.jar;jars\client-combined-3.141.59.jar;jars\guava-25.0-jre.jar;jars\okio-1.14.0.jar;jars\okhttp-3.11.0.jar;jars\selenium-chrome-driver-3.141.59.jar;jars\commons-exec-1.3.jar" --scan-class-path --details=tree --disable-ansi-colors >> testing-results.txt
