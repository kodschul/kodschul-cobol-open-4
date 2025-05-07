## 🟢 1. **Defining a Class**

### ✅ Python

```python
# Python
class Person:
    def __init__(self, name):
        self.name = name

    def greet(self):
        return f"Hello, I am {self.name}"

p = Person("Alice")
print(p.greet())
```

### ✅ COBOL (OO)

```cobol
       IDENTIFICATION DIVISION.
       CLASS-ID. Person.

       OBJECT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 name PIC X(30).

       PROCEDURE DIVISION.
       METHOD-ID. NEW.
           SET SELF TO NULL
           EXIT METHOD.
       END METHOD NEW.

       METHOD-ID. INIT.
           LINKAGE SECTION.
           01 passed-name PIC X(30).
           PROCEDURE DIVISION USING passed-name.
               MOVE passed-name TO name
               EXIT METHOD.
       END METHOD INIT.

       METHOD-ID. GREET.
           LINKAGE SECTION.
           01 greeting-msg PIC X(50).
           PROCEDURE DIVISION RETURNING greeting-msg.
               STRING "Hello, I am " DELIMITED BY SIZE,
                      name DELIMITED BY SPACE
                   INTO greeting-msg
               EXIT METHOD.
       END METHOD GREET.

       END OBJECT.
       END CLASS Person.
```

---

## 🟢 2. **Creating and Using Objects**

### ✅ Python

```python
p1 = Person("Bob")
print(p1.greet())
```

### ✅ COBOL

```cobol
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MAINPROG.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 person-object OBJECT REFERENCE Person.
       01 greeting-msg PIC X(50).

       PROCEDURE DIVISION.
           INVOKE Person "NEW" RETURNING person-object
           INVOKE person-object "INIT" USING "Bob"
           INVOKE person-object "GREET" RETURNING greeting-msg
           DISPLAY greeting-msg
           GOBACK.
```

---

## 🟢 3. **Inheritance**

### ✅ Python

```python
class Employee(Person):
    def __init__(self, name, job):
        super().__init__(name)
        self.job = job

    def introduce(self):
        return f"I am {self.name} and I work as a {self.job}"

e = Employee("Alice", "Developer")
print(e.introduce())
```

### ✅ COBOL (with inheritance - simplified)

COBOL inheritance is complex and not widely implemented, but in theory:

```cobol
       IDENTIFICATION DIVISION.
       CLASS-ID. Employee INHERITS Person.

       OBJECT.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 job-title PIC X(30).

       PROCEDURE DIVISION.
       METHOD-ID. INIT.
           LINKAGE SECTION.
           01 passed-name PIC X(30).
           01 passed-job  PIC X(30).
           PROCEDURE DIVISION USING passed-name passed-job.
               INVOKE SUPER "INIT" USING passed-name
               MOVE passed-job TO job-title
               EXIT METHOD.
       END METHOD INIT.

       METHOD-ID. INTRODUCE.
           LINKAGE SECTION.
           01 msg PIC X(80).
           PROCEDURE DIVISION RETURNING msg.
               STRING "I am ", name, " and I work as a ",
                      job-title DELIMITED BY SPACE INTO msg
               EXIT METHOD.
       END METHOD INTRODUCE.

       END OBJECT.
       END CLASS Employee.
```

---

### Summary: OOP in Python vs COBOL

| Feature         | Python                   | COBOL OOP (2002+)                   |
| --------------- | ------------------------ | ----------------------------------- |
| Class Syntax    | Simple `class` and `def` | Requires `CLASS-ID`, `OBJECT` block |
| Object Creation | `p = Person()`           | `INVOKE Person "NEW"`               |
| Inheritance     | `class A(B):`            | `CLASS-ID. A INHERITS B.`           |
| Method Call     | `obj.method()`           | `INVOKE obj "method"`               |
| Readability     | Very readable            | Very verbose                        |
