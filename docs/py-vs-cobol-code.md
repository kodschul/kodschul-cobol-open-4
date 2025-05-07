### 🟢 1. **Hello World**

```python
# Python
print("Hello, world!")
```

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.
       PROCEDURE DIVISION.
           DISPLAY "Hello, world!".
           STOP RUN.
```

---

### 🟢 2. **Variables and Basic Arithmetic**

```python
# Python
a = 5
b = 3
sum = a + b
print("Sum:", sum)
```

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ADDNUMBERS.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 A        PIC 9(2) VALUE 5.
       01 B        PIC 9(2) VALUE 3.
       01 SUM      PIC 9(3).
       PROCEDURE DIVISION.
           ADD A TO B GIVING SUM.
           DISPLAY "Sum: " SUM.
           STOP RUN.
```

---

### 🟢 3. **If/Else Conditional**

```python
# Python
x = 10
if x > 5:
    print("Greater than 5")
else:
    print("5 or less")
```

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CONDITION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 X        PIC 99 VALUE 10.
       PROCEDURE DIVISION.
           IF X > 5
               DISPLAY "Greater than 5"
           ELSE
               DISPLAY "5 or less".
           STOP RUN.
```

---

### 🟢 4. **Loops (For Loop)**

```python
# Python
for i in range(1, 6):
    print("Count:", i)
```

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOOPDEMO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 I        PIC 9 VALUE 1.
       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 5
               DISPLAY "Count: " I
           END-PERFORM.
           STOP RUN.
```

---

### 🟢 5. **Functions / Subprograms**

```python
# Python
def greet(name):
    return f"Hello, {name}"

print(greet("Alice"))
```

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAIN.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NAME     PIC X(20) VALUE "Alice".
       01 GREETING PIC X(40).
       PROCEDURE DIVISION.
           CALL 'GREET' USING NAME GREETING.
           DISPLAY GREETING.
           STOP RUN.

       IDENTIFICATION DIVISION.
       PROGRAM-ID. GREET.
       DATA DIVISION.
       LINKAGE SECTION.
       01 L-NAME     PIC X(20).
       01 L-GREETING PIC X(40).
       PROCEDURE DIVISION USING L-NAME L-GREETING.
           MOVE "Hello, " TO L-GREETING
           STRING L-NAME DELIMITED BY SPACE INTO L-GREETING WITH POINTER 8
           .
           EXIT PROGRAM.
```

---

### 🟢 6. **Reading User Input**

```python
# Python
name = input("Enter your name: ")
print(f"Hello, {name}")
```

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. USERINPUT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 NAME     PIC X(20).
       PROCEDURE DIVISION.
           DISPLAY "Enter your name: "
           ACCEPT NAME
           DISPLAY "Hello, " NAME.
           STOP RUN.
```

---

### 🟢 7. **Arrays / Lists**

```python
# Python
fruits = ["Apple", "Banana", "Cherry"]
for fruit in fruits:
    print(fruit)
```

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ARRAYDEMO.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 FRUITS.
           05 FRUIT-TABLE OCCURS 3 TIMES.
               10 FRUIT-NAME PIC X(10).
       01 I        PIC 9.
       PROCEDURE DIVISION.
           MOVE "Apple" TO FRUIT-NAME(1)
           MOVE "Banana" TO FRUIT-NAME(2)
           MOVE "Cherry" TO FRUIT-NAME(3)
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 3
               DISPLAY FRUIT-NAME(I)
           END-PERFORM.
           STOP RUN.
```

---

### 🟢 8. **File I/O (Write + Read)**

#### Python: Write & Read File

```python
# Write
with open("test.txt", "w") as f:
    f.write("Hello, file!")

# Read
with open("test.txt", "r") as f:
    content = f.read()
    print(content)
```

#### COBOL: Write & Read File

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. FILEIO.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OUTPUT-FILE ASSIGN TO "TEST.TXT"
               ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD OUTPUT-FILE.
       01 OUT-REC    PIC X(50).

       WORKING-STORAGE SECTION.

       PROCEDURE DIVISION.
           OPEN OUTPUT OUTPUT-FILE
           MOVE "Hello, file!" TO OUT-REC
           WRITE OUT-REC
           CLOSE OUTPUT-FILE
           STOP RUN.
```

To read it:

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. FILEREAD.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO "TEST.TXT"
               ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD INPUT-FILE.
       01 IN-REC     PIC X(50).

       PROCEDURE DIVISION.
           OPEN INPUT INPUT-FILE
           READ INPUT-FILE
               AT END DISPLAY "End of File"
               NOT AT END DISPLAY IN-REC
           END-READ
           CLOSE INPUT-FILE
           STOP RUN.
```

---

### Summary Table

| Concept              | Python                        | COBOL                      |
| -------------------- | ----------------------------- | -------------------------- |
| Simplicity           | One-liners                    | Verbose sections           |
| Variable Declaration | Dynamic                       | Explicit, with types       |
| Functions            | `def` syntax                  | Subprograms with linkage   |
| Conditions           | `if` / `else`                 | `IF ... ELSE`              |
| Loops                | `for`, `while`                | `PERFORM VARYING`          |
| File I/O             | `open()`, `read()`, `write()` | File section, `READ/WRITE` |
| Arrays               | Lists                         | `OCCURS` clause            |
| User Input           | `input()`                     | `ACCEPT`                   |
