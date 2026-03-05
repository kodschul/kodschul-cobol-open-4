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

           SELECT NumsOutFile ASSIGN TO "numbers_results.txt"
                   ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD NumsFile.
       01 Numline PIC X(10).

       FD NumsOutFile.
       01 NumOutline.
           02 Outline_HEADER PIC X(10).
           02 Outline_CONTENT PIC X(20).

       WORKING-STORAGE SECTION.
       01 END_REACHED PIC 9 VALUE 0.
       01 TOTAL_SUM PIC 9(3).
       01 CURR_NUM PIC 9(3).
       01 LINE_INDEX PIC 9(3).
       01 AVG_NUM PIC 9(3)V99.

       01 AVG_STR PIC Z99V,99.

       01 MIN_NUM PIC 9(3) VALUE 999.
       01 MAX_NUM PIC 9(3).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "----Read Program----"
            PERFORM ADD_NUM.
            PERFORM GENERATE_RESULTS.
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

       GENERATE_RESULTS SECTION.
           OPEN OUTPUT NumsOutFile.
           MOVE "Sum:" TO Outline_HEADER.
           MOVE TOTAL_SUM TO OUtline_CONTENT.
           WRITE NumOutline.

           COMPUTE AVG_NUM = TOTAL_SUM / LINE_INDEX.
           MOVE "Avg:" TO Outline_HEADER.
           MOVE AVG_NUM TO AVG_STR.
           MOVE AVG_STR TO Outline_CONTENT.
           Write NumOutline.

           MOVE "Total:" TO Outline_HEADER.
           MOVE LINE_INDEX TO OUtline_CONTENT.
           WRITE NumOutline.

           MOVE "MIN:" TO Outline_HEADER.
           MOVE MIN_NUM TO OUtline_CONTENT.
           WRITE NumOutline.

           MOVE "MAX:" TO Outline_HEADER.
           MOVE MAX_NUM TO OUtline_CONTENT.
           WRITE NumOutline.

           CLOSE NumsOutFile.

       END PROGRAM ADD_NUM_PROG.
