       IDENTIFICATION DIVISION.
       PROGRAM-ID. MainProgram.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NUM1 PIC 9(3) VALUE 20.
       01 NUM2 PIC 9(3) VALUE 20.
       01 RESULT PIC 9(4).

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           DISPLAY "Calling SubProgram to add numbers."
           CALL "AddNumbers" USING NUM1, NUM2, RESULT.
           DISPLAY "The result is: " RESULT.
           STOP RUN.
       END PROGRAM MainProgram.
