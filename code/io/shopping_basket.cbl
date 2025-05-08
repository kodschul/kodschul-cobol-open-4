           IDENTIFICATION DIVISION.
           PROGRAM-ID. SHOPPING_LIST.

           ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
               SELECT ShoppingBasketFile ASSIGN TO "basket.txt"
                   ORGANIZATION IS LINE SEQUENTIAL.

           DATA DIVISION.
           FILE SECTION.
           FD ShoppingBasketFile.
           01 ShoppingItemLine.
               02 ITEM_QTY PIC 99.
               02 ITEM_NAME PIC X(10).

           WORKING-STORAGE SECTION.
           01 EOF_REACHED PIC X VALUE "N".

           01 SHOPPING_LIST.
               02 SHOPPING_SIZE PIC 99 VALUE 0.
               02 SHOPPING_ITEMS OCCURS 10 TIMES.
                   03 SHOPPING_ITEM_NAME PIC X(10).
                   03 SHOPPING_ITEM_QTY PIC 99.

                   03 SHOPPING_ITEM_NETTO PIC 99V99.
                   03 SHOPPING_ITEM_BRUTTO PIC 99V99.


           01 ITERATOR PIC 9 VALUE 1.

           01 USER_INPUT PIC X(20).

           01 IS_QUITTING PIC X VALUE "N".


           01 ITEM_PRICE PIC 99V99 VALUE 1.00.
           01 ITEM_NETTO PIC 99V99 VALUE 1.00.
           01 ITEM_BRUTTO PIC 99V99 VALUE 1.00.
 

           01 ITEM_PRICE_F PIC $99.99.
           01 ITEM_PRICE_F2 PIC $99.99.


           PROCEDURE DIVISION.
           MAIN SECTION. 
               PERFORM READ_ITEMS.

               DISPLAY "QTY | NAME         | NETTO  | BRUTTO"
               DISPLAY "----------------".
               PERFORM VARYING ITERATOR FROM 1 BY 1 
               UNTIL ITERATOR > SHOPPING_SIZE
                  MOVE SHOPPING_ITEM_NETTO(ITERATOR) 
                  TO ITEM_PRICE_F

                   MOVE SHOPPING_ITEM_BRUTTO(ITERATOR) 
                       TO ITEM_PRICE_F2


                DISPLAY 
                    SHOPPING_ITEM_QTY(ITERATOR) "x " 
                    SHOPPING_ITEM_NAME(ITERATOR) "     | "
                    ITEM_PRICE_F " | "
                    ITEM_PRICE_F2  
                
                MOVE 0 TO ITEM_PRICE_F
                MOVE 0 TO ITEM_PRICE_F2

               END-PERFORM.
               STOP RUN.

           READ_ITEMS SECTION.
               
               OPEN INPUT ShoppingBasketFile

               PERFORM UNTIL EOF_REACHED = "Y"

                   READ ShoppingBasketFile

                    AT END 
                        MOVE "Y" TO EOF_REACHED
                    NOT AT END 
                       ADD 1 TO SHOPPING_SIZE
                       MOVE ITEM_NAME 
                       TO SHOPPING_ITEM_NAME(SHOPPING_SIZE)
   
                       MOVE ITEM_QTY 
                       TO SHOPPING_ITEM_QTY(SHOPPING_SIZE)
                       ADD 0.30 TO ITEM_PRICE

                       COMPUTE ITEM_NETTO = ITEM_QTY * ITEM_PRICE
                       COMPUTE ITEM_BRUTTO = ITEM_NETTO * 1.07

                       MOVE ITEM_NETTO 
                       TO SHOPPING_ITEM_NETTO(SHOPPING_SIZE)

                       MOVE ITEM_BRUTTO 
                       TO SHOPPING_ITEM_BRUTTO(SHOPPING_SIZE)
               END-PERFORM
               CLOSE ShoppingBasketFile.
