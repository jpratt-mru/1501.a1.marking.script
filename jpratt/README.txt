--
-- Jordan Pratt
-- 2017.SEP.06
--

Instructions

1. Create a directory where you wish to do your marking. Copy
the mark.bat file into it.

2. In your marking directory, create a directory called student-solutions and 
copy the BlueJ project directories of all students into it.
NOTE: these student solution directories should NOT HAVE ANY SPACES IN THEIR NAME

3. Copy the testing-root directory from the SOLUTION FRAMEWORK into this directory. (This will
contain the full set of features that you want to use for marking.)

4. Copy the features and step_definitions folders used for marking into the testing-root folder.

After these first 3 steps, you should have the following in your marking directory:

* a directory called student-solutions with sub-directories consisting of the students' project directories
* a directory called testing-root, from the solution of the assignment being marked
* mark.bat

4. Open a command prompt in the marking directory and run mark.bat > mark.txt.

After completion, you should have a directory called student-results, filled with subdirectories
for each student bluej directory, with the feature and sonarlint reports
in each.



NOTES TO SELF [Aug 10, 2019]
- since we don't want to style/bug check tests, you'll want to copy over src files, do code
analysis on them (and Spotbugs will require a javac here), and THEN do the unit testing