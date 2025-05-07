           IDENTIFICATION DIVISION.
           PROGRAM-ID. add.

           DATA DIVISION. 
           WORKING-STORAGE SECTION. 
           01 NUM1 PIC 9(5)V99.
           01 NUM2 PIC 9(5)V99.
           01 ANS PIC 9(5)V99.

           PROCEDURE DIVISION.
               DISPLAY "----Addition----".

               DISPLAY "Enter num1: ".
               ACCEPT NUM1.

               DISPLAY "Enter num2:".
               ACCEPT NUM2.

               ADD NUM1 TO NUM2 GIVING ANS.

               DISPLAY "Addition " NUM1 " with " NUM2 " gives " ANS.

               STOP RUN.
