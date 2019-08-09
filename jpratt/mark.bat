@ECHO off
rmdir student-results /s /q
mkdir student-results
FOR /D %%G in ("student-solutions\*") DO (

    ECHO MARKING %%~dpG%%~nxG

    mkdir student-results\%%~nxG >NUL

    cd testing-root

    rmdir solution /s /q
    robocopy /E  %%~dpG%%~nxG solution /NFL /NDL /NJH /NJS /nc /ns /np
    
    rmdir feature_results /s /q
    rmdir style_results /s /q
    CALL testit.bat
    
    robocopy /E  feature_results ..\student-results\%%~nxG\feature_results /NFL /NDL /NJH /NJS /nc /ns /np
    robocopy /E  style_results ..\student-results\%%~nxG\style_results /NFL /NDL /NJH /NJS /nc /ns /np

    cd ..
)

