## ✅ Overview: Python vs. COBOL Data Types

| Concept / Type  | Python                    | COBOL                                |
| --------------- | ------------------------- | ------------------------------------ |
| Integer         | `int`                     | `PIC 9` / `PIC 9(n)`                 |
| Decimal / Float | `float`, `Decimal`        | `PIC 9(n)V9(m)` / `COMP-3`           |
| String          | `str`                     | `PIC X(n)`                           |
| Boolean         | `bool` (`True` / `False`) | `PIC 9 VALUE 0` + control logic      |
| List / Array    | `list`                    | `OCCURS` (array definition)          |
| Dictionary      | `dict`                    | No direct equivalent; use table rows |
| Date / Time     | `datetime` module         | Custom PIC X(8) or Julian format     |
| None / Null     | `None`                    | `VALUE SPACES` / `NULL` (OO-Cobol)   |
| Object          | Class-based objects       | `CLASS-ID` and `OBJECT` (OO-COBOL)   |
| Bytes / Binary  | `bytes`, `bytearray`      | `PIC X(n)` with `USAGE IS COMP`      |

---

## 🟢 1. **Numeric Data Types**

### ✅ Python

```python
a = 5          # int
b = 3.14       # float
c = 100_000    # large int
```

### ✅ COBOL

```cobol
01 A     PIC 9(2) VALUE 5.          *> Integer
01 B     PIC 9(3)V99 VALUE 3.14.    *> Decimal with 2 decimals
01 C     PIC 9(6) VALUE 100000.     *> Large integer
```

- `PIC 9(n)`: numeric digits only
- `V`: implies decimal point
- `COMP-3`: packed decimal (efficient for storage)

---

## 🟢 2. **String / Character**

### ✅ Python

```python
name = "Alice"
```

### ✅ COBOL

```cobol
01 NAME  PIC X(20) VALUE "Alice".
```

- `PIC X(n)`: alphanumeric string (fixed length)

---

## 🟢 3. **Boolean**

### ✅ Python

```python
is_valid = True
```

### ✅ COBOL (no native boolean in classic COBOL)

```cobol
01 IS-VALID PIC 9 VALUE 1.  *> 1 = True, 0 = False

IF IS-VALID = 1
    DISPLAY "Valid"
END-IF.
```

Or with conditional names:

```cobol
01 SWITCH PIC X VALUE "Y".
   88 ON  VALUE "Y".
   88 OFF VALUE "N".

IF ON
    DISPLAY "Switch is on"
END-IF.
```

---

## 🟢 4. **List / Array**

### ✅ Python

```python
fruits = ["Apple", "Banana", "Cherry"]
```

### ✅ COBOL

```cobol
01 FRUITS.
   05 FRUIT-NAME OCCURS 3 TIMES.
      10 NAME-TEXT PIC X(10).

MOVE "Apple" TO NAME-TEXT(1).
MOVE "Banana" TO NAME-TEXT(2).
MOVE "Cherry" TO NAME-TEXT(3).
```

---

## 🟢 5. **Dictionary**

### ✅ Python

```python
person = {
    "name": "Alice",
    "age": 30
}
```

### 🚫 COBOL

COBOL doesn't support dictionaries or hash maps natively. You simulate it using:

- Arrays with multiple fields
- Records (group variables)

```cobol
01 PERSON.
   05 NAME PIC X(20).
   05 AGE  PIC 9(2).
```

---

## 🟢 6. **Date & Time**

### ✅ Python

```python
import datetime
today = datetime.date.today()
```

### ✅ COBOL

No native date/time handling. You define date fields as strings or numbers:

```cobol
01 TODAY-DATE PIC 9(8).  *> Format: YYYYMMDD
```

You manually compute or format using system-specific functions or user libraries.

---

## 🟢 7. **None / Null**

### ✅ Python

```python
value = None
```

### ✅ COBOL

Classic COBOL has no direct `NULL`, but uses:

```cobol
01 VALUE-FIELD PIC X(10) VALUE SPACES.
```

Or in OO-COBOL:

```cobol
IF OBJECT-REFERENCE = NULL
    DISPLAY "Null object".
```

---

## 🟢 8. **Binary / Byte**

### ✅ Python

```python
data = b"\x00\x01"
```

### ✅ COBOL

```cobol
01 BINARY-DATA PIC X(2) USAGE IS COMP.
```

Or use `USAGE IS BINARY` for raw binary storage.

---

## Summary

| Type        | Python     | COBOL                             |
| ----------- | ---------- | --------------------------------- |
| Integer     | `int`      | `PIC 9(n)`                        |
| Float       | `float`    | `PIC 9(n)V9(m)`                   |
| String      | `str`      | `PIC X(n)`                        |
| Boolean     | `bool`     | `88` levels or `PIC 9` flag       |
| List        | `list`     | `OCCURS` array                    |
| Dictionary  | `dict`     | Not native (simulate via records) |
| Date        | `datetime` | `PIC 9(8)` or string              |
| Null / None | `None`     | `VALUE SPACES` / `NULL`           |
| Object      | `class`    | `CLASS-ID`, `OBJECT`              |
| Byte        | `bytes`    | `COMP`, `BINARY`                  |
