              IDENTIFICATION DIVISION.
              PROGRAM-ID. SAMPLE3.
       
              DATA DIVISION.
              WORKING-STORAGE SECTION.
       
            01 CORRECT_PASSWORD PIC X(4) VALUE "TEST".
            01 INPUT_PASSWORD PIC X(4).
               88 PASSWORD_IS_CORRECT VALUE "TEST".
            01 TRIES PIC 9 VALUE 1. 
               88 MAX_TRIES_REACHED VALUE 4.

              PROCEDURE DIVISION.
              MAIN SECTION.
                   DISPLAY "-----Password----".
                   PERFORM GET_PASSWORD 
                   UNTIL PASSWORD_IS_CORRECT OR MAX_TRIES_REACHED .

                   IF NOT PASSWORD_IS_CORRECT
                       DISPLAY "Max tries reached! Access denied!"
                   ELSE 
                       PERFORM HOME
                   END-IF.
               
                   STOP RUN.
       
              GET_PASSWORD SECTION.
                  DISPLAY  "Tries: " TRIES " / 3 " "Enter password: ".
                  ACCEPT INPUT_PASSWORD.
                  ADD 1 TO TRIES.

              HOME  SECTION.
                  DISPLAY "Welcome home!".
           