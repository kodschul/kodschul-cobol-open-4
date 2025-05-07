               IDENTIFICATION DIVISION.
               PROGRAM-ID. program1.
               DATA DIVISION.
               WORKING-STORAGE SECTION.
               01 PROMPT-MSG PIC X(20) VALUE "Enter your name: ".       
               01 USER-INPUT PIC X(20).
               01 OUTPUT-MSG.
                   03 GREETING PIC X(6) VALUE "Hello ".
                   03 USER-NAME PIC X(20).

                
               PROCEDURE DIVISION.
               RUN-PROGRAM.
                   DISPLAY "Hello World this is a test!".
                   PERFORM MAIN-LOGIC.
                   STOP RUN.

               MAIN-LOGIC.
                   DISPLAY PROMPT-MSG.
                   ACCEPT USER-INPUT.
                   MOVE USER-INPUT TO USER-NAME.
                   DISPLAY USER-INPUT.
                   DISPLAY OUTPUT-MSG.
                   STOP RUN.

               END PROGRAM program1.
