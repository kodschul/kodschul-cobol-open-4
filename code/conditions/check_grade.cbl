           IDENTIFICATION DIVISION.
           PROGRAM-ID. check_grade.

           DATA DIVISION. 
           WORKING-STORAGE SECTION. 
^
           01 GRADE PIC 9.

           PROCEDURE DIVISION.

               DISPLAY "----Grade Checker----".

               DISPLAY "Welche Note hattest du?: ".

               ACCEPT GRADE.

               DISPLAY "Note = "  GRADE.

               IF GRADE > 4
                   DISPLAY "Du bist durchgefallen!"
               ELSE
                   DISPLAY "Du hast bestanden Herzlich Glueckwunsch!"

               END-IF.

