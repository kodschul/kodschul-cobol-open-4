           IDENTIFICATION DIVISION.
           PROGRAM-ID. HELLO.
           
           ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
               SELECT NameListFile ASSIGN TO "names.txt"
                   ORGANIZATION IS LINE SEQUENTIAL.
               SELECT WriteNameListFile ASSIGN TO "names_out.txt"
                   ORGANIZATION IS LINE SEQUENTIAL.

           DATA DIVISION.
           FILE SECTION.
           FD NameListFile.
           01 NameLine PIC X(20).

           FD WriteNameListFile.
           01 WriteNameLine PIC X(50).
           WORKING-STORAGE SECTION.
           01 EOF_REACHED PIC X VALUE "N".
           01 OUTLINE PIC X(20).

           PROCEDURE DIVISION.
           MAIN SECTION.
               DISPLAY "----Names-----".
               PERFORM READ_FILE.
               STOP RUN.


           READ_FILE SECTION.
               OPEN INPUT NameListFile
               OPEN OUTPUT WriteNameListFile

               MOVE "---------------" TO WriteNameLine
               WRITE WriteNameLine


               PERFORM UNTIL EOF_REACHED = "Y"
                   
                   READ NameListFile
                       AT END
                           MOVE "Y" TO EOF_REACHED
                       NOT AT END


                           STRING "Hello " DELIMITED BY SIZE NameLine
                           INTO OUTLINE

                           MOVE OUTLINE TO WriteNameLine
                           WRITE WriteNameLine
                
               END-PERFORM.

               CLOSE NameListFile.
               CLOSE WriteNameListFile.




