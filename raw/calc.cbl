               IDENTIFICATION DIVISION.
               PROGRAM-ID. calc.

               DATA DIVISION.
               WORKING-STORAGE SECTION.
               01 USER-INPUT1 PIC 9(3).
               01 USER-INPUT2 PIC 9(3).

               01 USER-ADDITION PIC 9(3).

               88 INPUT-ABOVE-10 VALUE USER-INPUT1 THRU 10.

                
               PROCEDURE DIVISION.
                   DISPLAY "Enter number 1".
                   ACCEPT USER-INPUT1.
                   DISPLAY "Enter number 2".
                   ACCEPT USER-INPUT2.


                   DISPLAY INPUT-ABOVE-10;

                   STOP RUN.

                   ADD USER-INPUT1 TO USER-INPUT2 GIVING USER-ADDITION.

                   DISPLAY "The sum of " USER-INPUT1 " and " USER-INPUT2 " is " USER-ADDITION.

                   DISPLAY USER-ADDITION.
                   STOP RUN.

               END PROGRAM calc.
