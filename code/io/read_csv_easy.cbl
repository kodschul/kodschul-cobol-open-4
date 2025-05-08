           IDENTIFICATION DIVISION.
           PROGRAM-ID. HELLO.
           
           ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
               SELECT GradesFile ASSIGN TO "grades.csv"
                   ORGANIZATION IS LINE SEQUENTIAL.

           DATA DIVISION.
           FILE SECTION.
           FD GradesFile.
           01 GradeLine PIC X(50).

           WORKING-STORAGE SECTION.
           01 EOF_REACHED PIC X VALUE "N".

           01 I PIC 9 VALUE 1.

           01 STUDENT_NAME PIC X(10).
           01 STUDENT_GRADE PIC 9.

           PROCEDURE DIVISION.
           MAIN SECTION.
               DISPLAY "----Grade Report-----".
               PERFORM READ_FILE.

               STOP RUN.


           READ_FILE SECTION.
               OPEN INPUT GradesFile
               READ GradesFile

               PERFORM UNTIL EOF_REACHED = "Y"
                   READ GradesFile
                       AT END
                           MOVE "Y" TO EOF_REACHED
                       NOT AT END
                            UNSTRING GradeLine DELIMITED BY ","
                               INTO STUDENT_NAME
                                    STUDENT_GRADE
                            END-UNSTRING

                            DISPLAY "Student: " STUDENT_NAME
                               "Grade: "  STUDENT_GRADE
               END-PERFORM.

               CLOSE GradesFile.





