      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ADD_NUM_PROG.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT NumsFile ASSIGN TO "numbers.txt"
                   ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD NumsFile.
       01 Numline PIC X(10).

       WORKING-STORAGE SECTION.
       01 END_REACHED PIC 9 VALUE 0.
       01 TOTAL_SUM PIC 9(3).
       01 CURR_NUM PIC 9(3).
       01 LINE_INDEX PIC 9(3).
       01 AVG PIC 9(3)V99.

       01 MIN_NUM PIC 9(3) VALUE 999.
       01 MAX_NUM PIC 9(3).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "----Read Program----"
            PERFORM ADD_NUM.
            STOP RUN.

       ADD_NUM SECTION.
           OPEN INPUT NumsFile.
           PERFORM UNTIL END_REACHED = 1
               READ NumsFile
                   AT END
                       MOVE 1 TO END_REACHED
                   NOT AT END

                       ADD 1 TO LINE_INDEX
                       MOVE Numline TO CURR_NUM


                       IF CURR_NUM > MAX_NUM
                           MOVE CURR_NUM TO MAX_NUM

                        ELSE
                            IF CURR_NUM < MIN_NUM
                           MOVE CURR_NUM TO MIN_NUM
                       END-IF
                       END-IF

                       DISPLAY TOTAL_SUM " + " Numline
                       ADD CURR_NUM TO TOTAL_SUM


           END-PERFORM.
           CLOSE NumsFile.


            DISPLAY "Sum: " TOTAL_SUM.
            COMPUTE AVG = TOTAL_SUM / LINE_INDEX.

            DISPLAY "Avg: " AVG.
            DISPLAY "Total: " LINE_INDEX.
            DISPLAY "Min: " MIN_NUM.
            DISPLAY "Max: " MAX_NUM.

       END PROGRAM ADD_NUM_PROG.
