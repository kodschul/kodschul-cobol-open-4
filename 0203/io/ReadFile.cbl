      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. READ_FILE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT HelloFile ASSIGN TO "names.txt"
                   ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD HelloFile.
       01 FileLine PIC X(10).
       WORKING-STORAGE SECTION.
       01 END_REACHED PIC 9 VALUE 0.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "----Read Program----"
            PERFORM READ_FILE.
            STOP RUN.

       READ_FILE SECTION.
           OPEN INPUT HelloFile.
           PERFORM UNTIL END_REACHED = 1
               READ HelloFile
                   AT END
                       MOVE 1 TO END_REACHED
                   NOT AT END
                       DISPLAY "Hello " FileLine
           END-PERFORM.
           CLOSE HelloFile.


       END PROGRAM READ_FILE.
