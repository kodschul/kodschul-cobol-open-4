           IDENTIFICATION DIVISION.
           PROGRAM-ID. add.

           DATA DIVISION. 
           WORKING-STORAGE SECTION. 
           01 NUM1 PIC S999 DISPLAY SIGN TRAILING SEPARATE CHARACTER.
           01 NUM2 PIC S999 DISPLAY SIGN TRAILING SEPARATE CHARACTER.
           01 ANS PIC S999 DISPLAY SIGN TRAILING SEPARATE CHARACTER.

           PROCEDURE DIVISION.
               DISPLAY "----Addition----".

               DISPLAY "Enter num1: ".
               ACCEPT NUM1.

               DISPLAY "Enter num2:".
               ACCEPT NUM2.

               ADD NUM1 TO NUM2 GIVING ANS.

               DISPLAY "Addition " NUM1 " with " NUM2 " gives " ANS.

               DISPLAY ANS.
               STOP RUN.
