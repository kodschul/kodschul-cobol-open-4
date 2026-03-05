           IDENTIFICATION DIVISION.
           PROGRAM-ID. NumberGuess.


           DATA DIVISION.
           WORKING-STORAGE SECTION.

           01 NUM_CORRECT PIC 9 VALUE 8.
           01 NUM_GUESS PIC 9.

           PROCEDURE DIVISION.
               DISPLAY "---- Guess Number ---".

               ACCEPT NUM_GUESS.

               IF NUM_GUESS  EQUAL TO NUM_CORRECT
                   DISPLAY "You won!"
               ELSE
                   IF NUM_GUESS > NUM_CORRECT
                       DISPLAY "Too high!"
                   ELSE
                       DISPLAY "Too low"
               END-IF.


               STOP RUN.
