           IDENTIFICATION DIVISION.
           PROGRAM-ID. hello.

           DATA DIVISION. 
           WORKING-STORAGE SECTION. 

           01 USERNAME PIC X(20).

           01 USER_ADDRESS.
               03 STREET PIC X(12).
               03 STREET_NUMBER PIC 999.

       
           PROCEDURE DIVISION.
               DISPLAY "----Address Program----".

               DISPLAY "Enter your address: ".

               ACCEPT USER_ADDRESS.

               DISPLAY "Street = " STREET.
               DISPLAY "Street Nr. = " STREET_NUMBER.

      *         DISPLAY "Enter your street: ".

      *         ACCEPT STREET.


      *         DISPLAY "Enter your street number: ".

      *         ACCEPT STREET_NUMBER.

               DISPLAY "Your Address is: " USER_ADDRESS.

               STOP RUN.
