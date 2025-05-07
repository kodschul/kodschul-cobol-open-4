           IDENTIFICATION DIVISION.
           PROGRAM-ID. SHOPPING_LIST.
           
           DATA DIVISION.
           WORKING-STORAGE SECTION.
           
           01 SHOPPING_LIST.
               02 SHOPPING_ITEMS OCCURS 10 TIMES.
                   03 SHOPPING_ITEM_NAME PIC X(10).
                   03 SHOPPING_ITEM_QTY PIC 99.

           01 ITERATOR PIC 9 VALUE 1.
           
           PROCEDURE DIVISION.
           MAIN SECTION. 
               PERFORM ADD_ITEM.
               
               DISPLAY "----------------".
               PERFORM VARYING ITERATOR FROM 1 BY 1 UNTIL ITERATOR = 7
                   DISPLAY SHOPPING_ITEM_QTY(ITERATOR) "x " 
                   SHOPPING_ITEM_NAME(ITERATOR)

               END-PERFORM.
               STOP RUN.
           
           ADD_ITEM SECTION.
               DISPLAY "Add new item to basket: "

               MOVE "Orange" TO SHOPPING_ITEM_NAME(1).
               MOVE 5 TO SHOPPING_ITEM_QTY(1).

               MOVE "Mango" TO SHOPPING_ITEM_NAME(2).
               MOVE 3 TO SHOPPING_ITEM_QTY(2).

               MOVE "Apple" TO SHOPPING_ITEM_NAME(3).
               MOVE 2 TO SHOPPING_ITEM_QTY(3).
               