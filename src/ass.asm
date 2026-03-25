.model small
.stack 64
.data
NEWLINE DB 13,10,"$"
TABLELINE DB 13,10,10 DUP(' '),"----------------------------------------------------$"
CONTMSG DB 13,10,13,10,20 DUP(' '),"Press any key to continue ... $"
TENSPACE DB 10 DUP (' '),"$"
FIVESPACE DB 5 DUP (' '),"$"
TWOSPACE DB 2 DUP(' '),"$"
DOT DB ".00$"
TEN DB 10
HUNDRED DW 100
HDR DB 100
THOUSAND DW 1000
TENTSD DW 10000
SIX DB 6
VAR1 DW 0
CENTS DB 0

INPUT1 DB 0		;storing digit input from user
INPUT2 DB 0
INPUT3 DB 0
INPUT4 DB 0
INPUT5 DB 0

Q1 DB 0			;storing quotient and remainder for digit capture and display
Q2 DB 0
Q3 DB 0	
R1 DB 0
R2 DB 0
R3 DB 0

SUBTOTAL DW 0
DISCOUNT DW 0
CUSTOMERS DB 0

;------------COLOR CODE--------------
RED DB 0CH
YELLOW DB 0EH
CYAN DB 0BH
LGREEN DB 0AH
;------------------------------------

FOOD_NAME DB "Chicken Pasta   $","Tomato Soup     $","Curry Rice      $","Creamy Carbonara$"
	  DB "Beef Steak      $","Cheese Cake     $","Pudding         $","Ice Cream       $"
	  DB "Smoothies       $","Iced Latte      $","Hot Chocolate   $","Lemon Tea       $"
FOOD_PRICE DB 10,7,12,12,13,8,5,7,8,9,9,8
USER_CHS DB 12 DUP(?)
FOOD_STOCK DB 12 DUP(50)
TAKEAWAY DB ?

UIMSG DB 13,10,13,10,10 DUP(' '),"=========================================="
      DB 13,10,10 DUP(' '),"|                Welcome                 |"
      DB 13,10,10 DUP(' '),"|  ____        _ _         _____ _       |"
      DB 13,10,10 DUP(' '),"| |  _ \  __ _(_| |_   _  |  ___(___  __ |"
      DB 13,10,10 DUP(' '),"| | | | |/ _` | | | | | | | |_  | \ \/ / |"
      DB 13,10,10 DUP(' '),"| | |_| | (_| | | | |_| | |  _| | |>  <  |"
      DB 13,10,10 DUP(' '),"| |____/ \__,_|_|_|\__, | |_|   |_/_/\_\ |"
      DB 13,10,10 DUP(' '),"|                  |___/                 |"
      DB 13,10,10 DUP(' '),"|               POS system               |"
      DB 13,10,10 DUP(' '),"==========================================$"
LOGMSG DB 13,10,13,10,10 DUP(' '),"------------------------------------------"
       DB 13,10,10 DUP(' '),"|	            LOGIN                  |"
       DB 13,10,10 DUP(' '),"------------------------------------------$"
LOGMSG1 DB 10 DUP(' '),"Enter ID: $"
LOGMSG2 DB 10 DUP(' '),"Enter Password: $"
USERID DB "admin$","user1$","user2$","user3$"
USERPSW DB "password$", 9 DUP ('$'), 9 DUP ('$'), 9 DUP ('$')
ID_LENGTH DB 6
PSW_LENGTH DB 9
NUMUSERS DW 1
IID DB 6 DUP('$')
IPSW DB 9 DUP ('$')
LOGMSG3 DB 10 DUP(' '),"Login Successful.$"
LOGMSG4 DB 10 DUP(' '),"Invalid user ID or password. Please try again.$"

MAINMSG DB 13,10,13,10,10 DUP(' '),"------------------------------------------"
       	DB 13,10,10 DUP(' '),"|	           MAIN MENU               |"
       	DB 13,10,10 DUP(' '),"------------------------------------------"
	    DB 13,10,13,10,15 DUP(' '),"1. Take Order"
	    DB 13,10,15 DUP(' '),"2. Stock Tracking"
	    DB 13,10,15 DUP(' '),"3. Sales Report"
	    DB 13,10,15 DUP(' '),"4. Register User ID"
	    DB 13,10,15 DUP(' '),"5. Log Out"
	    DB 13,10,15 DUP(' '),"6. Quit System$"
MAINMSG1 DB 15 DUP(' '),"Enter your choice: $" 
MAINMSG2 DB 15 DUP(' '),"! ! Invalid input. Only range (1 - 6) accepted.$"
MAINCHS DB 0

ORDERMSG DB 13,10,13,10,10 DUP(' '),"------------------------------------------"
	     DB 13,10,10 DUP(' '),"|	            ORDER                  |"
	     DB 13,10,10 DUP(' '),"------------------------------------------"
	     DB 13,10,13,10,15 DUP(' '),"1. Main Dishes"
	     DB 13,10,15 DUP(' '),"2. Dessert"
	     DB 13,10,15 DUP(' '),"3. Drinks$"
ORDERMSG1 DB 15 DUP(' '),"Enter your choice: $" 
ORDERMSG2 DB 15 DUP(' '),"! ! Invalid input. Only range (1 - 3) accepted.$"
ORDERCHS DB 0

DISHMSG DB 13,10,13,10,10 DUP(' '),"========================================="
	    DB 13,10,10 DUP(' '),"|  __  __      _        ___  _    _     |"
	    DB 13,10,10 DUP(' '),"| |  \/  |__ _(_)_ _   |   \(_)__| |_   |"
	    DB 13,10,10 DUP(' '),"| | |\/| / _` | | ' \  | |) | (_-| ' \  |"
	    DB 13,10,10 DUP(' '),"| |_|  |_\__,_|_|_||_| |___/|_/__|_||_| |"
	    DB 13,10,10 DUP(' '),"|                                       |"
	    DB 13,10,10 DUP(' '),"|                 MENU                  |"
	    DB 13,10,10 DUP(' '),"=========================================$"
DISHMSG1 DB 13,10,13,10,12 DUP(' '),"------------------------------------"
	     DB 13,10,12 DUP(' '),"|No. |Food		     |Price(RM)|"
	     DB 13,10,12 DUP(' '),"------------------------------------"
	     DB 13,10,12 DUP(' '),"| 1. | Chicken Pasta     | 10.00   |"
	     DB 13,10,12 DUP(' '),"| 2. | Tomato Soup       | 7.00    |"
	     DB 13,10,12 DUP(' '),"| 3. | Curry Rice        | 12.00   |"
	     DB 13,10,12 DUP(' '),"| 4. | Creamy Carbonara  | 12.00   |"
	     DB 13,10,12 DUP(' '),"| 5. | Beef Steak        | 13.00   |"
	     DB 13,10,12 DUP(' '),"------------------------------------$"
DISHMSG2 DB 15 DUP(' '),"Enter option: $"
DISHMSG3 DB 15 DUP(' '),"! ! Invalid input. Only option (1 - 5) accepted.$"
DISHMSG4 DB 15 DUP(' '),"Enter quantity (1 - 9): $"
DISHMSG5 DB 15 DUP(' '),"Sorry, not enough stock, please reenter. Stock remain: $"
DISHMSG6 DB 15 DUP(' '),"! ! Invalid input. Only quantity (1 - 9) accepted.$"
DISHMSG7 DB 15 DUP(' '),"Add order? (Y/N): $"
DISHMSG8 DB 15 DUP(' '),"! ! Invalid input. Only 'Y' / 'N'.$"
FOODCHS DB 0
QUANTITY DB 0
			 
DESSERTMSG DB 13,10,13,10,10 DUP(' '),"================================"
	       DB 13,10,10 DUP(' '),"|  ___                    _    |"
	       DB 13,10,10 DUP(' '),"| |   \ ___ _________ _ _| |_  |"
	       DB 13,10,10 DUP(' '),"| | |) / -_(_-(_-/ -_| '_|  _| |"
	       DB 13,10,10 DUP(' '),"| |___/\___/__/__\___|_|  \__| |"
	       DB 13,10,10 DUP(' '),"|                              |"
	       DB 13,10,10 DUP(' '),"|             MENU             |"
	       DB 13,10,10 DUP(' '),"================================$"
DESSERTMSG1 DB 13,10,13,10,12 DUP(' '),"------------------------------------"
	        DB 13,10,12 DUP(' '),"|No. |Food		     |Price(RM)|"
	        DB 13,10,12 DUP(' '),"------------------------------------"
	        DB 13,10,12 DUP(' '),"| 1. | Cheese Cake       | 8.00    |"
	        DB 13,10,12 DUP(' '),"| 2. | Pudding           | 5.00    |"
	        DB 13,10,12 DUP(' '),"| 3. | Ice Cream         | 7.00    |"
	        DB 13,10,12 DUP(' '),"------------------------------------$"
DESSERTMSG2 DB 15 DUP(' '),"! ! Invalid input. Only option (1 - 3) accepted.$"

DRINKSMSG DB 13,10,13,10,10 DUP(' '),"================================"
	      DB 13,10,10 DUP(' '),"|  ___  ___ ___ _  _ _  _____  |"
	      DB 13,10,10 DUP(' '),"| |   \| _ |_ _| \| | |/ / __| |"
	      DB 13,10,10 DUP(' '),"| | |) |   /| || .` | ' <\__ \ |"
	      DB 13,10,10 DUP(' '),"| |___/|_|_|___|_|\_|_|\_|___/ |"
	      DB 13,10,10 DUP(' '),"|                              |"
	      DB 13,10,10 DUP(' '),"|             MENU             |"
	      DB 13,10,10 DUP(' '),"================================$"
DRINKSMSG1 DB 13,10,13,10,12 DUP(' '),"------------------------------------"
	       DB 13,10,12 DUP(' '),"|No. |Food		     |Price(RM)|"
	       DB 13,10,12 DUP(' '),"------------------------------------"
	       DB 13,10,12 DUP(' '),"| 1. | Smoothies         | 8.00    |"
	       DB 13,10,12 DUP(' '),"| 2. | Iced Latte        | 9.00    |"
	       DB 13,10,12 DUP(' '),"| 3. | Hot Chocolate     | 9.00    |"
	       DB 13,10,12 DUP(' '),"| 4. | Lemon Tea         | 8.00    |"
	       DB 13,10,12 DUP(' '),"------------------------------------$"
DRINKSMSG2 DB 15 DUP(' '),"! ! Invalid input. Only option (1 - 4) accepted.$"

TAKEWAYMSG DB 15 DUP(' '),"Take Away ? (Y/N): $"
TAKEWAYTABLE DB 13,10,10 DUP(' '),"----------------------------------------------------"
			 DB 13,10,11 DUP(' '),"Packaging Fee",30 DUP(' '),"0.20"
			 DB 13,10,10 DUP(' '),"----------------------------------------------------$"

PAYMENTMSG DB 13,10,13,10,10 DUP(' '),"------------------------------------------"
	       DB 13,10,10 DUP(' '),"|	           PAYMENT                 |"
	       DB 13,10,10 DUP(' '),"------------------------------------------$"

PAYTABLE DB 13,10,13,10,10 DUP(' '),"----------------------------------------------------"
	     DB 13,10,11 DUP(' '),"Food",16 DUP(' '),"Qty  ","Price(RM)    ","Subtotal(RM)$"
PAYTABLELN DB 13,10,10 DUP(' '),"====================================================$"
PAYTABLE1 DB 11 DUP(' '),"Grand Total",30 DUP(' '),"$"
PAYMENTMSG1 DB 10 DUP(' '),"Sorry, purchase limit of RM 255.00 reached, please reorder.$"

CONFIRMMSG DB 15 DUP(' '),"Confirm (Y/N): $"

TAXMSG DB 13,10,13,10,10 DUP(' '),"------------------------------------------"
	   DB 13,10,10 DUP(' '),"|	          TAX CHARGE               |"
	   DB 13,10,10 DUP(' '),"------------------------------------------$"
TAXMSG1 DB 11 DUP(' '),"Subtotal: $"
TAXMSG2 DB 13,10,11 DUP(' '),"Service Tax (SST 6%): $"
TAXMSG3 DB 13,10,11 DUP(' '),"Service charge (10%): $"
TAXMSG4 DB 11 DUP(' '),"Total (added tax): $"
SSTTAX DW 0
SERVICETAX DW 0

DISCOUNTMSG DB 13,10,13,10,10 DUP(' '),"------------------------------------------"
	        DB 13,10,10 DUP(' '),"|            Discount Voucher            |"
	        DB 13,10,10 DUP(' '),"------------------------------------------"
			DB 13,10,10 DUP(' '),"| Member Discount - 10%                  |"
			DB 13,10,10 DUP(' '),"| SAVE7 Voucher for purchase over RM 25  |"
			DB 13,10,10 DUP(' '),"------------------------------------------$"
DISCOUNTMSG1 DB 11 DUP(' '),"Membercard (Y/N): $"
DISCOUNTMSG2 DB 13,10,13,10,11 DUP(' '),"Discount: $"
DISCOUNTMSG3 DB 11 DUP(' '),"Total Payment: $"

TRANSACMSG DB 13,10,13,10,20 DUP(' '),"Payment Option: "
		   DB 13,10,20 DUP(' '),"1. Card"
		   DB 13,10,20 DUP(' '),"2. Cash"
		   DB 13,10,20 DUP(' '),"3. E-Wallet$"
TRANSACMSG1 DB 15 DUP(' '),"! ! Invalid input. Only option (1 - 3) accepted.$"
TRANSACMSG2 DB 13,10,13,10,15 DUP(' '),"------------------------------------------"
	        DB 13,10,15 DUP(' '),"|        Transaction Processing          |"
	        DB 13,10,15 DUP(' '),"------------------------------------------$"
TRANSACMSG3 DB 25 DUP(' '),"Transaction Successful !",13,10,13,10,13,10, "$"
TRANSACMSG4 DB 15 DUP (' '),"Enter amount paid (max limit 300.00): $"
TRANSACMSG5 DB 13,10,13,10,15 DUP (' '),"Balance: $"
TRANSACMSG6 DB 15 DUP (' '),"! Invalid input, cash range (000.00 -- 300.00) only.$"
TRANSACMSG7 DB 15 DUP (' '),"! Cash not enough. Please reenter.$"
TRANSACCHS DB 0
CASHPAID DW 0
BALANCE DW 0

STOCKMSG DB 13,10,13,10,5 DUP(' '),"======================================================================="
         DB 13,10,5 DUP(' '), "|  ____  _             _      _____               _    _              |"
		 DB 13,10,5 DUP(' '), "| / ___|| |_ ___   ___| | __ |_   _| __ __ _  ___| | _(_)_ __   __ _  |"
		 DB 13,10,5 DUP(' '), "| \___ \| __/ _ \ / __| |/ /   | || '__/ _` |/ __| |/ / | '_ \ / _` | |"
		 DB 13,10,5 DUP(' '), "|  ___) | || (_) | (__|   <    | || | | (_| | (__|   <| | | | | (_| | |"
		 DB 13,10,5 DUP(' '), "| |____/ \__\___/ \___|_|\_\   |_||_|  \__,_|\___|_|\_\_|_| |_|\__, | |"
		 DB 13,10,5 DUP(' '), "|                                                              |___/  |"
		 DB 13,10,5 DUP(' '),"=======================================================================$"
STOCKLINE DB 13,10,13,10 DUP(' '),"---------------------------------------------------------------$"
STOCKMSG1 DB 11 DUP(' '),"Items Sold",12 DUP(' '),"Qty Sold",5 DUP(' '),"Qty Left$"
STOCKMSG2 DB 5 DUP(' '),"!! Lack of stock$"

CURRENTUSER DW 0	
SLSRPQTY DB 0
REVENUE DW 0
BESTQTY DB 0
BESTINDEX DW 0
SALESMSG DB 13,10,13,10,8 DUP(' '),"================================================================"
         DB 13,10,8 DUP(' '), "|   _____       _             _____                       _    |"
         DB 13,10,8 DUP(' '), "|  / ____|     | |           |  __ \                     | |   |"
         DB 13,10,8 DUP(' '), "| | (___   __ _| | ___  ___  | |__) |___ _ __   ___  _ __| |_  |"
         DB 13,10,8 DUP(' '), "|  \___ \ / _` | |/ _ \/ __| |  _  // _ \ '_ \ / _ \| '__| __| |"
         DB 13,10,8 DUP(' '), "|  ____) | (_| | |  __/\__ \ | | \ \  __/ |_) | (_) | |  | |_  |"
         DB 13,10,8 DUP(' '), "| |_____/ \__,_|_|\___||___/ |_|  \_\___| .__/ \___/|_|   \__| |"
         DB 13,10,8 DUP(' '), "|                                       | |                    |"                                                         
         DB 13,10,8 DUP(' '), "|                                       |_|                    |"
		 DB 13,10,8 DUP(' '), "================================================================$"
SALESMSG1 DB 5 DUP(' '), "Total Customers: $"
SALESLINE DB 13,10,3 DUP(' '), "-------------------------------------------------------------------------$"
SALESMSG2 DB 5 DUP(' '), "Item",27 DUP(' '), "Qty Sold",5 DUP(' '),"Price(RM)", 8 DUP(' '),"Total$"
SALESMSG3 DB 5 DUP(' '), "Total Revenue: ", 46 DUP (' '), "$"
SALESMSG4 DB 18 DUP(' '), "Date(DD-MM-YY): $"
SALESMSG5 DB 5 DUP(' '),"Person in Charge: $"
SALESMSG6 DB 5 DUP(' '), "Best Seller: $"

ADMINVALID DB 13,10,13,10,15 DUP(' '),"------------------------------------------"
	        DB 13,10,15 DUP(' '),"|        Administrator Validation        |"
	        DB 13,10,15 DUP(' '),"------------------------------------------$"
ADMINVALID1 DB 13,10,13,10,15 DUP(' '),"User ID: admin"
            DB 13,10,15 DUP(' '),"Password: $"
ADMINVALID2 DB 15 DUP(' '),"Incorrect password, cannot proceed. Please try again.$"

REGISTERMSG DB 13,10,13,10,15 DUP(' '),"========================================"
            DB 13,10,15 DUP (' '),"|  ____            _     _             |"
		    DB 13,10,15 DUP (' '),"| |  _ \ ___  __ _(_)___| |_ ___ _ __  |"
		    DB 13,10,15 DUP (' '),"| | |_) / _ \/ _` | / __| __/ _ \ '__| |"
		    DB 13,10,15 DUP (' '),"| |  _ <  __/ (_| | \__ \ ||  __/ |    |"
		    DB 13,10,15 DUP (' '),"| |_| \_\___|\__, |_|___/\__\___|_|    |"
		    DB 13,10,15 DUP (' '),"|            |___/                     |"
		    DB 13,10,15 DUP (' '),"========================================$"
REGISTERMSG1 DB 15 DUP (' '),"User ID: $"
REGISTERMSG2 DB 15 DUP (' '),"Enter password (8 characters): $"
REGISTERMSG3 DB 15 DUP (' '),"Confirm password: $"
REGISTERMSG4 DB 15 DUP (' '),"Enter role [S]erver / [C]ashier: $"
REGISTERMSG5 DB 15 DUP (' '),"!! Invalid input. Only 'S' or 'C' accepted.$"
REGISTERMSG6 DB 15 DUP (' '),"!! Password not validated, please try again. $"
REGISTERMSG7 DB 20 DUP (' '),"Register successful!$"
REGISTERMSG8 DB 15 DUP (' '),"Sorry, maximum number of users reached.$"
REGISTERED DB 0

QUITMSG DB 13,10,13,10,10 DUP(' '),"=============================================="
        DB 13,10,10 DUP(' '),"|                System Close                |"
        DB 13,10,10 DUP(' '),"|  _____ _              _    __   __         |"
        DB 13,10,10 DUP(' '),"| |_   _| |_  __ _ _ _ | |__ \ \ / ___ _  _  |"
        DB 13,10,10 DUP(' '),"|   | | | ' \/ _` | ' \| / /  \ V / _ | || | |"
        DB 13,10,10 DUP(' '),"|   |_| |_||_\__,_|_||_|_\_\   |_|\___/\_,_| |"
        DB 13,10,10 DUP(' '),"|                                            |"
        DB 13,10,10 DUP(' '),"| for using Daily Fix Restaurant POS System  |"
        DB 13,10,10 DUP(' '),"|              Have a nice day!              |"
        DB 13,10,10 DUP(' '),"==============================================$"

.code
MAIN PROC FAR
MOV AX,@data
MOV DS,AX

;-----------------User Login-----------------------
START:
MOV AH,09H		;display intro and login message
LEA DX,UIMSG
INT 21H
LEA DX,LOGMSG
INT 21H

LOGIN:
   MOV AH,09H	;prompt user id input
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE 
   INT 21H
   MOV BH,0       ;color
   MOV BL,LGREEN
   MOV CX,20
   INT 10H
   LEA DX,LOGMSG1
   INT 21H

MOV CX,5		;loop 5 times (id -> 5 characters)
MOV SI,0		;for array counter

INPUTID:
   MOV AH,01H
   INT 21H
   MOV IID[SI],AL
   INC SI
   LOOP INPUTID
MOV IID[5],'$'

MOV AH,09H		;prompt password input
LEA DX,NEWLINE
INT 21H
MOV BH,0       ;color
MOV BL,LGREEN
MOV CX,26
INT 10H
LEA DX,LOGMSG2
INT 21H

MOV CX,8		;loop 8 times (password -> max 8 characters)
MOV SI,0		;for array counter

INPUTPSW:
   MOV AH,07H
   INT 21H
   MOV IPSW[SI],AL
   MOV AH,02H
   MOV DL,'*'
   INT 21H
   INC SI
   LOOP INPUTPSW
MOV IPSW[SI],'$'

;-----------------Login Validation------------------
MOV CX,NUMUSERS		;loop for each user ID
MOV SI,0			;handle user ID array

VLDID:
   MOV DI,0			;loop character by character
VLDID_LOOP:
   MOV AX,SI		;SI indicates which userid
   MUL ID_LENGTH	;each userid stored in a constant length
   ADD AX,DI
   MOV BX,AX
   MOV AL,USERID[BX]	;hold current id character to be check
   CMP AL,'$'			;check if end of string
   JE VLDPSW
   CMP AL,IID[DI]	;check if same char
   JNE INC_SI		;if not, increase SI (next id)
   INC DI			;if yes, increase DI (next char)
   JMP VLDID_LOOP

VLDPSW:
   MOV DI,0
VLDPSW_LOOP:
   MOV AX,SI		;SI indicates which password of current user
   MOV CURRENTUSER,SI
   MUL PSW_LENGTH	;each password stored in a constant length
   ADD AX,DI
   MOV BX,AX
   MOV AL,USERPSW[BX]
   CMP AL,'$'
   JE LOGIN_SUCCESS	
   CMP AL,IPSW[DI]
   JNE LOGIN_FAIL
   INC DI
   JMP VLDPSW_LOOP

LOGIN_SUCCESS:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0			;color
   MOV BL,YELLOW
   MOV CX,27
   INT 10H
   LEA DX,LOGMSG3
   INT 21H
   JMP LOOP_MENU

LOGIN_FAIL:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0			;color
   MOV BL,RED
   MOV CX,56
   INT 10H
   LEA DX,LOGMSG4
   INT 21H
   JMP LOGIN

INC_SI:				;increase SI (check for next userid)
   INC SI
   CMP SI,NUMUSERS
   JB VLDID
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0			;color
   MOV BL,RED
   MOV CX,56
   INT 10H
   LEA DX,LOGMSG4
   INT 21H
   JMP LOGIN

;------------------MAIN Menu-------------------
LOOP_MENU:		 ;start of main menu loop
   ;---------initialize data---------
   MOV CX,12
   MOV SI,0
   INIUSER_CHS:		;initialize user food choice 
	MOV [USER_CHS + SI],0
	INC SI
	LOOP INIUSER_CHS
   MOV SUBTOTAL,0
   MOV SSTTAX,0
   MOV SERVICETAX,0
   MOV DISCOUNT,0
   MOV CASHPAID,0
   MOV BALANCE,0
   ;----------------------------------

 MOV AH,09H			;display intro 
 LEA DX,UIMSG
 INT 21H

MENU:
   MOV AH,09H
   LEA DX,MAINMSG	;display main menu choices
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0			;color
   MOV BL,LGREEN
   MOV CX,34
   INT 10H
   LEA DX,MAINMSG1
   INT 21H

   MOV AH,01H
   INT 21H
   MOV MAINCHS,AL
   SUB MAINCHS,30H

;Validation Choice Input (1 - 6)
CMP MAINCHS,1
JE ORDER
JB MAIN_ERROR
CMP MAINCHS,2
JE TOSTOCKTRACK
CMP MAINCHS,3
JE TOSALESREPORT
CMP MAINCHS,4
JE TOREGISTER
CMP MAINCHS,5
JE TOSTART
CMP MAINCHS,6
JE QUIT_PROG
JA MAIN_ERROR

QUIT_PROG:
   JMP EXIT

TOSTOCKTRACK:		;unconditional jump used to solve "jump out of range" problem
   JMP STOCKTRACK

TOSALESREPORT:
   JMP SALESREPORT

TOREGISTER:
   JMP REGISTERING

TOSTART:
   JMP START

MAIN_ERROR:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0			;color
   MOV BL,RED
   MOV CX,62
   INT 10H
   LEA DX,MAINMSG2
   INT 21H
   JMP MENU

;------------------ORDER-------------------
ORDER:
   MOV AH,09H
   LEA DX,ORDERMSG
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0       ;color
   MOV BL,LGREEN
   MOV CX,34
   INT 10H
   LEA DX,ORDERMSG1
   INT 21H

   MOV AH,01H
   INT 21H
   MOV ORDERCHS,AL
   SUB ORDERCHS,30H

;Validation Choice Input (1 - 3)
CMP ORDERCHS,1
JE DISHES
JB ORDER_ERROR
CMP ORDERCHS,2
JE TODESSERT
CMP ORDERCHS,3
JE TODRINKS
JA ORDER_ERROR

TODESSERT:
JMP DESSERT

TODRINKS:
JMP DRINKS

ORDER_ERROR:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0		;color
   MOV BL,RED
   MOV CX,62
   INT 10H
   LEA DX,ORDERMSG2
   INT 21H
   JMP ORDER

;------------------DISHES-----------------
DISHES:
MOV AH,09H				;display intro and dishes menu
LEA DX,DISHMSG
INT 21H
LEA DX,DISHMSG1
INT 21H

DISHES_OPT:
   MOV AH,09H			;prompt for food option 
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0				;color
   MOV BL,LGREEN
   MOV CX,28
   INT 10H
   LEA DX,DISHMSG2
   INT 21H

   MOV AH,01H
   INT 21H
   MOV FOODCHS,AL
   SUB FOODCHS,30H

;Validation Choice Input (1 - 5)
CMP FOODCHS,1
JB DISH_ERROR
CMP FOODCHS,5
JA DISH_ERROR
CALL INPUT_QUANTITY		;ask for quantity input 

STOCK_CHECK:
SUB FOODCHS,1			;handle food as array
MOV BH,0
MOV BL,FOODCHS
MOV AL,QUANTITY

CMP FOOD_STOCK[BX],AL	;check for stock  
JB STOCK_ERROR			;if foodstock is less than input quantity, error prompt
ADD USER_CHS[BX],AL		;else, put quantity chosen in the array
SUB FOOD_STOCK[BX],AL	;update and minus the quantity chosen from food stock

CALL ADD_ORDER			;ask whether to continue adding order

DISH_ERROR:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0				;color
   MOV BL,RED
   MOV CX,63
   INT 10H
   LEA DX,DISHMSG3
   INT 21H
   JMP DISHES_OPT

STOCK_ERROR:
   CALL DISPLAY_STOCK	;display error message and stock left
   JMP DISHES_OPT

;-----------------DESSERT-----------------
DESSERT:	
MOV AH,09H			;display intro and dessert menu
LEA DX,DESSERTMSG
INT 21H
LEA DX,DESSERTMSG1
INT 21H

DESSERT_OPT:
   MOV AH,09H		;prompt for food option 
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0			;color
   MOV BL,LGREEN
   MOV CX,28
   INT 10H
   LEA DX,DISHMSG2
   INT 21H
   
   MOV AH,01H
   INT 21H
   MOV FOODCHS,AL
   SUB FOODCHS,30H

;Validation Choice Input (1 - 3)
CMP FOODCHS,1
JB DESSERT_ERROR
CMP FOODCHS,3
JA DESSERT_ERROR
CALL INPUT_QUANTITY

STOCK_CHECK1:
ADD FOODCHS,4			;handle food as array
MOV BH,0
MOV BL,FOODCHS
MOV AL,QUANTITY

CMP FOOD_STOCK[BX],AL	;check for stock 
JB STOCK_ERROR1
ADD USER_CHS[BX],AL
SUB FOOD_STOCK[BX],AL

CALL ADD_ORDER

DESSERT_ERROR:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0				;color
   MOV BL,RED
   MOV CX,63
   INT 10H
   LEA DX,DESSERTMSG2
   INT 21H
   JMP DESSERT_OPT

STOCK_ERROR1:
   CALL DISPLAY_STOCK
   JMP DESSERT_OPT

;----------------DRINKS-------------------
DRINKS:
MOV AH,09H				;display intro and drinks menu
LEA DX,DRINKSMSG
INT 21H
LEA DX,DRINKSMSG1
INT 21H

DRINKS_OPT:
   MOV AH,09H			;prompt for food option 
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   MOV BH,0				;color
   MOV BL,LGREEN
   MOV CX,28
   INT 10H
   LEA DX,DISHMSG2
   INT 21H 

   MOV AH,01H
   INT 21H
   MOV FOODCHS,AL
   SUB FOODCHS,30H

;Validation Choice Input (1 - 4)
CMP FOODCHS,1
JB DRINKS_ERROR
CMP FOODCHS,4
JA DRINKS_ERROR
CALL INPUT_QUANTITY

STOCK_CHECK2:
ADD FOODCHS,7			;handle food as array
MOV BH,0
MOV BL,FOODCHS
MOV AL,QUANTITY

CMP FOOD_STOCK[BX],AL	;check for stock 
JB STOCK_ERROR2
ADD USER_CHS[BX],AL	
SUB FOOD_STOCK[BX],AL

CALL ADD_ORDER

DRINKS_ERROR:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0				;color
   MOV BL,RED
   MOV CX,63
   INT 10H
   LEA DX,DRINKSMSG2
   INT 21H
   JMP DRINKS_OPT

STOCK_ERROR2:
   CALL DISPLAY_STOCK
   JMP DRINKS_OPT

;--------------------PROCEDURE CALLING (Menu)--------------------------
INPUT_QUANTITY PROC
INPUTQTY:
   MOV AH,09H			;prompt for quantity
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0				;color
   MOV BL,LGREEN
   MOV CX,39
   INT 10H
   LEA DX,DISHMSG4
   INT 21H

   MOV AH,01H
   INT 21H
   MOV QUANTITY,AL
   SUB QUANTITY,30H

;Validation Quantity Input (1 - 9)
CMP QUANTITY,1
JB QUANTITY_ERROR
CMP QUANTITY,9
JA QUANTITY_ERROR
JMP EXIT_IPTQTY

QUANTITY_ERROR:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0				;color
   MOV BL,RED
   MOV CX,65
   INT 10H
   LEA DX,DISHMSG6
   INT 21H
   JMP INPUTQTY

EXIT_IPTQTY:
   RET
INPUT_QUANTITY ENDP


ADD_ORDER PROC
ADDORDER:
   MOV AH,09H			;prompt for add order or not
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0				;color
   MOV BL,CYAN
   MOV CX,32
   INT 10H
   LEA DX,DISHMSG7
   INT 21H

   MOV AH,01H
   INT 21H
   CMP AL,'Y'
   JE CONTINUE
   CMP AL,'y'
   JE CONTINUE			;if YES, continue jump back to ORDER
   CMP AL,'N'
   JE TOTAWY
   CMP AL,'n'
   JE TOTAWY			;if NO, proceed to ask whether to take away

ADDORD_ERROR:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0				;color
   MOV BL,RED
   MOV CX,49
   INT 10H
   LEA DX,DISHMSG8
   INT 21H
   JMP ADDORDER

CONTINUE:
   JMP ORDER

TOTAWY:
   JMP TAWY

   RET
ADD_ORDER ENDP


DISPLAY_STOCK PROC
   MOV DI,BX
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0				;color
   MOV BL,RED
   MOV CX,71
   INT 10H
   LEA DX,DISHMSG5
   INT 21H

   MOV AL,FOOD_STOCK[DI]	;display food stock left
   ADD AL,30H
   
   MOV AH,02H
   MOV DL,AL
   INT 21H
   
   RET
DISPLAY_STOCK ENDP

;----------------PAYMENT-------------------
TAWY:
MOV AH,09H		;ask for take away or not?
LEA DX,NEWLINE
INT 21H
LEA DX,NEWLINE
INT 21H
MOV BH,0		;color
MOV BL,CYAN
MOV CX,33
INT 10H
LEA DX,TAKEWAYMSG
INT 21H

MOV AH,01H
INT 21H
VALIDYN:		;validate for Y/N
   CMP AL,'Y'	;if valid, continue code
   JE PAYMENT
   CMP AL,'y'
   JE PAYMENT
   CMP AL,'N'
   JE PAYMENT
   CMP AL,'n'
   JE PAYMENT

   MOV AH,09H	;else prompt error and loop back
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0     ;color
   MOV BL,RED
   MOV CX,49
   INT 10H
   LEA DX,DISHMSG8
   INT 21H
   JMP TAWY

PAYMENT:
   MOV TAKEAWAY,AL
   MOV AH,09H
   LEA DX,PAYMENTMSG
   INT 21H

   MOV AH,09H
   LEA DX,PAYTABLE
   INT 21H
   LEA DX,TABLELINE
   INT 21H

   MOV CX,12		;loop 12 times for each food items
   MOV SI,0			;handle array
CHECK_PRINT:
   MOV BL,USER_CHS[SI]
   CMP BL,0			;if quantity chosen = 0, no need print out
   JE SKIP_PRINT
   JMP PRINT_FOOD

SKIP_PRINT:			;proceed to check for the next index (food items)
   DEC CX			;update looping counter and index
   INC SI
   CMP CX,0
   JNE CHECK_PRINT
   JMP PRINT_TAKEAWAY

PRINT_FOOD:
   MOV AH,09H		;print food name
   LEA DX,NEWLINE
   INT 21H
   LEA DX,TENSPACE
   INT 21H
   MOV AX,SI		;handling string array (every 17 characters in FOOD_NAME)
   MOV BX,17
   MUL BX
   MOV BX,AX
   MOV AH,09H
   LEA DX,FOOD_NAME[BX]
   INT 21H

   MOV AH,09H
   LEA DX,FIVESPACE
   INT 21H
   MOV AX,0				;clear AX
   MOV AL,USER_CHS[SI]  ;Put quantity into AL
   DIV TEN	
   ADD AX,3030H			;convert into ASCII
   MOV Q1,AL			;store AL (Quotient)
   MOV R1,AH			;store AH (Remainder)

   MOV AH,02H		;print quantity
   MOV DL,Q1
   INT 21H
   MOV DL,R1
   INT 21H

   MOV AH,09H
   LEA DX,FIVESPACE
   INT 21H
   MOV AX,0			
   MOV AL,FOOD_PRICE[SI]
   DIV TEN
   ADD AX,3030H
   MOV Q1,AL
   MOV R1,AH

   MOV AH,02H		;print price
   MOV DL,Q1
   INT 21H
   MOV DL,R1
   INT 21H
   MOV AH,09H
   LEA DX,DOT
   INT 21H
   ;-------Calculate Subtotal------
   MOV BX,0
   MOV AX,0	;Clear data
   MOV AL,USER_CHS[SI]	;put quantity
   MOV BL,FOOD_PRICE[SI]
   MUL BL				;multiply by price
   MOV BX,AX
   ADD SUBTOTAL,AX

   MOV AX,0		;clear data
   MOV AX,BX
   DIV TEN		;get digit one by one
   MOV Q1,AL	;quotient
   MOV R1,AH	;remainder

   MOV AX,0
   MOV AL,Q1
   DIV TEN
   MOV Q2,AL
   MOV R2,AH
   
   ADD Q2,30H	;convert to ASCII
   ADD R2,30H
   ADD R1,30H

   MOV AH,09H
   LEA DX,TENSPACE
   INT 21H
   MOV AH,02H
   CMP Q2,"0"	;if not 3 digit, display only 2 digit
   JE SKIP_Q2
   MOV DL,Q2
   INT 21H
SKIP_Q2:
   MOV DL,R2
   INT 21H
   MOV DL,R1
   INT 21H

   MOV AH,09H
   LEA DX,DOT
   INT 21H
   JMP SKIP_PRINT

PRINT_TAKEAWAY:
   CMP TAKEAWAY,'N'		;if not taking away, no need to print packaging fee
   JE PRINT_GRANDTT
   CMP TAKEAWAY,'n'
   JE PRINT_GRANDTT

   MOV AH,09H
   LEA DX,TAKEWAYTABLE
   INT 21H  
   
PRINT_GRANDTT:
   MOV AX,0
   MOV AX,SUBTOTAL		
   MUL HUNDRED			;it is float point number (handle it by making it into integer, x100)
   CMP TAKEAWAY,'N'
   JE GRANDTT		
   CMP TAKEAWAY,'n'
   JE GRANDTT
   ADD AX,20			;+0.20 into subtotal
   						;e.g. 16900 (169.00) --> 16900+20 --> 16920 (169.20)
GRANDTT:
   MOV SUBTOTAL,AX
   MOV AH,09H
   LEA DX,PAYTABLELN
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0				;color
   MOV BL,LGREEN
   MOV CX,58
   INT 10H
   LEA DX,PAYTABLE1
   INT 21H

   MOV AX,0
   MOV VAR1,0
   MOV DX,0
   MOV AX,SUBTOTAL
   DIV HUNDRED		;cents (remainder) now in DX
   MOV CENTS,DL		;20
   MOV VAR1,AX		;169

   MOV AX,0
   MOV AX,VAR1
   DIV TEN		;divide AX(quotient), get digit one by one
   MOV Q1,AL	;quotient 16
   MOV R1,AH	;remainder 9

   MOV AX,0
   MOV AL,Q1
   DIV TEN
   MOV Q2,AL	;1
   MOV R2,AH	;6

   ADD Q2,30H	;convert to ASCII
   ADD R2,30H
   ADD R1,30H

   MOV AH,02H
   CMP Q2,"0"	;if not 3 digit, display only 2 digit
   JE SKIP_Q2_1
   MOV DL,Q2
   INT 21H
   JMP CONTINUE12
SKIP_Q2_1:
   MOV DL," "
   INT 21H
CONTINUE12:
   MOV DL,R2
   INT 21H
   MOV DL,R1
   INT 21H
   MOV DL,"."
   INT 21H

   MOV AX,0
   MOV AL,CENTS
   DIV TEN
   MOV Q3,AL
   MOV R3,AH

   ADD Q3,30H
   ADD R3,30H

   MOV AH,02H
   MOV DL,Q3
   INT 21H
   MOV DL,R3
   INT 21H

   MOV AH,09H
   LEA DX,PAYTABLELN
   INT 21H

   CMP SUBTOTAL,25500
   JA EXCEED_PCHSLIMIT
   JMP CONFIRMPAY

EXCEED_PCHSLIMIT:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0			;color
   MOV BL,YELLOW
   MOV CX,69
   INT 10H
   LEA DX,PAYMENTMSG1
   INT 21H
   LEA DX,CONTMSG
   INT 21H
   MOV AH,01H
   INT 21H
   JMP CANCEL_ORDER

CONFIRMPAY:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0			;color
   MOV BL,CYAN
   MOV CX,30
   INT 10H
   LEA DX,CONFIRMMSG
   INT 21H

   MOV AH,01H
   INT 21H
				
   CMP AL,'Y'	;validate for Y/N
   JE TAXCHARGE	;if CONFIRM=Y, proceed to tax
   CMP AL,'y'
   JE TAXCHARGE
   CMP AL,'N'	;if CONFIRM=N, go to cancel order
   JE CANCEL_ORDER
   CMP AL,'n'
   JE CANCEL_ORDER

   MOV AH,09H	;else prompt error and loop back
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0       ;color
   MOV BL,RED
   MOV CX,49
   INT 10H
   LEA DX,DISHMSG8
   INT 21H
   JMP CONFIRMPAY

CANCEL_ORDER:
   MOV CX,12	;loop 12 times for each food items
   MOV SI,0		;handle array
ADDBKSTOCK:		;add back food qty chosen by user into stock
   MOV AL,FOOD_STOCK[SI]
   ADD AL,USER_CHS[SI]
   MOV FOOD_STOCK[SI],AL
   INC SI
   LOOP ADDBKSTOCK
JMP LOOP_MENU

TAXCHARGE:
   INC CUSTOMERS
   MOV AH,09H
   LEA DX,TAXMSG
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0			;color
   MOV BL,LGREEN
   MOV CX,21
   INT 10H
   LEA DX,TAXMSG1
   INT 21H

   ;-------PRINTSUBTOTAL-----
   MOV AH,02H
   CMP Q2,"0"	;if not 3 digit, display only 2 digit
   JE SKIP_Q2_2
   MOV DL,Q2
   INT 21H
SKIP_Q2_2:
   MOV DL,R2
   INT 21H
   MOV DL,R1
   INT 21H
   MOV DL,"."
   INT 21H
   MOV DL,Q3
   INT 21H
   MOV DL,R3
   INT 21H

   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   LEA DX,TABLELINE
   INT 21H
   LEA DX,TAXMSG2
   INT 21H

;--------------CALCULATE SST----------------
MOV AX,0
MOV AX,SUBTOTAL	;e.g. 24920 
CMP TAKEAWAY,'N'
JE SKIPSUB
CMP TAKEAWAY,'n'
JE SKIPSUB
SUB AX,20		;take off cents for easier calculation
SKIPSUB:
DIV HDR			;24900 / 100 = 249 
MOV BX,AX

MOV AX,0		;Clear data
MOV AX,BX
MUL SIX			;249 X 6 = 1494

MOV SSTTAX,AX
CMP TAKEAWAY,'N'
JE SKIPADD		;Since 0.20 x 0.06 is always 0.01
CMP TAKEAWAY,'n'
JE SKIPADD
ADD SSTTAX,1	;only add 0.01 when there is takeway
				;1494 + 1 = 1495
SKIPADD:
MOV AX,0
MOV AX,SSTTAX
DIV HDR		;1495 / 100 = 14.95
MOV Q1,AL		;14
MOV CENTS,AH	;95

MOV AX,0
MOV AL,Q1		
DIV TEN
MOV Q1,AL		;1
MOV R1,AH		;4

ADD Q1,30H
ADD R1,30H

MOV AH,02H
CMP Q1,"0"
JE SKIP_Q1		
MOV DL,Q1
INT 21H
SKIP_Q1:
   MOV DL,R1
   INT 21H
   MOV DL,"."
   INT 21H

MOV AX,0
MOV AL,CENTS
DIV TEN			
MOV Q2,AL		;9
MOV R2,AH		;5

ADD Q2,30H
ADD R2,30H

MOV AH,02H
MOV DL,Q2
INT 21H
MOV DL,R2
INT 21H

;----------CALCULATE Service Charge--------
MOV AH,09H
LEA DX,TAXMSG3
INT 21H

MOV AX,0
MOV AX,SUBTOTAL	;e.g. 24920
CMP TAKEAWAY,'N'
JE SKIPSUB1
CMP TAKEAWAY,'n'
JE SKIPSUB1
SUB AX,20		;take off cents for easier calculation
SKIPSUB1:
DIV HDR			;24900 / 100 = 249
MOV BX,AX

MOV AX,0		;Clear data
MOV AX,BX
MUL TEN			;249 X 10 = 2490

MOV SERVICETAX,AX
CMP TAKEAWAY,'N'
JE SKIPADD1 	;Since 0.20 x 0.10 is always 0.02
CMP TAKEAWAY,'n'
JE SKIPADD1
ADD SERVICETAX,2	;only add 0.02 when there is takeway

SKIPADD1:
MOV AX,0
MOV AX,SERVICETAX
DIV HDR			;2492 / 100 = 24.92
MOV Q1,AL		;24
MOV CENTS,AH	;92

MOV AX,0
MOV AL,Q1		
DIV TEN
MOV Q1,AL		;2
MOV R1,AH		;4

MOV AX,0
MOV AL,CENTS
DIV TEN			
MOV Q2,AL		;9
MOV R2,AH		;2

ADD Q1,30H
ADD R1,30H
ADD Q2,30H
ADD R2,30H

MOV AH,02H
CMP Q1,"0"
JE SKIP_Q1_1	
MOV DL,Q1
INT 21H
SKIP_Q1_1:
   MOV DL,R1
   INT 21H
   MOV DL,"."
   INT 21H
   MOV DL,Q2
   INT 21H
   MOV DL,R2
   INT 21H

MOV AH,09H
LEA DX,TABLELINE
INT 21H
LEA DX,NEWLINE
INT 21H
MOV BH,0       ;color
MOV BL,LGREEN
MOV CX,29
INT 10H
LEA DX,TAXMSG4
INT 21H

;-------total after tax-----------
MOV AX,0
MOV AX,SUBTOTAL		;add SSTTAX and SERVICETAX calculated into SUBTOTAL
ADD AX,SSTTAX
ADD AX,SERVICETAX
MOV SUBTOTAL,AX

MOV AX,0			;display subtotal
MOV DX,0
MOV AX,SUBTOTAL
DIV HUNDRED
MOV VAR1,AX
MOV CENTS,DL

MOV AX,0
MOV AX,VAR1
DIV TEN
MOV Q1,AL
MOV R1,AH

MOV AX,0
MOV AL,Q1
DIV TEN
MOV Q2,AL
MOV R2,AH

ADD Q2,30H
ADD R2,30H
ADD R1,30H

MOV AH,02H
CMP Q2,"0"
JE SKIP_Q2_3
MOV DL,Q2
INT 21H
SKIP_Q2_3:
MOV DL,R2
INT 21H
MOV DL,R1
INT 21H
MOV DL,"."
INT 21H

MOV AX,0
MOV AL,CENTS
DIV TEN
MOV Q1,AL
MOV R1,AH
ADD Q1,30H
ADD R1,30H

MOV AH,02H
MOV DL,Q1
INT 21H
MOV DL,R1
INT 21H

MOV AH,09H
LEA DX,TABLELINE
INT 21H

;-----------Membercard---------
ASKMEMBER:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0       ;color
   MOV BL,CYAN
   MOV CX,29
   INT 10H
   LEA DX,DISCOUNTMSG1
   INT 21H

   MOV AH,01H
   INT 21H
			
CMP AL,'Y'	;---Validation (Y/N)
JE MEMBERDISC	;if YES, discount 10%
CMP AL,'y'
JE MEMBERDISC
CMP AL,'N'	;if NO, check for SAVE7 discount
JE SAVE7
CMP AL,'n'
JE SAVE7

MOV AH,09H	;else prompt error and loop back
LEA DX,NEWLINE
INT 21H
MOV BH,0       ;color
MOV BL,RED
MOV CX,49
INT 10H
LEA DX,DISHMSG8
INT 21H
JMP ASKMEMBER

MEMBERDISC:
   MOV AX,0
   MOV AX,SUBTOTAL	;4315 
   DIV HDR			;4315 / 100 = 43.15
   MOV Q1,AL		;43
   MOV CENTS,AH		;15

   MOV AX,0
   MOV AL,CENTS
   DIV TEN			;15 / 10 = 1.5
   MOV Q2,AL		;1

   MOV AX,0		
   MOV AL,Q1		;43
   MUL TEN			;43 X 10 = 430
   ADD AL,Q2		;431 (10% of 4315)
   MOV DISCOUNT,AX

SAVE7:
   CMP SUBTOTAL,2500	;if not more than 2500 (25.00), direct display discount
   JNG DISPLAY_DISC
   ADD DISCOUNT,700		;if exceed 2500, add 700 (7.00) to discount
   
;----------Display Discount--------
DISPLAY_DISC:
   MOV AH,09H
   LEA DX,DISCOUNTMSG
   INT 21H
   LEA DX,DISCOUNTMSG2
   INT 21H

   MOV AX,0
   MOV AX,DISCOUNT
   DIV HDR
   MOV Q1,AL
   MOV CENTS,AH

   MOV AX,0
   MOV AL,Q1
   DIV TEN
   MOV Q1,AL
   MOV R1,AH

   MOV AX,0
   MOV AL,CENTS
   DIV TEN
   MOV Q2,AL
   MOV R2,AH

   ADD Q1,30H
   ADD R1,30H
   ADD Q2,30H
   ADD R2,30H

   MOV AH,02H
   CMP Q1,"0"
   JE SKIP_Q1_2
   MOV DL,Q1
   INT 21H
SKIP_Q1_2:
   MOV DL,R1
   INT 21H
   MOV DL,"."
   INT 21H
   MOV DL,Q2
   INT 21H
   MOV DL,R2
   INT 21H

;----------Calculate Total Payment--------
MOV AX,0
MOV AX,SUBTOTAL
SUB AX,DISCOUNT		;minus discount from subtotal (total payment)
MOV SUBTOTAL,AX

MOV AH,09H
LEA DX,NEWLINE
INT 21H
LEA DX,NEWLINE
INT 21H
MOV BH,0			;color
MOV BL,LGREEN
MOV CX,26
INT 10H
LEA DX,DISCOUNTMSG3
INT 21H

MOV AX,0
MOV DX,0
MOV AX,SUBTOTAL
DIV HUNDRED
MOV VAR1,AX
MOV CENTS,DL

MOV AX,0
MOV AX,VAR1
DIV TEN
MOV Q1,AL
MOV R1,AH

MOV AX,0
MOV AL,Q1
DIV TEN
MOV Q2,AL
MOV R2,AH

ADD Q2,30H
ADD R2,30H
ADD R1,30H

MOV AH,02H
CMP Q2,"0"
JE SKIP_Q2_4
MOV DL,Q2
INT 21H
SKIP_Q2_4:
MOV DL,R2
INT 21H
MOV DL,R1
INT 21H
MOV DL,"."
INT 21H

MOV AX,0
MOV AL,CENTS
DIV TEN
MOV Q1,AL
MOV R1,AH
ADD Q1,30H
ADD R1,30H

MOV AH,02H
MOV DL,Q1
INT 21H
MOV DL,R1
INT 21H

;----------Payment Option--------
MOV AH,09H
LEA DX,TRANSACMSG
INT 21H

PAYOPT: 
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0				;color
   MOV BL,LGREEN
   MOV CX,28
   INT 10H
   LEA DX,DISHMSG2
   INT 21H

   MOV AH,01H
   INT 21H
   MOV TRANSACCHS,AL
   SUB TRANSACCHS,30H

   CMP TRANSACCHS,1
   JE ONLINEPAY
   JB TOPAYOPT_ERROR
   CMP TRANSACCHS,2		;cash pay requires balance calculation
   JE CASH_PAY
   CMP TRANSACCHS,3
   JE ONLINEPAY
   JA TOPAYOPT_ERROR

TOPAYOPT_ERROR:
   JMP PAYOPT_ERROR

ONLINEPAY:
   MOV AH,09H
   LEA DX,TRANSACMSG2
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0				;color
   MOV BL,YELLOW
   MOV CX,49
   INT 10H
   LEA DX,TRANSACMSG3
   INT 21H
   LEA DX,CONTMSG
   INT 21H

   MOV AH,01H
   INT 21H
   JMP LOOP_MENU

CASH_PAY:
   MOV AH,09H
   LEA DX,TRANSACMSG2
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0				;color
   MOV BL,LGREEN
   MOV CX,53
   INT 10H
   LEA DX,TRANSACMSG4
   INT 21H

   MOV AH,01H		;get input digit by digit
   INT 21H 
   MOV INPUT1,AL

   MOV AH,01H
   INT 21H 
   MOV INPUT2,AL

   MOV AH,01H
   INT 21H
   MOV INPUT3,AL

   MOV AH,02H
   MOV DL,"."
   INT 21H

   MOV AH,01H
   INT 21H
   MOV INPUT4,AL

   MOV AH,01H
   INT 21H
   MOV INPUT5,AL

   SUB INPUT1,30H	;convert ASCII to decimal
   SUB INPUT2,30H
   SUB INPUT3,30H
   SUB INPUT4,30H
   SUB INPUT5,30H

;------------validation cash paid (000.00 - 300.00)------
   CMP INPUT1,3
   JA TOCSHPAID_ERROR
   JE CHKIPT_MAX		;if first digit = 3, direct validate check for maximum amount
   CMP INPUT1,0
   JB TOCSHPAID_ERROR

CHKIPT2:
   CMP INPUT2,9
   JA TOCSHPAID_ERROR
   CMP INPUT2,0
   JB TOCSHPAID_ERROR
   
CHKIPT3:
   CMP INPUT3,9
   JA TOCSHPAID_ERROR
   CMP INPUT3,0
   JB TOCSHPAID_ERROR

CHKIPT4:
   CMP INPUT4,9
   JA TOCSHPAID_ERROR
   CMP INPUT4,0
   JB TOCSHPAID_ERROR

CHKIPT5:
   CMP INPUT5,9
   JA TOCSHPAID_ERROR
   CMP INPUT5,0
   JB TOCSHPAID_ERROR
   JMP CONTINUE3

CHKIPT_MAX:
   CMP INPUT2,0
   JNE TOCSHPAID_ERROR
   CMP INPUT3,0
   JNE TOCSHPAID_ERROR
   CMP INPUT4,0
   JNE TOCSHPAID_ERROR
   CMP INPUT5,0
   JNE TOCSHPAID_ERROR
   JMP CONTINUE3

TOCSHPAID_ERROR:
   JMP CSHPAID_ERROR

CONTINUE3:
   MOV AX,0			;convert the input digit into corresponding value
   MOV AL,INPUT1
   MUL TENTSD
   MOV CASHPAID,AX	;store in CASHPAID

   MOV AX,0
   MOV AL,INPUT2
   MUL THOUSAND
   ADD CASHPAID,AX

   MOV AX,0
   MOV AL,INPUT3
   MUL HUNDRED 
   ADD CASHPAID,AX

   MOV AX,0
   MOV AL,INPUT4
   MUL TEN
   ADD CASHPAID,AX

   MOV AX,0
   MOV AL,INPUT5
   ADD CASHPAID,AX

   MOV AX,0
   MOV AX,CASHPAID		;BALANCE = CASHPAID - SUBTOTAL
   SUB AX,SUBTOTAL
   MOV BALANCE,AX
   CMP BALANCE,0		;if less than 0, prompt insufficient error message
   JNGE TOINSUFFICIENT
   JMP DISPLAY_BALANCE

TOINSUFFICIENT:
   JMP INSUFFICIENT

DISPLAY_BALANCE:
   MOV AX,0
   MOV DX,0
   MOV AX,BALANCE
   DIV HUNDRED
   MOV VAR1,AX
   MOV CENTS,DL

   MOV AX,0
   MOV AX,VAR1
   DIV TEN
   MOV Q1,AL
   MOV R1,AH

   MOV AX,0
   MOV AL,Q1
   DIV TEN
   MOV Q2,AL
   MOV R2,AH

   ADD Q2,30H
   ADD R2,30H
   ADD R1,30H

   MOV AH,09H
   LEA DX,TRANSACMSG5
   INT 21H
   
   MOV AH,02H
   CMP Q2,"0"
   JE SKIP_Q2_5
   MOV DL,Q2
   INT 21H
SKIP_Q2_5:
   CMP R2,"0"
   JE SKIP_R2
   MOV DL,R2
   INT 21H
SKIP_R2:
   MOV DL,R1
   INT 21H
   MOV DL,"."
   INT 21H

   MOV AX,0
   MOV AL,CENTS
   DIV TEN
   MOV Q1,AL
   MOV R1,AH

   ADD Q1,30H
   ADD R1,30H

   MOV AH,02H
   MOV DL,Q1
   INT 21H
   MOV DL,R1
   INT 21H

   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0       ;color
   MOV BL,YELLOW
   MOV CX,49
   INT 10H
   LEA DX,TRANSACMSG3
   INT 21H
   LEA DX,CONTMSG
   INT 21H
   MOV AH,01H
   INT 21H
   JMP LOOP_MENU

PAYOPT_ERROR:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0       ;color
   MOV BL,RED
   MOV CX,63
   INT 10H
   LEA DX,TRANSACMSG1
   INT 21H
   JMP PAYOPT

CSHPAID_ERROR:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0       ;color
   MOV BL,RED
   MOV CX,67
   INT 10H
   LEA DX,TRANSACMSG6
   INT 21H
   JMP CASH_PAY

INSUFFICIENT:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0       ;color
   MOV BL,RED
   MOV CX,49
   INT 10H
   LEA DX,TRANSACMSG7
   INT 21H
   JMP CASH_PAY

;--------------STOCK TRACKING--------------
STOCKTRACK:
   MOV AH,09H
   LEA DX,STOCKMSG
   INT 21H
   LEA DX,STOCKLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0				;color
   MOV BL,YELLOW
   MOV CX,54
   INT 10H
   LEA DX,STOCKMSG1
   INT 21H
   LEA DX,STOCKLINE
   INT 21H

MOV CX,12
MOV SI,0
LOOPSTOCK:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   LEA DX,TENSPACE
   INT 21H
   LEA DX,TWOSPACE
   INT 21H
   MOV AX,SI			;handling string array (every 17 characters in FOOD_NAME)
   MOV BX,17
   MUL BX
   MOV BX,AX
   MOV AH,09H
   LEA DX,FOOD_NAME[BX]	;food item name
   INT 21H
   LEA DX,FIVESPACE
   INT 21H
   LEA DX,TWOSPACE
   INT 21H

   MOV AX,0				;quantity sold
   MOV AL,50
   SUB AL,FOOD_STOCK[SI]
   MOV VAR1,AX

   MOV AX,0
   MOV AX,VAR1
   DIV TEN
   MOV Q1,AL
   MOV R1,AH
   ADD Q1,30H
   ADD R1,30H

   MOV AH,02H
   CMP Q1,"0"
   JE SKIP_Q1_6
   MOV DL,Q1
   INT 21H
   JMP CONTINUE8
SKIP_Q1_6:
   MOV DL," "
   INT 21H
CONTINUE8:
   MOV DL,R1
   INT 21H

   MOV AH,09H
   LEA DX,TENSPACE
   INT 21H
   LEA DX,TWOSPACE
   INT 21H

   MOV AX,0				;quantity left
   MOV AL,FOOD_STOCK[SI]  
   DIV TEN
   ADD AX,3030H			;convert into ASCII
   MOV Q1,AL			;store AL (Quotient)
   MOV R1,AH			;store AH (Remainder)

   MOV AH,02H
   CMP Q1,"0"
   JE SKIP_Q1_7
   MOV DL,Q1
   INT 21H
   JMP CONTINUE9
SKIP_Q1_7:
   MOV DL," "
   INT 21H
CONTINUE9:
   MOV DL,R1
   INT 21H

   CMP FOOD_STOCK[SI],5	;if stock remaining is less than or equal to 5, print out lack of stock message
   JNBE SKIP_LACK
   MOV AH,09H
   LEA DX,STOCKMSG2
   INT 21H

SKIP_LACK:
   INC SI
   DEC CX
   CMP CX,0
   JNE TOLOOPSTOCK
   JMP CONTINUE4

TOLOOPSTOCK:
   JMP LOOPSTOCK
   
CONTINUE4:
   MOV AH,09H
   LEA DX,CONTMSG
   INT 21H
   MOV AH,01H
   INT 21H
   JMP LOOP_MENU

;--------------SALES REPORT-----------------
SALESREPORT:
   CALL ADMINISTRATOR
   MOV AH,09H
   LEA DX,SALESMSG       ;display sales report intro
   INT 21H

;---- person in charge---
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0				;color
   MOV BL,YELLOW
   MOV CX,23
   INT 10H
   LEA DX,SALESMSG5		;worker that using the system(login)
   INT 21H

   MOV AX,0
   MOV AX,CURRENTUSER	;set SI index starting with current user first character
   MUL ID_LENGTH
   MOV SI,AX

   MOV CX,5				;print next 5 characters
DISPLAY_USER:
   MOV AH,02H
   MOV DL,USERID[SI]
   INT 21H
   INC SI
   LOOP DISPLAY_USER
	
;-------report date generation------
DATE:
    MOV AH,09H
	MOV BH,0				;color
    MOV BL,YELLOW
    MOV CX,34
    INT 10H
	LEA DX,SALESMSG4
	INT 21H

    MOV AH,2AH     ;system date (day dl,month dh, year cx)
    INT 21H

    MOV AL,DL       ;day
    CALL SHOW       ;call DISP display DD
    MOV DL,'/'      ;print /
    MOV AH,02H
    INT 21H
	
    MOV AL,DH       ;month
    CALL SHOW
    MOV DL,'/'
    MOV AH,02H
    INT 21H

    ADD CX,0F830H   ;add to adjust hex effects on year
    MOV AX,CX       ;year   
    CALL SHOW

    MOV DL,0DH      ;\r
    MOV AH,02H
    INT 21H
	JMP TTCUSTOMER

SHOW PROC        
   AAM              ;ASCII adjust after multiplication (AX register)
   MOV BX,AX        ;loading adjusted value to bx
   ADD BX,3030H     ;add 3030 to properly print the data

   MOV AH,02H
   MOV DL,BH        ;print 1st digit
   INT 21H

   MOV DL,BL        ;print 2nd digit
   INT 21H

   RET              ;return from the PROC
SHOW ENDP

;-----------total customer-----------
TTCUSTOMER:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0       ;color
   MOV BL,YELLOW
   MOV CX,22
   INT 10H
   LEA DX,SALESMSG1
   INT 21H 

   MOV AX,0
   MOV AL,CUSTOMERS		;customer num (2 digits)
   DIV TEN
   MOV Q1,AL
   MOV R1,AH
   ADD Q1,30H
   ADD R1,30H

   MOV AH,02H		
   CMP Q1,"0"
   JE SKIP_Q1_3
   MOV DL,Q1
   INT 21H
SKIP_Q1_3:
   MOV DL,R1
   INT 21H

   MOV AH,09H
   LEA DX,SALESLINE
   INT 21H
   LEA DX,CONTMSG
   INT 21H
   MOV AH,01H
   INT 21H

;--------itmes and qty sold (Report Table)--------
MOV AH,09H
LEA DX,SALESLINE
INT 21H
LEA DX,NEWLINE
INT 21H
MOV BH,0				;color
MOV BL,YELLOW
MOV CX,71
INT 10H
LEA DX,SALESMSG2
INT 21H
LEA DX,SALESLINE
INT 21H

MOV REVENUE,0
MOV BESTQTY,0
MOV CX,12
MOV SI,0
LOOPDETAILS:
   MOV AH,09H       
   LEA DX,NEWLINE
   INT 21H
   LEA DX,TWOSPACE
   INT 21H
   LEA DX,TWOSPACE
   INT 21H

   MOV AX,SI			;handling string array (every 17 characters in FOOD_NAME)
   MOV BX,17
   MUL BX
   MOV BX,AX
   MOV AH,09H
   LEA DX,FOOD_NAME[BX]		;food item
   INT 21H
   LEA DX,TENSPACE
   INT 21H
   LEA DX,TENSPACE
   INT 21H

   MOV AX,0					;quantity sold
   MOV AL,50
   SUB AL,FOOD_STOCK[SI]
   MOV VAR1,AX
   MOV SLSRPQTY,AL
   CMP BESTQTY,AL			;compare best seller quantity with current qty
   JB CHANGE_BEST			;if bestqty < currentqty, change the best seller data
   JMP CONTINUE10

CHANGE_BEST:
   MOV BESTQTY,AL
   MOV BESTINDEX,SI

CONTINUE10:
   MOV AX,0
   MOV AX,VAR1
   DIV TEN
   MOV Q1,AL
   MOV R1,AH
   ADD Q1,30H
   ADD R1,30H

   MOV AH,02H
   CMP Q1,"0"
   JE SKIP_Q1_4
   MOV DL,Q1
   INT 21H
   JMP CONTINUE6
SKIP_Q1_4:
   MOV DL," "
   INT 21H
CONTINUE6:
   MOV DL,R1
   INT 21H

   MOV AH,09H
   LEA DX,TENSPACE
   INT 21H

   MOV AX,0					;price
   MOV AL,FOOD_PRICE[SI]
   DIV TEN
   ADD AX,3030H
   MOV Q1,AL
   MOV R1,AH

   MOV AH,02H
   CMP Q1,"0"
   JE SKIP_Q1_5
   MOV DL,Q1
   INT 21H
   JMP CONTINUE7
SKIP_Q1_5:
   MOV DL," "
   INT 21H
CONTINUE7:
   MOV DL,R1
   INT 21H

   MOV AH,09H
   LEA DX,DOT
   INT 21H
   LEA DX,TENSPACE
   INT 21H

   ;------subtotal------------
   MOV BX,0
   MOV AX,0					;Clear data
   MOV AL,SLSRPQTY			;put quantity
   MOV BL,FOOD_PRICE[SI]
   MUL BL					;multiply by price
   MOV BX,AX
   ADD REVENUE,AX

   MOV AX,0		;clear data
   MOV AX,BX
   DIV TEN		;get digit one by one
   MOV Q1,AL	;quotient
   MOV R1,AH	;remainder

   MOV AX,0
   MOV AL,Q1
   DIV TEN
   MOV Q2,AL
   MOV R2,AH
   
   ADD Q2,30H	;convert to ASCII
   ADD R2,30H
   ADD R1,30H

   MOV AH,02H
   CMP Q2,"0"	;if not 3 digit, display only 2 digit
   JE SKIP_Q2_6
   MOV DL,Q2
   INT 21H
SKIP_Q2_6:
   MOV DL,R2
   INT 21H
   MOV DL,R1
   INT 21H

   MOV AH,09H
   LEA DX,DOT
   INT 21H

   DEC CX
   INC SI
   CMP CX,0
   JNE TOLOOPDETAILS
   JMP EARNINGS

TOLOOPDETAILS:
   JMP LOOPDETAILS

;------earning----
EARNINGS:
   MOV AH,09H
   LEA DX,SALESLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0				;color
   MOV BL,YELLOW
   MOV CX,66
   INT 10H
   LEA DX,SALESMSG3
   INT 21H

   MOV AX,0
   MOV AX,REVENUE		;e.g. 1925(.00)
   DIV HDR
   MOV Q1,AL			;19
   MOV R1,AH			;25

   MOV AX,0
   MOV AL,Q1
   DIV TEN
   MOV Q2,AL			;1
   MOV R2,AH			;9

   MOV AX,0
   MOV AL,R1
   DIV TEN
   MOV Q3,AL			;2
   MOV R3,AH			;5

   ADD Q2,30H
   ADD R2,30H
   ADD Q3,30H
   ADD R3,30H

   MOV AH,02H
   CMP Q2,"0"
   JE SKIP_Q2_7
   MOV DL,Q2
   INT 21H
SKIP_Q2_7:
   MOV DL,R2
   INT 21H
   MOV DL,Q3
   INT 21H
   MOV DL,R3
   INT 21H
   
   MOV AH,09H
   LEA DX,DOT
   INT 21H
   LEA DX,SALESLINE
   INT 21H

;-----------best seller---------
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0       ;color
   MOV BL,YELLOW
   MOV CX,18
   INT 10H
   LEA DX,SALESMSG6
   INT 21H

   CMP CUSTOMERS,0		;if no any selling yet, skip display best seller
   JE CONTINUE11
   MOV AX,BESTINDEX			
   MOV BX,17
   MUL BX
   MOV BX,AX
   MOV AH,09H
   LEA DX,FOOD_NAME[BX]		;food item
   INT 21H

   CONTINUE11:
   MOV AH,09H
   LEA DX,CONTMSG
   INT 21H
   MOV AH,01H
   INT 21H
   JMP LOOP_MENU

;--------------REGISTER USER--------------
REGISTERING:
   CMP NUMUSERS,4		;check whether reached user limit
   JE REGLIMIT			;if yes, tell the user and loop back to menu
   CALL ADMINISTRATOR	;if no, proceed to administrator access validation
   JMP REGISTER	

REGLIMIT:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0				;color
   MOV BL,YELLOW
   MOV CX,54
   INT 10H
   LEA DX,REGISTERMSG8
   INT 21H
   LEA DX,CONTMSG
   INT 21H
   MOV AH,01H
   INT 21H
   JMP LOOP_MENU

;------------Register---------------
REGISTER:
   MOV AH,09H
   LEA DX,REGISTERMSG
   INT 21H
ROLE:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0				;color
   MOV BL,CYAN
   MOV CX,48
   INT 10H
   LEA DX,REGISTERMSG4
   INT 21H
   MOV AH,01H
   INT 21H

   CMP AL,'S'			;S --> Server  ;C --> Cashier
   JE CONTINUE5
   CMP AL,'s'
   JE CONTINUE5
   CMP AL,'C'
   JE CONTINUE5
   CMP AL,'c'
   JE CONTINUE5

   MOV AH,09H			;Error message for invalid role entered
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0				;color
   MOV BL,RED
   MOV CX,58
   INT 10H
   LEA DX,REGISTERMSG5
   INT 21H
   JMP ROLE

CONTINUE5:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0				;color
   MOV BL,YELLOW
   MOV CX,29
   INT 10H
   LEA DX,REGISTERMSG1	;display user id for registration
   INT 21H

   MOV AX,0
   MOV AX,NUMUSERS	;e.g. If NUMUSERS = 1 (admin only) --> current register user id is user1
   MUL ID_LENGTH	;array stored 6 characters including $ for each user id
   MOV SI,AX		;variable handling user id array
   MOV CX,5
DISPLAY_REGUSER:
   MOV AH,02H
   MOV DL,USERID[SI]
   INT 21H
   INC SI
   LOOP DISPLAY_REGUSER

   MOV AH,09H		;Prompt password input for new user
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0			;color
   MOV BL,LGREEN
   MOV CX,45
   INT 10H
   LEA DX,REGISTERMSG2
   INT 21H

   MOV AX,0
   MOV AX,NUMUSERS
   MUL PSW_LENGTH
   MOV SI,AX
   MOV CX,8
INPUT_REGPSW:
   MOV AH,01H
   INT 21H
   MOV USERPSW[SI],AL	;store into userpsw array
   INC SI
   LOOP INPUT_REGPSW

   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0       ;color
   MOV BL,LGREEN
   MOV CX,32
   INT 10H
   LEA DX,REGISTERMSG3	;Prompt for confirm password
   INT 21H

   MOV CX,8
   MOV SI,0
INPUT_CONFIRMPSW:
   MOV AH,01H
   INT 21H
   MOV IPSW[SI],AL
   INC SI
   LOOP INPUT_CONFIRMPSW
MOV IPSW[SI],'$'

   MOV CX,8
   MOV SI,0
VLDCONFIRMPSW:
   MOV AX,0
   MOV AX,NUMUSERS
   MUL PSW_LENGTH
   ADD AX,SI
   MOV DI,AX
   MOV AL,USERPSW[DI]
   CMP AL,IPSW[SI]
   JNE CONFIRM_ERROR
   INC SI
   LOOP VLDCONFIRMPSW

   INC NUMUSERS		;Add 1 new user
   MOV AH,09H		;Register successful
   LEA DX,NEWLINE
   INT 21H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0			;color
   MOV BL,YELLOW
   MOV CX,40
   INT 10H
   LEA DX,REGISTERMSG7
   INT 21H
   LEA DX,CONTMSG
   INT 21H
   MOV AH,01H
   INT 21H
   JMP LOOP_MENU

CONFIRM_ERROR:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0       ;color
   MOV BL,RED
   MOV CX,59
   INT 10H
   LEA DX,REGISTERMSG6
   INT 21H
   JMP CONTINUE5

;-----Administrator Validation (Only admin can access)----
ADMINISTRATOR PROC
ADMIN_VALIDATION:
   MOV AH,09H
   LEA DX,ADMINVALID
   INT 21H
   LEA DX,ADMINVALID1
   INT 21H

   MOV CX,8
   MOV SI,0
LOOP_PSW:			;prompt for password input
   MOV AH,07H
   INT 21H
   MOV IPSW[SI],AL
   MOV AH,02H
   MOV DL,'*'
   INT 21H
   INC SI
   LOOP LOOP_PSW
MOV IPSW[SI],'$'

   MOV DI,0			;holding the character index
VLDREGPSW_LOOP:
   MOV AX,0
   ADD AX,DI
   MOV BX,AX
   MOV AL,USERPSW[BX]
   CMP AL,'$'
   JE EXIT_ADMINVLD
   CMP AL,IPSW[DI]
   JNE LOGIN_FAIL1
   INC DI
   JMP VLDREGPSW_LOOP

LOGIN_FAIL1:
   MOV AH,09H
   LEA DX,NEWLINE
   INT 21H
   MOV BH,0			;color
   MOV BL,RED
   MOV CX,68
   INT 10H
   LEA DX,ADMINVALID2
   INT 21H
   JMP ADMIN_VALIDATION

EXIT_ADMINVLD:
   RET
ADMINISTRATOR ENDP

;---------------QUIT SYSTEM----------------
EXIT:
   MOV AH,09H
   LEA DX,QUITMSG
   INT 21H

MOV AX,4C00H
INT 21H
MAIN ENDP
END MAIN
