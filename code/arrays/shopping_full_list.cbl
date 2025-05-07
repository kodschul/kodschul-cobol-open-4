           IDENTIFICATION DIVISION.
           PROGRAM-ID. SHOPPING_LIST.
           
           DATA DIVISION.
           WORKING-STORAGE SECTION.
           
           01 SHOPPING_LIST.
               02 SHOPPING_SIZE PIC 99 VALUE 0.
               02 SHOPPING_ITEMS OCCURS 10 TIMES.
                   03 SHOPPING_ITEM_NAME PIC X(10).
                   03 SHOPPING_ITEM_QTY PIC 99.


           01 ITERATOR PIC 9 VALUE 1.

           01 USER_INPUT PIC X(20).

           01 IS_QUITTING PIC X VALUE "N".


           01 ITEM_PRICE PIC 9V99 VALUE 1.00.


           PROCEDURE DIVISION.
           MAIN SECTION. 
               PERFORM ADD_ITEM 
               UNTIL IS_QUITTING = "Y" OR SHOPPING_SIZE = 10.

               DISPLAY "QTY | NAME         | NETTO  | BRUTTO"
               DISPLAY "----------------".
               PERFORM VARYING ITERATOR FROM 1 BY 1 
               UNTIL ITERATOR > SHOPPING_SIZE
                  DISPLAY SHOPPING_ITEM_QTY(ITERATOR) "x " 
                   SHOPPING_ITEM_NAME(ITERATOR)
               END-PERFORM.
               STOP RUN.
           
           ADD_ITEM SECTION.
               DISPLAY "Add new item to basket: "
               DISPLAY "Name: "
               ACCEPT USER_INPUT.

               IF USER_INPUT(1:1) = " "
                   MOVE "Y" TO IS_QUITTING
               ELSE 
                    ADD 1 TO SHOPPING_SIZE
                    MOVE USER_INPUT 
                    TO SHOPPING_ITEM_NAME(SHOPPING_SIZE)

                    DISPLAY "Quantity: "
                    ACCEPT USER_INPUT

                    MOVE USER_INPUT 
                    TO SHOPPING_ITEM_QTY(SHOPPING_SIZE)

                   ADD 0.30 TO ITEM_PRICE
                   DISPLAY "Price: " ITEM_PRICE
               END-IF.


