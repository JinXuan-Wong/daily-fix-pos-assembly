# 🍽️ Daily Fix POS System (Assembly Language)

## 📌 Overview
Daily Fix POS System is a console-based restaurant point-of-sale (POS) system developed using x86 Assembly Language.  
This project was created as part of an *Introduction to Computer Systems* assignment and demonstrates low-level programming concepts such as memory handling, procedure structuring, and interrupt-based input/output.

The system simulates real-world restaurant operations including order processing, billing, and stock management.

---

## 🚀 Features
- 🔐 Staff login system with password masking
- 🧾 Order management with categorized menu selection
- 💰 Payment calculation with:
  - SST (Sales Tax)
  - Service charge
- 🎟️ Discount system:
  - Member discount
  - RM7 voucher support
- 💳 Multiple payment methods:
  - Cash
  - Card
  - E-wallet
- 🧮 Automatic balance calculation for cash transactions
- 📦 Stock tracking system with low-stock alerts
- 📊 Sales report generation
- 👤 New user registration with validation

---

## 🛠️ Technologies Used
- x86 Assembly Language (MASM/TASM style)
- DOS-based console interface
- Interrupt-driven input/output (INT 21h)

---

## 💡 Key Implementation Highlights
- Structured using modular procedures (`PROC`) for maintainability
- Implements arithmetic logic for pricing, tax, and discounts
- Uses interrupt calls for keyboard input and screen output
- Displays formatted console UI with structured layout
- Integrates basic data handling for stock and user records
- Demonstrates low-level control of program flow and memory

---

## How to Run
1. Open the assembly source file in your emulator or assembler environment.
2. Assemble and link the program.
3. Run the executable in a DOS-compatible environment such as DOSBox.
4. Program compiled (ASS.exe)

## 📂 Project Structure
```text
daily-fix-pos-assembly/
│
├── src/
│ ├── daily_fix_pos.asm # Main source code
│
├── README.md
└── .gitignore
```

## Author
Wong Jin Xuan  
Dorcas Lim Yuan Yao  
Tan Yen Ping

## Academic Note
This project was developed for academic purposes.