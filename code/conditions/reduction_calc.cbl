           IDENTIFICATION DIVISION.
           PROGRAM-ID. RabattBerechnung.
           
           DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 Betrag         PIC 9(5)V99.
           01 Endbetrag      PIC 9(5)V99.
           01 Rabatt         PIC 9(5)V99.
           
           PROCEDURE DIVISION.
               DISPLAY "Bitte geben Sie den Betrag ein: " ACCEPT Betrag
           
               IF Betrag > 1000
                   COMPUTE Rabatt = Betrag * 0.10
                   COMPUTE Endbetrag = Betrag - Rabatt
                   DISPLAY "Sie erhalten 10% Rabatt: " Rabatt
               ELSE
                   MOVE Betrag TO Endbetrag
                   DISPLAY "Kein Rabatt gewährt."
               END-IF
           
               DISPLAY "Endbetrag: " Endbetrag
               STOP RUN.
           