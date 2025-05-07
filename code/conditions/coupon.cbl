           IDENTIFICATION DIVISION.
           PROGRAM-ID. ErweiterteRabattBerechnung.
           
           DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 Bestellwert       PIC 9(5)V99.
           01 PromoCode         PIC X(10).
           01 RabattProzent     PIC 9(2)V99 VALUE 0.
           01 Rabattbetrag      PIC 9(5)V99.
           01 MaxRabatt         PIC 9(5)V99 VALUE 100.00.
           01 Endbetrag         PIC 9(5)V99.
           
           PROCEDURE DIVISION.
               DISPLAY "Bitte geben Sie den Bestellwert ein: " 
               ACCEPT Bestellwert

               
               DISPLAY "Geben Sie Ihren Promo-Code ein (z.B. RABATT10):" 
               ACCEPT PromoCode
           
               EVALUATE PromoCode
                   WHEN "RABATT5"
                       MOVE 0.05 TO RabattProzent
                   WHEN "RABATT10"
                       MOVE 0.10 TO RabattProzent
                   WHEN "RABATT20"
                       MOVE 0.20 TO RabattProzent
                   WHEN OTHER
                       DISPLAY "Promo-Code ungültig! Kein Rabatt."
                       MOVE 0 TO RabattProzent
               END-EVALUATE
           
               COMPUTE Rabattbetrag = Bestellwert * RabattProzent
           
               IF Rabattbetrag > MaxRabatt
                   MOVE MaxRabatt TO Rabattbetrag
                   DISPLAY "Maximaler Rabatt von 100€ angewendet!"
               END-IF
           
               COMPUTE Endbetrag = Bestellwert - Rabattbetrag
           
               DISPLAY "Rabatt: " Rabattbetrag
               DISPLAY "Zu zahlender Betrag: " Endbetrag
           
               STOP RUN.
           