           IDENTIFICATION DIVISION.
           PROGRAM-ID. hello.

           DATA DIVISION.
           WORKING-STORAGE SECTION.

           01 USERNAME PIC X(6).

           PROCEDURE DIVISION.
               DISPLAY "----- Hello Program ----".

               DISPLAY "What's your name?".

               ACCEPT USERNAME.

               DISPLAY "Hello " USERNAME.


               STOP RUN.
