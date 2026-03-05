           IDENTIFICATION DIVISION.
           PROGRAM-ID. SAMSectionCodePLE.

           DATA DIVISION.
           WORKING-STORAGE SECTION.


           01 NUM PIC 99.

           PROCEDURE DIVISION.
           MAIN SECTION.
               PERFORM GET_INPUT.
               PERFORM SHOW_INPUT NUM TIMES.
               GOBACK.


           GET_INPUT SECTION.
               DISPLAY "Enter a number".
               ACCEPT NUM.
               EXIT.


           SHOW_INPUT SECTION.
               DISPLAY "Number is: " NUM.
               EXIT.
