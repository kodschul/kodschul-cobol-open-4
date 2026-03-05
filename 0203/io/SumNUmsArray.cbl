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
       01 I PIC 9(3).
       01 AVG PIC 9(3)V99.

       01 MIN_NUM PIC 9(3) VALUE 999.
       01 MAX_NUM PIC 9(3).


       01 NUMS_ARRAY.
           02 NUMS_COUNT PIC 9(3).
           02 NUMS OCCURS 10 TIMES.
               03 NUMS_VALUE PIC 9(3).

       01 BASKET.
           02 ITEMS_COUNT PIC 9(3).
           02 ITEMS OCCURS 100 TIMES.
               03 ITEM_QTY PIC 9(3).
               03 ITEM_NAME PIC 9(3).
               03 ITEM_UNIT_PRICE PIC 9(3)V99.
               03 ITEM_NETTO PIC 9(3)V99.
               03 ITEM_BRUTTO PIC 9(3)V99.


       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "----Read Program----"
            PERFORM READ_NUM.
            PERFORM ADD_NUM.
            STOP RUN.

       READ_NUM SECTION.
           OPEN INPUT NumsFile.
           PERFORM UNTIL END_REACHED = 1
               READ NumsFile
                   AT END
                       MOVE 1 TO END_REACHED
                   NOT AT END
                       ADD 1 TO NUMS_COUNT
                       MOVE Numline TO NUMS_VALUE(NUMS_COUNT)

           END-PERFORM.
           CLOSE NumsFile.

       ADD_NUM SECTION.
           MOVE 0 TO I.

           PERFORM VARYING I FROM 1 BY 1
           UNTIL I > NUMS_COUNT

           MOVE NUMS_VALUE(I) TO CURR_NUM

           IF CURR_NUM > MAX_NUM
               MOVE CURR_NUM TO MAX_NUM
           END-IF

           IF CURR_NUM < MIN_NUM
               MOVE CURR_NUM TO MIN_NUM
           END-IF



           DISPLAY TOTAL_SUM " + " CURR_NUM
           ADD CURR_NUM TO TOTAL_SUM


           END-PERFORM

            DISPLAY "Sum: " TOTAL_SUM.
            COMPUTE AVG = TOTAL_SUM / NUMS_COUNT.

            DISPLAY "Avg: " AVG.
            DISPLAY "Total: " NUMS_COUNT.
            DISPLAY "Min: " MIN_NUM.
            DISPLAY "Max: " MAX_NUM.

       END PROGRAM ADD_NUM_PROG.
