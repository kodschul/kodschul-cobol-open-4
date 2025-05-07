           IDENTIFICATION DIVISION.
           PROGRAM-ID. SHOPPING_LIST.
           
           DATA DIVISION.
           WORKING-STORAGE SECTION.
           
           01 SHOPPING_LIST.
               02 SHOPPING_ITEMS PIC X(20) OCCURS 10 TIMES.

           01 ITERATOR PIC 9 VALUE 1.


           PROCEDURE DIVISION.
           MAIN SECTION. 
               PERFORM ADD_ITEM.
               DISPLAY SHOPPING_ITEMS(1).
               DISPLAY SHOPPING_ITEMS(2).
               DISPLAY SHOPPING_ITEMS(3).
               DISPLAY "----------------".
               PERFORM VARYING ITERATOR FROM 1 BY 1 UNTIL ITERATOR = 7
                   DISPLAY SHOPPING_ITEMS(ITERATOR)
               END-PERFORM.
               STOP RUN.
           
           ADD_ITEM SECTION.
               DISPLAY "Add new item to basket: "

               MOVE "Orange" TO SHOPPING_ITEMS(1).
               MOVE "Mango" TO SHOPPING_ITEMS(2).
               MOVE "Apple" TO SHOPPING_ITEMS(3).
               MOVE "Lemonade" TO SHOPPING_ITEMS(4).
               MOVE "Banana" TO SHOPPING_ITEMS(5).
               MOVE "Ananas" TO SHOPPING_ITEMS(6).
        