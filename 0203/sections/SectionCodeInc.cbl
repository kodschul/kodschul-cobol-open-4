           IDENTIFICATION DIVISION.
           PROGRAM-ID. SAMSectionCodePLE.
           DATA DIVISION.
           WORKING-STORAGE SECTION.

           01 MAX_NUM PIC 99.
           01 CURR_NUM PIC 99 VALUE 0.

           PROCEDURE DIVISION.
           MAIN SECTION.
               PERFORM GET_MAX.
               PERFORM INC MAX_NUM TIMES.

               STOP RUN.

           GET_MAX SECTION.
               DISPLAY "Enter max times".
               ACCEPT MAX_NUM.
               EXIT.

           INC SECTION.
               ADD 1 TO CURR_NUM GIVING CURR_NUM.
               PERFORM SHOW_NUM.
               EXIT.

           SHOW_NUM SECTION.
               DISPLAY "Current Number is: " CURR_NUM.
               EXIT.
