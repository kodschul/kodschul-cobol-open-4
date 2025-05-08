           IDENTIFICATION DIVISION.
           PROGRAM-ID. SHOPPING_LIST.
           
           DATA DIVISION.
           WORKING-STORAGE SECTION.
           
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



           01 ITEM_OUTPUT_F PIC X(100).
           01 ITEM_OUTPUT PIC X(100).

           01 ITEM_PRICE_F PIC $99.99.
           01 ITEM_PRICE_F2 PIC $99.99.


           PROCEDURE DIVISION.
           MAIN SECTION. 
               PERFORM ADD_ITEM 
               UNTIL IS_QUITTING = "Y" OR SHOPPING_SIZE = 10.

               DISPLAY "QTY | NAME         | NETTO  | BRUTTO"
               DISPLAY "----------------".
               PERFORM VARYING ITERATOR FROM 1 BY 1 
               UNTIL ITERATOR > SHOPPING_SIZE
                  MOVE SHOPPING_ITEM_NETTO(SHOPPING_SIZE) 
                  TO ITEM_PRICE_F

                   MOVE SHOPPING_ITEM_BRUTTO(SHOPPING_SIZE) 
                       TO ITEM_PRICE_F2

                  STRING ITEM_OUTPUT_F DELIMITED BY SPACE
                    SHOPPING_ITEM_QTY(ITERATOR) "x " 
                    SHOPPING_ITEM_NAME(ITERATOR) "     | "
                    ITEM_PRICE_F " | "
                    ITEM_PRICE_F2  
                    INTO ITEM_OUTPUT
                
                MOVE 0 TO ITEM_PRICE_F
                MOVE 0 TO ITEM_PRICE_F2

                DISPLAY ITEM_OUTPUT
                MOVE " " TO ITEM_OUTPUT
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

                   
      
                     COMPUTE SHOPPING_ITEM_NETTO(SHOPPING_SIZE) =
                         SHOPPING_ITEM_QTY(SHOPPING_SIZE) * ITEM_PRICE 


                    DISPLAY "NET.: " SHOPPING_ITEM_NETTO(SHOPPING_SIZE)
                     
                     COMPUTE SHOPPING_ITEM_BRUTTO(SHOPPING_SIZE) =
                         SHOPPING_ITEM_NETTO(SHOPPING_SIZE) * 1.07


                   DISPLAY "Price: " ITEM_PRICE
               END-IF.




