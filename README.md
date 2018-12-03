# Bank Tech Test

## Project Outline

You will be able to interact with this project, using a REPL, as if it were a bank. You should be able to make withdrawals, deposits and view a full bank statement which contains a full history of transactions.

## How to use:

Clone this repo

Open your terminal

Run the following commands:

```
irb
```

```
load 'src/account.rb'
```

```
account = Account.new
```

To make a deposit:

```
account.deposit(integer)
```

To make a withdrawal:

```
account.withdraw(integer)
```

To display full bank statement:

```
account.print_statement
```


## User Stories

```
As a customer
So that I can keep my money safe
I want to deposit funds into an account
```

```
As a customer
So that I can access my money
I want to withdraw funds from my account
```

```
As a customer
So that I can keep an eye on my balance and transactions
I want to have access to a bank statement
```
