           IDENTIFICATION DIVISION.
           PROGRAM-ID. GradeChecker.


           DATA DIVISION.
           WORKING-STORAGE SECTION.

           01 NUM PIC 9V99.
               88 PASSED VALUE 1.0 THRU 4.24.
               88 FAILED VALUE 4.25 THRU 6.0.


           PROCEDURE DIVISION.
               DISPLAY "---- Grade Checker ---".

               DISPLAY "Enter grade: ".
               ACCEPT NUM.

               DISPLAY NUM.


               EVALUATE NUM

                   WHEN 1.0 THRU 1.99
                       DISPLAY "Sehr gut!"
                   WHEN 2.0 THRU 2.99
                       DISPLAY "Gut!"

                   WHEN 3.0 THRU 3.99
                       DISPLAY "befriedigend"

                   WHEN 4.0 THRU 4.24
                       DISPLAY "ausreichend"

                   WHEN 4.25 THRU 6.0
                       DISPLAY "nicht bestanden"

                   WHEN OTHER
                       DISPLAY "Note nicht valid!"

               END-EVALUATE



               STOP RUN.
