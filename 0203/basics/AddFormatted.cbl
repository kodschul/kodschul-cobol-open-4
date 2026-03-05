           IDENTIFICATION DIVISION.
           PROGRAM-ID. add_formatted.


           DATA DIVISION.
           WORKING-STORAGE SECTION.

           01 NUM1 PIC S9(4).
           01 NUM2 PIC S9(4).
           01 ANS PIC S9(4).

           01 ANS_OUTPUT PIC -ZZ9V,B99.

           PROCEDURE DIVISION.
               DISPLAY "---- Addition ---".

               DISPLAY "Enter num1: ".
               ACCEPT NUM1.

               DISPLAY "Enter num2: ".
               ACCEPT NUM2.


      *         ADD NUM1 TO NUM2 GIVING ANS.

               MOVE ANS TO ANS_OUTPUT.
               DISPLAY  NUM1 " + " NUM2 " = " ANS_OUTPUT.

               DISPLAY "---- Subtraction ---".

      *        SUBTRACT NUM2 FROM NUM1 GIVING ANS.
               COMPUTE ANS = NUM1 - NUM2.
               MOVE ANS TO ANS_OUTPUT.
               DISPLAY  NUM1 " - " NUM2 " = " ANS_OUTPUT.



               DISPLAY "---- Mean ---".
               COMPUTE ANS ROUNDED = (NUM1 + NUM2) / 2.
               MOVE ANS TO ANS_OUTPUT.
               DISPLAY   " Mean :" ANS_OUTPUT.


               STOP RUN.
