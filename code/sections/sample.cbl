       IDENTIFICATION DIVISION.
       PROGRAM-ID. SAMPLE.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
        
       01 MAX_NUMBER PIC 99.
       01 CURRENT_NUMBER PIC 99 VALUE 0.

       PROCEDURE DIVISION.
       MAIN SECTION.
           DISPLAY "Hello World".
           PERFORM GET_INPUT.
           PERFORM SHOW_INPUT MAX_NUMBER TIMES.
           STOP RUN.

       GET_INPUT SECTION.
           DISPLAY "Enter max number: ".
           ACCEPT MAX_NUMBER.

       SHOW_INPUT SECTION.
           DISPLAY "Hello World".
