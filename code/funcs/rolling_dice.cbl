           IDENTIFICATION DIVISION. 
           PROGRAM-ID. ROLLING_DICE.

           DATA DIVISION.
           WORKING-STORAGE SECTION.
           
           01 RANDOM-VALUE PIC 9V9999.
           01 DICE_NUMBER PIC 9.

           01 TIME-STR     PIC X(8).
           01 TIME_NOW PIC 9(6).

           PROCEDURE DIVISION.
           MAIN SECTION.
               DISPLAY "-----Rolling Dice----".
               PERFORM ROLL_DICE 3 TIMES.

           ROLL_DICE SECTION.
               ACCEPT TIME-STR FROM TIME.
               DISPLAY TIME-STR.
               MOVE FUNCTION NUMVAL(TIME-STR(3:6)) TO TIME_NOW.
               MOVE FUNCTION RANDOM(TIME_NOW) TO RANDOM-VALUE.

               DISPLAY RANDOM-VALUE.

               COMPUTE DICE_NUMBER = (RANDOM-VALUE * 6) + 1

               DISPLAY " Player 1: got a " DICE_NUMBER.
