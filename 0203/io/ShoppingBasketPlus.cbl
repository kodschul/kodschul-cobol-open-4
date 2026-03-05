      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ADD_NUM_PROG.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT BasketFile ASSIGN TO "basket.txt"
                   ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD BasketFile.
       01 BasketLine PIC X(10).

       WORKING-STORAGE SECTION.
       01 END_REACHED PIC 9 VALUE 0.

       01 TOTAL_SUM PIC 9(3)V99.
       01 TEM_UNIT_PRICE PIC 9(3)V99 VALUE 0.99.

       01 I PIC 9(3) VALUE 0.


       01 BASKET.
           02 ITEMS_COUNT PIC 9(3).
           02 ITEMS OCCURS 100 TIMES.
               03 ITEM_QTY PIC 9(3)V99.
               03 ITEM_NAME PIC X(10).
               03 ITEM_UNIT_PRICE PIC 9(3)V99.
               03 ITEM_NETTO PIC 9(3)V99.
               03 ITEM_BRUTTO PIC 9(3)V99.


       01 TEXT_PF PIC X(20).
       01 NUM_PF.
           02 NUM_CURRENCY_PF VALUE "EUR ".
           02 NUM_VALUE_PF PIC ZZ9V,99.


       01 PRINT_LINE.
           02 ITEM_QTY_F PIC ZZZV,ZZ.
           02 VALUE "x  |".
           02 ITEM_NAME_F PIC X(10).
           02 VALUE " | EUR ".
           02 ITEM_UNIT_F  PIC ZZ9V,99.
           02 VALUE " | EUR ".
           02 ITEM_NETTO_F  PIC ZZ9V,99.
           02 VALUE " | EUR ".
           02 ITEM_BRUTTO_F  PIC ZZ9V,99.





       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "----Shopping PRO 2.0----"
            PERFORM READ_BASKET.
            PERFORM PRINT_RECEIPT.
            STOP RUN.

       READ_BASKET SECTION.
           OPEN INPUT BasketFile.
           PERFORM UNTIL END_REACHED = 1
               READ BasketFile
                   AT END
                       MOVE 1 TO END_REACHED
                   NOT AT END
                       ADD 1 TO ITEMS_COUNT


                       UNSTRING BasketLine DELIMITED BY ","
                       INTO
                       ITEM_NAME(ITEMS_COUNT)
                       ITEM_QTY(ITEMS_COUNT)
                       END-UNSTRING

                       MOVE TEM_UNIT_PRICE
                       TO ITEM_UNIT_PRICE(ITEMS_COUNT)
                       ADD 0.09 TO TEM_UNIT_PRICE

                       COMPUTE ITEM_NETTO(ITEMS_COUNT) =
                       ITEM_UNIT_PRICE(ITEMS_COUNT)
                       * ITEM_QTY(ITEMS_COUNT)

                       COMPUTE ITEM_BRUTTO(ITEMS_COUNT) =
                       ITEM_NETTO(ITEMS_COUNT) * 1.07

           END-PERFORM.
           CLOSE BasketFile.

       PRINT_RECEIPT SECTION.


           DISPLAY "QTY      | NAME      | UNIT        |"
            WITH NO ADVANCING " NETTO     | BRUTTO"
           DISPLAY "--------------------------------------------"
               WITH NO ADVANCING "---------------"

           MOVE 0 TO I.
           PERFORM VARYING I FROM 1 BY 1  UNTIL I > ITEMS_COUNT
               PERFORM PRINT_CURR_ITEM
           END-PERFORM

           DISPLAY "--------------------------------------------"
               WITH NO ADVANCING "---------------"


           MOVE TOTAL_SUM TO NUM_VALUE_PF

           DISPLAY "TOTAL AMOUNT: " NUM_PF .



       PRINT_CURR_ITEM SECTION.
           MOVE ITEM_QTY(I) TO ITEM_QTY_F.
           MOVE ITEM_NAME(I) TO ITEM_NAME_F.
           MOVE ITEM_UNIT_PRICE(I) TO ITEM_UNIT_F.
           MOVE ITEM_NETTO(I) TO ITEM_NETTO_F.
           MOVE ITEM_BRUTTO(I) TO ITEM_BRUTTO_F.


           ADD ITEM_BRUTTO(I) TO TOTAL_SUM
           DISPLAY PRINT_LINE.

       END PROGRAM ADD_NUM_PROG.
