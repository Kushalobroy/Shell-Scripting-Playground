#!/bin/bash

# File to store account details
ACCOUNT_FILE="Files/bank_accounts.txt"

# Function to create a new account
create_account() {
    echo "Enter account number: "
    read account_number
    echo "Enter account holder name: "
    read account_holder
    echo "Enter initial deposit amount: "
    read initial_deposit

    # Check if account already exists
    if grep -q "^$account_number:" "$ACCOUNT_FILE"; then
        echo "Account with this number already exists."
    else
        # Save the account details to file
        echo "$account_number:$account_holder:$initial_deposit" >> "$ACCOUNT_FILE"
        echo "Account created successfully."
    fi
}

# Function to display account balance
check_balance() {
    echo "Enter account number: "
    read account_number

    # Retrieve account balance from the file
    account=$(grep "^$account_number:" "$ACCOUNT_FILE")
    
    if [ -n "$account" ]; then
        balance=$(echo "$account" | cut -d':' -f3)
        echo "The balance for account number $account_number is: $balance"
    else
        echo "Account not found."
    fi
}

# Function to deposit money
deposit_money() {
    echo "Enter account number: "
    read account_number
    echo "Enter amount to deposit: "
    read deposit_amount

    # Check if account exists and update balance
    if grep -q "^$account_number:" "$ACCOUNT_FILE"; then
        current_balance=$(grep "^$account_number:" "$ACCOUNT_FILE" | cut -d':' -f3)
        new_balance=$(($current_balance + $deposit_amount))
        sed -i "s/^$account_number:.*/$account_number:$(grep "^$account_number:" "$ACCOUNT_FILE" | cut -d':' -f2):$new_balance/" "$ACCOUNT_FILE"
        echo "Deposit successful. New balance is: $new_balance"
    else
        echo "Account not found."
    fi
}

# Function to withdraw money
withdraw_money() {
    echo "Enter account number: "
    read account_number
    echo "Enter amount to withdraw: "
    read withdraw_amount

    # Check if account exists and update balance
    if grep -q "^$account_number:" "$ACCOUNT_FILE"; then
        current_balance=$(grep "^$account_number:" "$ACCOUNT_FILE" | cut -d':' -f3)
        if [ "$withdraw_amount" -le "$current_balance" ]; then
            new_balance=$(($current_balance - $withdraw_amount))
            sed -i "s/^$account_number:.*/$account_number:$(grep "^$account_number:" "$ACCOUNT_FILE" | cut -d':' -f2):$new_balance/" "$ACCOUNT_FILE"
            echo "Withdrawal successful. New balance is: $new_balance"
        else
            echo "Insufficient balance."
        fi
    else
        echo "Account not found."
    fi
}

# Main menu
while true; do
    echo ""
    echo "====== Banking System Menu ======"
    echo "1. Create an Account"
    echo "2. Check Balance"
    echo "3. Deposit Money"
    echo "4. Withdraw Money"
    echo "5. Exit"
    echo "================================="
    echo "Enter your choice: "
    read choice

    case $choice in
        1) create_account ;;
        2) check_balance ;;
        3) deposit_money ;;
        4) withdraw_money ;;
        5) echo "Thank you for using the banking system. Goodbye!" 
           exit ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
done
