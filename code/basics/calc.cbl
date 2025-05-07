           IDENTIFICATION DIVISION.
           PROGRAM-ID. calc.

           DATA DIVISION. 
           WORKING-STORAGE SECTION. 
           01 NUM1 PIC S9(5)V99.
           

           01 NUM2 PIC S9(5)V99.

           01 ANS PIC S9(5)V99.

           

           01 ANS_OUTPUT PIC +Z9.99.

           PROCEDURE DIVISION.
               DISPLAY "----Addition----".

               DISPLAY "Enter num1: ".
               ACCEPT NUM1.

               DISPLAY "Enter num2:".
               ACCEPT NUM2.

               ADD NUM1 TO NUM2 GIVING ANS.

               DISPLAY "Addition " NUM1 " with " NUM2 " gives " ANS.

               DISPLAY "----Subtraction----".

               SUBTRACT NUM1 FROM NUM2 GIVING ANS.

               MOVE ANS TO ANS_OUTPUT.

               DISPLAY "Sub " NUM1 " from " NUM2 " gives " ANS_OUTPUT.

      *        COMPUTE ANS = (NUM2 - NUM1) * 2.

               

               STOP RUN.
