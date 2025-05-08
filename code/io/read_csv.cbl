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

           01 GRADE_REPORT.
               02 GRADE_SIZE PIC 9.
               02 GRADES OCCURS 5 TIMES.
                   03 STUDENT_NAME PIC X(10).
                   03 STUDENT_GRADE PIC 9.

           01 I PIC 9 VALUE 1.

           PROCEDURE DIVISION.
           MAIN SECTION.
               DISPLAY "----Grade Report-----".
               PERFORM READ_FILE.

               PERFORM VARYING I FROM 1 BY 1 UNTIL I > GRADE_SIZE

                    DISPLAY "Student: " STUDENT_NAME(I)
                    "Grade: "  STUDENT_GRADE(I)

               END-PERFORM


               STOP RUN.


           READ_FILE SECTION.
               OPEN INPUT GradesFile
               READ GradesFile

               PERFORM UNTIL EOF_REACHED = "Y"
                   READ GradesFile
                       AT END
                           MOVE "Y" TO EOF_REACHED
                       NOT AT END
                           ADD 1 TO GRADE_SIZE
                            UNSTRING GradeLine DELIMITED BY ","
                               INTO STUDENT_NAME(GRADE_SIZE)
                                    STUDENT_GRADE(GRADE_SIZE)
                            END-UNSTRING
               END-PERFORM.

               CLOSE GradesFile.





