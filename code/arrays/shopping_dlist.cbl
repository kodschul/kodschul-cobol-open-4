           IDENTIFICATION DIVISION.
           PROGRAM-ID. SHOPPING_LIST.
           
           DATA DIVISION.
           WORKING-STORAGE SECTION.
           
           01 SHOPPING_LIST.
               02 SHOPPING_SIZE PIC 99 VALUE 0.
               02 SHOPPING_ITEMS PIC X(20) OCCURS 10 TIMES.

           01 ITERATOR PIC 9 VALUE 1.

           01 USER_ITEM PIC X(20).

           01 IS_QUITTING PIC X VALUE "N".



           PROCEDURE DIVISION.
           MAIN SECTION. 
               PERFORM ADD_ITEM 
               UNTIL IS_QUITTING = "Y" OR SHOPPING_SIZE = 10.

               DISPLAY "----------------".
               PERFORM VARYING ITERATOR FROM 1 BY 1 
               UNTIL ITERATOR > SHOPPING_SIZE
                   DISPLAY SHOPPING_ITEMS(ITERATOR)
               END-PERFORM.
               STOP RUN.
           
           ADD_ITEM SECTION.
               DISPLAY "Add new item to basket: "

               ACCEPT USER_ITEM.

               IF USER_ITEM(1:4) = "QUIT"
                   MOVE "Y" TO IS_QUITTING
               ELSE
                   ADD 1 TO SHOPPING_SIZE
                   MOVE USER_ITEM TO SHOPPING_ITEMS(SHOPPING_SIZE)
               END-IF.
