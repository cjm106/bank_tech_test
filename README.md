# Bank tech test

Banking tech test exemplar.


## Instructions

```
    $ git clone git@github.com:cjm106/bank_tech_test.git
    $ cd bank_tech_test
    $ rspec   # to run tests and check coverage
    $ rubocop # to check linting

```
## Interaction

In the working directory:

```
    $ pry
    $ require './lib/bankaccount.rb'
    $ account = BankAccount.new
    => #<BankAccount:0x00007fde7b16f6c8 @balance=0, @date="16/06/2020", @deposits=[], @withdrawals=[]>
    $ account.add(1000.00)
    => [["16/06/2020", "1000.00", "", "1000.00"]]
    $ account.remove(500.00)
    => [["16/06/2020", "", "500.00", "500.00"]]
    $ account.print_statement
    date || credit || debit || balance
    16/06/2020 ||  || 500.00 || 500.00
    16/06/2020 || 1000.00 ||  || 1000.00

```

## Specification

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## User Stories

```
As a bank customer
So that I can save up to buy a car
I would like to be able to deposit money into my account  
```

```
As a bank customer
So that I can buy food
I would like to be able to withdraw money from my account
```

```
As a bank customer
So that I can keep track of the transactions on my account
I would like to be able to print my bank statement
```


## Approach

The functionality described in the user stories above was broken down as follows:

1. deposit (add)
  - update balance
  - record deposit

2. withdraw (remove)
  - update balance
  - record withdrawal

3. print (print_statement)
  - print header
  - print ledger

The application was then TDD'd to include the above and then refactored into separate BankAccount, Statement and Transaction classes.


## Models

### BankAccount

Methods:

- add
- remove
- print_statement

Attributes:

- transactions
- balance

### Statement

Methods:

- header
- ledger

Attributes:

- deposits
- withdrawals

### Transactions

Methods:

- money_in
- money_out

Attributes:

- deposits
- withdrawals
