      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. READ_FILE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT GradesFile ASSIGN TO "grades.csv"
                   ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD GradesFile.
       01 FileLine PIC X(14).
       WORKING-STORAGE SECTION.
       01 END_REACHED PIC 9 VALUE 0.

       01 USER_GRADE.
           02 USER_NAME PIC X(10).
           02 USER_GRADE_NUM PIC 9.

       01 LINE_INDEX PIC 99.


       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "----Read Program----"
            PERFORM READ_FILE.
            STOP RUN.

       READ_FILE SECTION.
           OPEN INPUT GradesFile.

           PERFORM UNTIL END_REACHED = 1
               READ GradesFile
                   AT END
                       MOVE 1 TO END_REACHED


                   NOT AT END

                       ADD 1 TO LINE_INDEX

                       IF LINE_INDEX > 1


                       UNSTRING FileLine DELIMITED BY ","
                       INTO
                           USER_NAME
                           USER_GRADE_NUM
                       END-UNSTRING

                       DISPLAY "Name: " USER_NAME
                       DISPLAY "Grade: " USER_GRADE_NUM
                       END-IF


           END-PERFORM.

           CLOSE GradesFile.


       END PROGRAM READ_FILE.
