           IDENTIFICATION DIVISION.
           PROGRAM-ID. Printings.


           DATA DIVISION.
           WORKING-STORAGE SECTION.

           01 NUM1 PIC 9(7)V99  VALUE 10000.

           01 TEXT-1 PIC X(4) VALUE "ABCD".


           01 OUTPUT-1 PIC Z9,999.
           01 OUTPUT-2 PIC $$9,999.

           01 TEXT-1-OUTPUT PIC 9(10) BLANK ZERO.



           PROCEDURE DIVISION.
               DISPLAY "---- Printings ---".

               MOVE NUM1 TO OUTPUT-1.
      *         DISPLAY OUTPUT-1.


               MOVE " 100" TO TEXT-1-OUTPUT.
               DISPLAY TEXT-1-OUTPUT.





               STOP RUN.
