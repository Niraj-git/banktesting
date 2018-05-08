class Bank
  attr_accessor :amount, :balance, :acc
  
     def initialize()
      @acc = []
    end
  
    def create_account()
      puts"Enter Account Holder Name :"
      @name = gets.chomp.to_i
      puts"Enter your Address :" 
      @address = gets 
      puts"Enter your Contact Number :" 
      @mob = gets.chomp.to_i
      puts"Balance of Account :"
      @balance = 0      
    end        
    
    def get_allaccounts()
      @acc.map{|p| p.account_number}.join(", ")    
    end        

    def deposite(amount)
      @amount = amount
      @balance = @balance + @amount
    end 
    
    def withdraw(amount)
      if(@balance == 0)
        puts"Unable to withdraw your account balance is 0."
      else 
        @amount = amount    
        @balance = @balance - @amount
      end      
    end 
    
end

class Account
  attr_accessor :account_number, :account_holder_name, :transactions
    
    def initialize(acno,acname,bal)
      @account_number = acno
      @account_holder_name = acname 
      @balance = 0
#      @transactions = []
    end
    
    def balance()
      @balance
    end  

    def print_transactions()
      @account_number
      @account_holder_name
      @balance
    end 
    
    def get_alltransactions()    
    end

    def print_account_detail()
      puts"Account Number : #{acno}"
      puts"Account Holder Name : #{acname}"
      puts"Balance of Account : #{bal}"
    end      
    
end

anand = Account.new("001114178","Anand","50000")
niraj = Account.new("002214166","Niraj","15000")


bank = Bank.new
ch = nil

while ch != 1 do

  puts"List of Operations :"
  puts"1) create account"
  puts"2) deposite"
  puts"3) withdraw"
  puts"4) print_transactions"
  puts"5) print_account_detail"
  puts"6) exit"

  puts"Choose option to performance operation :"
  ch = gets.chomp.to_i
  result = nil
  case ch
  when 1
    result = bank.create_account()
  when 2
    result = bank.deposite(2000)
  when 3
    result = bank.withdraw(1000)
  when 4
    result = niraj.print_transactions()
  when 5
    result = niraj.print_account_detail()
  when 6
     exit(0)
  else
    "You gave me #{ch} -- which is not in the list."
  end

  puts" Result of Operation : #{result}"

  puts"Do you want to continue ? 1 for yes / 0 for no"
  ch = gets.chomp.to_i
end

