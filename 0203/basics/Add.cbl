           IDENTIFICATION DIVISION.
           PROGRAM-ID. add.


           DATA DIVISION.
           WORKING-STORAGE SECTION.

           01 NUM1 PIC S9(3)V99.
           01 NUM2 PIC S9(3)V99.
           01 ANS PIC S9(3)V99.

           PROCEDURE DIVISION.
               DISPLAY "---- Addition ---".


               DISPLAY "Enter num1: ".
               ACCEPT NUM1.

               DISPLAY "Enter num2: ".
               ACCEPT NUM2.



               ADD NUM1 TO NUM2 GIVING ANS.


               DISPLAY  NUM1 " + " NUM2 " = " ANS

               STOP RUN.
