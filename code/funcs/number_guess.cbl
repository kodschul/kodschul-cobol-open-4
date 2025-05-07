              IDENTIFICATION DIVISION.
              PROGRAM-ID. NumberGuessGameWithSections.
       
              DATA DIVISION.
              WORKING-STORAGE SECTION.
              01  Random-Float       USAGE FLOAT.
              01  Secret-Number      PIC 99.
              01  User-Guess         PIC 99.
              01  Try-Counter        PIC 9 VALUE 0.
              01  Max-Tries          PIC 9 VALUE 3.
              01  Success-Flag       PIC X VALUE 'N'.
       
              PROCEDURE DIVISION.
              MAIN-SECTION.
                  PERFORM INIT-SECTION
                  PERFORM GAME-LOOP-SECTION
                  PERFORM END-SECTION
                  STOP RUN.
       
              INIT-SECTION.
                  DISPLAY "Welcome to the Number Guessing Game!"
                  MOVE FUNCTION RANDOM TO Random-Float
                  COMPUTE Secret-Number = (Random-Float * 10) + 1
                  DISPLAY "I'm thinking of a number between 1 and 10.".
       
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
                  "🎉 Congratulations! You guessed the number!".
                  MOVE 'Y' TO Success-Flag.
       
              HINT-SECTION.
                  IF Try-Counter < 2
                   IF User-Guess < Secret-Number
                       DISPLAY "Too low!"
                   ELSE
                       DISPLAY "Too high!"
                   END-IF
                  END-IF.
       
              END-SECTION.
                  IF Success-Flag NOT = 'Y'
                      DISPLAY "❌ Sorry! The correct number was " 
                      Secret-Number
                  END-IF
                  DISPLAY "Thanks for playing!".
       