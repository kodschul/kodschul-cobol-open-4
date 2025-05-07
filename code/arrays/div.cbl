              IDENTIFICATION DIVISION.
              PROGRAM-ID. LIST-PROCESSING.
       
              DATA DIVISION.
              WORKING-STORAGE SECTION.
              01  MY_TEXT.
                  05  MY_NUM_ONLY       PIC 9.
                  05  MY_TEXT_ONLY    PIC A(10).
              
              
              PROCEDURE DIVISION.
              
              ACCEPT MY_TEXT.

              DISPLAY "Num: " MY_NUM_ONLY.

              DISPLAY "Text: " MY_TEXT_ONLY.

