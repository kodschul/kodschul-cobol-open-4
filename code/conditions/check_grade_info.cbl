           IDENTIFICATION DIVISION.
           PROGRAM-ID. check_grade.

           DATA DIVISION. 
           WORKING-STORAGE SECTION. 
^
           01 GRADE PIC 9.
               88 PASSED VALUE 1 THRU 4.

           PROCEDURE DIVISION.

               DISPLAY "----Grade Checker----".
               DISPLAY "Welche Note hattest du?: ".
               ACCEPT GRADE.
               DISPLAY "Note = "  GRADE.

               IF PASSED
                   DISPLAY "Bestanden!"
               ELSE 
                   DISPLAY "Durchgefallen!"
               END-IF.


               STOP RUN.

               EVALUATE GRADE
                   WHEN 1
                       DISPLAY "Super! Du hast mit 1.0 bestanden!"
                   WHEN 2
                       DISPLAY "Top! Du hast mit 2.0 bestanden!"
                   WHEN 4 THRU 9
                       DISPLAY  "Du bist durchgefallen Test!"
                   WHEN OTHER 
                       DISPLAY "Du hast bestanden!"
               END-EVALUATE

               STOP RUN.

               EVALUATE TRUE 
                   WHEN GRADE = 1
                       DISPLAY "Super! Du hast mit 1.0 bestanden!"
                   WHEN GRADE = 2
                       DISPLAY "Top! Du hast mit 2.0 bestanden!"
                   WHEN GRADE > 4
                       DISPLAY  "Du bist durchgefallen!"
                   WHEN OTHER 
                       DISPLAY "Du hast bestanden!"
               END-EVALUATE
               

               STOP RUN.

               IF GRADE = 1
                   DISPLAY "Super gemacht! Du hast mit 1.0 bestanden!"
               ELSE IF GRADE = 2
                   DISPLAY "Top! Du hast mit 2.0 bestanden!"
               ELSE IF GRADE > 4
                   DISPLAY "Du bist durchgefallen!"
               ELSE
                   DISPLAY "Du hast bestanden Herzlich Glueckwunsch!"

               END-IF.

