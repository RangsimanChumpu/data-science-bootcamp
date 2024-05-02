class ATM:
    def __init__(self, account_name, bank_name, initial):
        self.account_name = account_name
        self.bank_name = bank_name
        self.balance = initial

    ## string representation
    def __str__(self):
        return f"This is an account of {self.account_name}, bank: {self.bank_name}"

    ## method => function
    def check_balance(self):
        print(f"Balance: {self.balance} THB")

    def deposit(self, money):
        self.balance += money
        print(f"Deposit successfully: your new balance: {self.balance} THB")

    def withdraw(self, money):
        if self.balance < 0:
            print("Transection declined")
        else:
            self.balance -= money
            print(f"Withdraw successfully: your new balance: {self.balance} THB")

    def fund(self, depo):
        print("Minumum diposit 5000 bath")
        if self.balance >= 5000:
            value = 0
            print("Continue Your Transaction")
            self.balance -= depo
            value += depo
            print("Your balance index is {value}")
        else:
            print("Check your money on balance account")
          
          
acc1 =ATM("Top", "scb", 500)
print(acc1)
## This is an account of Top, bank: scb

acc1.check_balance()

acc1.deposit(100000)

acc1.fund(500)
