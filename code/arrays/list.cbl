       IDENTIFICATION DIVISION.
       PROGRAM-ID. LIST-PROCESSING.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  MY-LIST.
           05  LIST-SIZE        PIC 9(3) VALUE 0.
           05  LIST-ELEMENTS    PIC 9(3) OCCURS 100 TIMES.
       01 I PIC 99.
       
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM INITIALIZE-LIST
           PERFORM ADD-ELEMENT THRU ADD-ELEMENT-EXIT
           PERFORM PRINT-LIST
           PERFORM REMOVE-ELEMENT THRU REMOVE-ELEMENT-EXIT
           PERFORM PRINT-LIST
           STOP RUN.

       INITIALIZE-LIST.
           MOVE 0 TO LIST-SIZE
           MOVE 1 TO I
           PERFORM UNTIL I > 100
               MOVE 0 TO LIST-ELEMENTS(I)
               ADD 1 TO I
           END-PERFORM

       PRINT-LIST.
           DISPLAY "Current List:"
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > LIST-SIZE
               DISPLAY "Element " I ": " LIST-ELEMENTS(I)
           END-PERFORM.

       ADD-ELEMENT.
           IF LIST-SIZE < 100
               ADD 1 TO LIST-SIZE
               MOVE 42 TO LIST-ELEMENTS(LIST-SIZE)
               DISPLAY "Element added successfully"
           ELSE
               DISPLAY "List is full, cannot add element"
           END-IF.
       ADD-ELEMENT-EXIT.
           EXIT.

       REMOVE-ELEMENT.
           IF LIST-SIZE > 0
               MOVE 0 TO LIST-ELEMENTS(LIST-SIZE)
               SUBTRACT 1 FROM LIST-SIZE
               DISPLAY "Element removed successfully"
           ELSE
               DISPLAY "List is empty, cannot remove element"
           END-IF.
       REMOVE-ELEMENT-EXIT.
           EXIT.
