           IDENTIFICATION DIVISION.
           PROGRAM-ID. hello.

           DATA DIVISION.
           WORKING-STORAGE SECTION.

           01 USERNAME PIC X(6).

           01 USER_ADDRESS.
              03 STREET_NAME PIC X(12).
              03 STREET_NUMBER PIC 9(3).

           PROCEDURE DIVISION.
               DISPLAY "----- Hello Program ----".

               DISPLAY "What's your name?".
               ACCEPT USERNAME.
               DISPLAY "Hello " USERNAME.

               DISPLAY "What's your street name?".
               ACCEPT STREET_NAME.
               DISPLAY "What's your street number?".
               ACCEPT STREET_NUMBER.

               DISPLAY "Your street number is: " STREET_NUMBER.
               DISPLAY "Your full adddress is: " USER_ADDRESS.
               STOP RUN.
