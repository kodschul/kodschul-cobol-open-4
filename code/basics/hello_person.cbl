           IDENTIFICATION DIVISION.
           PROGRAM-ID. hello.

           DATA DIVISION. 
           WORKING-STORAGE SECTION. 

           01 USERNAME PIC X(2).

           01 NUMBER_X PIC 9.

       
           PROCEDURE DIVISION.
               DISPLAY "----Hello World----".

               DISPLAY "Enter your name: ".

               ACCEPT USERNAME.

               DISPLAY "Hello " USERNAME.

               STOP RUN.
