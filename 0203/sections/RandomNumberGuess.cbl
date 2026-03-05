           IDENTIFICATION DIVISION.
           PROGRAM-ID. NumberGuess.


           DATA DIVISION.
           WORKING-STORAGE SECTION.

           01 NUM_CORRECT PIC 9 VALUE 0.
           01 NUM_GUESS PIC 9.


           01 TIME_NOW PIC 9(7).
           01 RANDOM1 PIC 9(5)V9(9).
           01 RANDOM2 PIC 9(5)V9(9).

           PROCEDURE DIVISION.
           GENERATE_RANDOM_NUMBER SECTION.

               ACCEPT TIME_NOW FROM TIME.
               DISPLAY TIME_NOW.
               COMPUTE RANDOM1  = FUNCTION RANDOM(TIME_NOW).

                   ACCEPT TIME_NOW FROM TIME.
               COMPUTE RANDOM2=FUNCTION RANDOM(TIME_NOW * RANDOM1).

                   ACCEPT TIME_NOW FROM TIME.
               COMPUTE NUM_CORRECT= (FUNCTION RANDOM(RANDOM2 *  RANDOM1
               * TIME_NOW) * 10) + 1.

                   IF NUM_CORRECT EQUAL TO 0
                      MOVE 8 TO NUM_CORRECT
               END-IF.
                   DISPLAY NUM_CORRECT.
