           IDENTIFICATION DIVISION.
           PROGRAM-ID. SAMSectionCodePLE.
           DATA DIVISION.
           WORKING-STORAGE SECTION.

           01 MAX_NUM PIC 9(5).
           01 CURR_NUM PIC 9(5) VALUE 0.
               88 END_REACHED VALUE 50 32 3 6 10.

           PROCEDURE DIVISION.
           MAIN SECTION.
               PERFORM GET_MAX.
               PERFORM INC UNTIL CURR_NUM >= MAX_NUM OR END_REACHED.
               STOP RUN.

           GET_MAX SECTION.
               DISPLAY "Enter max number".
               ACCEPT MAX_NUM.
               EXIT.

           INC SECTION.
               ADD 10 TO CURR_NUM GIVING CURR_NUM.
               PERFORM SHOW_NUM.
               EXIT.

           SHOW_NUM SECTION.
               DISPLAY "Current Number is: " CURR_NUM.
               EXIT.
