           IDENTIFICATION DIVISION.
           PROGRAM-ID. HELLO.
           
           ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
               SELECT NameListFile ASSIGN TO "names.txt"
                   ORGANIZATION IS LINE SEQUENTIAL.

           DATA DIVISION.
           FILE SECTION.
           FD NameListFile.
           01 NameLine.
               02 QTY PIC 99.
               02 ITEM_NAME PIC X(10).

           WORKING-STORAGE SECTION.
           01 EOF_REACHED PIC X VALUE "N".

           PROCEDURE DIVISION.
           MAIN SECTION.
               DISPLAY "----Names-----".
               PERFORM READ_FILE.
               STOP RUN.


           READ_FILE SECTION.
               OPEN INPUT NameListFile

               PERFORM UNTIL EOF_REACHED = "Y"
                   
                   READ NameListFile
                       AT END
                           MOVE "Y" TO EOF_REACHED
                       NOT AT END

                           DISPLAY "Hello " NameLine
                
               END-PERFORM.

               CLOSE NameListFile.




