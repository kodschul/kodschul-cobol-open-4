               IDENTIFICATION DIVISION.
               PROGRAM-ID. calc.

               DATA DIVISION.
               WORKING-STORAGE SECTION.
               01 USER-INPUT1 PIC 9(3).
                   88 INPUT-ABOVE-10 VALUE 11 THRU 999.
               01 USER-INPUT2 PIC 9(3).

               01 USER-ADDITION PIC 9(3).

               

                
               PROCEDURE DIVISION.
                   DISPLAY "Enter number 1".
                   ACCEPT USER-INPUT1.
                   DISPLAY "Enter number 2".
                   ACCEPT USER-INPUT2.

                   IF INPUT-ABOVE-10
                       DISPLAY "INPUT ABOVE 10".

                   EVALUATE TRUE
                       WHEN USER-INPUT1 > 5
                           DISPLAY USER-INPUT1 "  above 5 "
                       WHEN USER-INPUT1 > 3
                           DISPLAY USER-INPUT1 "  above 3 "
                       WHEN OTHER 
                           DISPLAY " no catch for " USER-INPUT1
                   END-EVALUATE.

                   STOP RUN.

                   ADD USER-INPUT1 TO USER-INPUT2 GIVING USER-ADDITION.

                   DISPLAY "The sum of " USER-INPUT1 " and " USER-INPUT2 " is " USER-ADDITION.

                   DISPLAY USER-ADDITION.
                   STOP RUN.

               END PROGRAM calc.
