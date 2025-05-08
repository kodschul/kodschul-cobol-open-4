           IDENTIFICATION DIVISION.
           PROGRAM-ID. SHOPPING_LIST.

           ENVIRONMENT DIVISION.

           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
               SELECT ShoppingBasketFile ASSIGN TO "basket.txt"
                   ORGANIZATION IS LINE SEQUENTIAL.

               SELECT ShoppingReceiptFile ASSIGN TO "receipt.txt"
                   ORGANIZATION IS LINE SEQUENTIAL.

           DATA DIVISION.
           FILE SECTION.
           FD ShoppingBasketFile.
           01 ShoppingItemLine.
               02 ITEM_QTY PIC 99.
               02 ITEM_NAME PIC X(10).

           FD ShoppingReceiptFile.
           01 ShoppingReceiptLine PIC X(80).

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

           01 RECEIPT_LINE PIC X(80).


           01 ITEM_PRICE PIC 99V99 VALUE 1.00.
           01 TOTAL_AMOUNT PIC 99V99 VALUE 0.00.
           01 ITEM_NETTO PIC 99V99 VALUE 0.00.
           01 ITEM_BRUTTO PIC 99V99 VALUE 0.00.
 

           01 ITEM_PRICE_F PIC $99,99.
           01 ITEM_PRICE_F2 PIC $99,99.


           PROCEDURE DIVISION.
           MAIN SECTION. 
               PERFORM PROCESS_ITEMS.
               STOP RUN.

           PROCESS_ITEMS SECTION.
               
               OPEN INPUT ShoppingBasketFile
               OPEN OUTPUT ShoppingReceiptFile


               MOVE "QTY | NAME         | NETTO  | BRUTTO"
                TO ShoppingReceiptLine.
               WRITE ShoppingReceiptLine.

               MOVE "----------------" TO ShoppingReceiptLine.
               WRITE ShoppingReceiptLine.


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


                       ADD ITEM_BRUTTO TO TOTAL_AMOUNT

                       MOVE ITEM_NETTO 
                       TO SHOPPING_ITEM_NETTO(SHOPPING_SIZE)

                       MOVE ITEM_BRUTTO 
                       TO SHOPPING_ITEM_BRUTTO(SHOPPING_SIZE)


                       MOVE ITEM_NETTO TO ITEM_PRICE_F
                       MOVE ITEM_BRUTTO TO ITEM_PRICE_F2

                       STRING SHOPPING_ITEM_QTY(SHOPPING_SIZE) "x " 
                       SHOPPING_ITEM_NAME(SHOPPING_SIZE) "     | "
                       ITEM_PRICE_F " | "
                       ITEM_PRICE_F2  
                       INTO RECEIPT_LINE

                       MOVE RECEIPT_LINE TO ShoppingReceiptLine
                       WRITE ShoppingReceiptLine

               END-PERFORM


               MOVE "----------------" TO ShoppingReceiptLine.
               WRITE ShoppingReceiptLine.

               INITIALIZE RECEIPT_LINE
               MOVE TOTAL_AMOUNT TO ITEM_PRICE_F.

               STRING "Total Due: " ITEM_PRICE_F INTO RECEIPT_LINE.
               MOVE RECEIPT_LINE TO ShoppingReceiptLine.
               WRITE ShoppingReceiptLine.

               CLOSE ShoppingBasketFile.
               CLOSE ShoppingReceiptFile.
