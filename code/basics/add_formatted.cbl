           IDENTIFICATION DIVISION.
           PROGRAM-ID. add.

           DATA DIVISION. 
           WORKING-STORAGE SECTION. 
           01 NUM1 PIC 9(7)V99.
           01 NUM2 PIC 9(3)V99.
           01 ANS PIC 9(3)V99.

      *     01 ANS_OUTPUT PIC ZZ9V99.

           01 ANS_OUTPUT PIC $$$,$$$,999.

           PROCEDURE DIVISION.
               DISPLAY "----Addition----".

               DISPLAY "Enter num1: ".
               ACCEPT NUM1.
               DISPLAY NUM1.
               STOP RUN.


               DISPLAY "Enter num2:".
               ACCEPT NUM2.

               ADD NUM1 TO NUM2 GIVING ANS.

               MOVE ANS TO ANS_OUTPUT.

               DISPLAY "Addition: " ANS_OUTPUT.

               STOP RUN.
