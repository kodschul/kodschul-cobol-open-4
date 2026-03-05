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

              PROCEDURE DIVISION.
              MAIN-SECTION.
                  PERFORM INIT-SECTION
                  PERFORM GAME-LOOP-SECTION
                  PERFORM END-SECTION
                  STOP RUN.

              INIT-SECTION.
                  DISPLAY "Welcome to the Number Guessing Game!"
                  DISPLAY "I'm thinking of a number between 1 and 10.".
                  PERFORM GENERATE_RANDOM_NUMBER.

              GAME-LOOP-SECTION.
                  PERFORM UNTIL Try-Counter = Max-Tries
                  OR Success-Flag = 'Y'
                      ADD 1 TO Try-Counter
                      DISPLAY "Try #"
                      Try-Counter  ": Enter your guess (1-10): "

                      ACCEPT User-Guess

                      IF User-Guess = Secret-Number
                          PERFORM SUCCESS-SECTION
                      ELSE
                          PERFORM HINT-SECTION
                      END-IF
                  END-PERFORM.

              SUCCESS-SECTION.
                  DISPLAY
                  " Congratulations! You guessed the number!".
                  MOVE 'Y' TO Success-Flag.

              HINT-SECTION.
                  IF Try-Counter < 1
                   IF User-Guess < Secret-Number
                       DISPLAY "Too low!"
                   ELSE
                       DISPLAY "Too high!"
                   END-IF
                  END-IF.

              END-SECTION.
                  IF Success-Flag NOT = 'Y'
                      DISPLAY " Sorry! The correct number was "
                      Secret-Number
                  END-IF
                  DISPLAY "Thanks for playing!".

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
