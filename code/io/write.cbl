              IDENTIFICATION DIVISION.
              PROGRAM-ID. CopyFile.
       
              ENVIRONMENT DIVISION.
              INPUT-OUTPUT SECTION.
              FILE-CONTROL.
                  SELECT InputFile ASSIGN TO "file-a.txt"
                      ORGANIZATION IS LINE SEQUENTIAL.
                  SELECT OutputFile ASSIGN TO "file-b.txt"
                      ORGANIZATION IS LINE SEQUENTIAL.
       
              DATA DIVISION.
              FILE SECTION.
       
              FD  InputFile.
              01  Input-Line    PIC X(100).
       
              FD  OutputFile.
              01  Output-Line   PIC X(100).
       
              WORKING-STORAGE SECTION.
              01  EOF-REACHED   PIC X VALUE "N".
       
              PROCEDURE DIVISION.
              BEGIN.
                  OPEN INPUT InputFile
                  OPEN OUTPUT OutputFile
       
                  PERFORM UNTIL EOF-REACHED = "Y"
                      READ InputFile
                          AT END
                              MOVE "Y" TO EOF-REACHED
                          NOT AT END
                              MOVE Input-Line TO Output-Line
                              WRITE Output-Line
                      END-READ
                  END-PERFORM
       
                  CLOSE InputFile
                  CLOSE OutputFile
       
                  DISPLAY "✅ Copy complete."
                  STOP RUN.
       