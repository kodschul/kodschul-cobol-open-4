              IDENTIFICATION DIVISION.
              PROGRAM-ID. NumberGuessGameWithSections.

              DATA DIVISION.
              WORKING-STORAGE SECTION.
              01  Random-Float       PIC 9(5)V9(5).
              01  Secret-Number      PIC 99.
              01  User-Guess         PIC 99.
              01  Try-Counter        PIC 9 VALUE 0.
              01  Max-Tries          PIC 9 VALUE 3.
              01  Success-Flag       PIC X VALUE 'N'.

           01 TIME_NOW PIC 9(7).
           01 RANDOM1 PIC 9(5)V9(9).
           01 RANDOM2 PIC 9(5)V9(9).

           01 LEVEL PIC 9 VALUE 1.

              PROCEDURE DIVISION.
              MAIN-SECTION.
                  PERFORM INIT-SECTION.
                  PERFORM ROUND UNTIL LEVEL >10.
                  DISPLAY "Thanks for playing!".
                  STOP RUN.

              INIT-SECTION.
                  DISPLAY "Welcome to the Number Guessing Game!"
                  DISPLAY "I'm thinking of a number between 1 and 10.".

              ROUND SECTION.
                  DISPLAY "-----LEVEL-" LEVEL "-----"
                  MOVE 0 TO Try-Counter.
                  MOVE "N" TO Success-Flag.
                  PERFORM GENERATE_RANDOM_NUMBER.
                  PERFORM GUESS.
                  PERFORM RESULT.

                  ADD 1 TO LEVEL.
                  EXIT.

               GUESS SECTION.
                  PERFORM UNTIL Try-Counter = Max-Tries
                  OR Success-Flag = 'Y'
                      ADD 1 TO Try-Counter
                      DISPLAY "Try #"
                      Try-Counter  ": Enter your guess (1-10): "

                      ACCEPT User-Guess



                      IF User-Guess = Secret-Number
                          PERFORM SUCCESS
                      ELSE IF User-Guess = 0
                          STOP RUN
                      ELSE
                          PERFORM HINT
                      END-IF
                  END-PERFORM.

              SUCCESS SECTION.
                  DISPLAY
                  " Congratulations! You guessed the number!".
                  MOVE 'Y' TO Success-Flag.

              HINT SECTION.
                  IF Try-Counter < 1
                   IF User-Guess < Secret-Number
                       DISPLAY "Too low!"
                   ELSE
                       DISPLAY "Too high!"
                   END-IF
                  END-IF.

              RESULT SECTION.
                  IF Success-Flag NOT = 'Y'
                      DISPLAY " Sorry! The correct number was "
                      Secret-Number
                  END-IF.

           GENERATE_RANDOM_NUMBER SECTION.

               ACCEPT TIME_NOW FROM TIME.
               DISPLAY TIME_NOW.
               COMPUTE RANDOM1  = FUNCTION RANDOM(TIME_NOW).

               ACCEPT TIME_NOW FROM TIME.
               COMPUTE RANDOM2=FUNCTION RANDOM(TIME_NOW * RANDOM1).

               ACCEPT TIME_NOW FROM TIME.
               COMPUTE Secret-Number= (FUNCTION RANDOM(RANDOM2 *
               RANDOM1 * TIME_NOW) * 10) + 1.

               IF Secret-Number EQUAL TO 0
                      MOVE 8 TO Secret-Number
               END-IF.
                   DISPLAY Secret-Number.
