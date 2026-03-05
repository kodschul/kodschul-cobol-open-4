           IDENTIFICATION DIVISION.
           PROGRAM-ID. NumberGuess.


           DATA DIVISION.
           WORKING-STORAGE SECTION.

           01 NUM PIC 9V99.
               88 PASSED VALUE 1.0 THRU 4.24.
               88 FAILED VALUE 4.25 THRU 6.0.

           01 INPUT_TEXT PIC X(3).

           PROCEDURE DIVISION.
               DISPLAY "---- Number TYPE ---".

               DISPLAY "Enter grade: ".
               ACCEPT NUM.

               DISPLAY NUM.


               IF PASSED
                    DISPLAY "Welcome done, you passed!"
               ELSE IF FAILED
                   DISPLAY "you failed!"
               ELSE
                   DISPLAY "enter a valid grade, please!"
               END-IF.




               DISPLAY INPUT_TEXT.


               STOP RUN.
