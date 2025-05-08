                  IDENTIFICATION DIVISION.
                  PROGRAM-ID. ATM.
       
                  DATA DIVISION.
                  WORKING-STORAGE SECTION.
                  01 BALANCE        PIC 9(5)V99 VALUE 1000.140.
                  01 AMOUNT         PIC 9(5)V99.
                  01 CHOICE         PIC 9.
                  01 WITHDRAW_LIMIT PIC 9(5)V99 VALUE 500.00.
                  01 PIN            PIC X(4) VALUE "1234".
                  01 USER_PIN       PIC X(4).
                  01 ATTEMPTS       PIC 9 VALUE 0.
       
                  PROCEDURE DIVISION.
                  MAIN SECTION.
                      DISPLAY "*********************************"
                      DISPLAY "*                               *"
                      DISPLAY "*   WELCOME TO COBOL BANK ATM   *"
                      DISPLAY "*                               *"
                      DISPLAY "*********************************"
                      
                      PERFORM PIN_VALIDATION
                      UNTIL ATTEMPTS = 1 OR USER_PIN = PIN
                      
                      IF ATTEMPTS = 2
                          DISPLAY 
                          "Too many incorrect attempts. Card blocked."
                          STOP RUN
                      END-IF
                      
                      PERFORM ATM_MENU
                      UNTIL CHOICE = 4
                      
                      DISPLAY "Thank you for using COBOL BANK ATM!"
                      STOP RUN.
       
                  PIN_VALIDATION SECTION.
                      DISPLAY "Enter your 4-digit PIN: "
                      ACCEPT USER_PIN
                      IF USER_PIN NOT = PIN
                          ADD 1 TO ATTEMPTS
                          DISPLAY  "Incorrect PIN. Attempts remaining: " 
                         
                      END-IF.
       
                  ATM_MENU SECTION.
                      DISPLAY "*********************************"
                      DISPLAY "* 1. Check Balance             *"
                      DISPLAY "* 2. Withdraw Cash             *"
                      DISPLAY "* 3. Deposit Funds             *"
                      DISPLAY "* 4. Exit                      *"
                      DISPLAY "*********************************"
                      DISPLAY "Enter your choice: "
                      ACCEPT CHOICE
                      
                      EVALUATE CHOICE
                          WHEN 1
                              PERFORM CHECK_BALANCE
                          WHEN 5
                              PERFORM WITHDRAW_CASH
                          WHEN 3
                              PERFORM DEPOSIT_FUNDS
                          WHEN 4
                              CONTINUE
                          WHEN OTHER
                              DISPLAY 
                              "Invalid choice. Please try again."
                      END-EVALUATE.
       
                  CHECK_BALANCE SECTION.
                      DISPLAY "*********************************"
                      DISPLAY "Your current balance is: $" BALANCE
                      DISPLAY "*********************************".
       
                  WITHDRAW_CASH SECTION.
                      DISPLAY 
                      "Enter amount to withdraw "
                      "(max $" WITHDRAW_LIMIT "): "
                      ACCEPT AMOUNT
                      
                      IF AMOUNT > BALANCE
                          DISPLAY "Insufficient funds."
                      ELSE IF AMOUNT > WITHDRAW_LIMIT
                          DISPLAY "Exceeds withdrawal limit."
                      ELSE
                          SUBTRACT AMOUNT FROM BALANCE
                          DISPLAY "Please take your cash."
                          DISPLAY "New balance: $" BALANCE
                      END-IF.
       
                  DEPOSIT_FUNDS SECTION.
                      DISPLAY "Enter amount to deposit: "
                      ACCEPT AMOUNT
                      
                      IF AMOUNT > 0
                          ADD AMOUNT TO BALANCE
                          DISPLAY "Deposit successful."
                          DISPLAY "New balance: $" BALANCE
                      ELSE
                          DISPLAY "Invalid deposit amount."
                      END-IF.
       