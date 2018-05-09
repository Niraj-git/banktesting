class Bank
  attr_accessor :accounts, :amount, :balance
  
    def initialize()
      @accounts = []
    end
  
    def create_account()
      print "Enter Account Holder Name : "
      name = gets.chomp
      print "Enter your Address : " 
      address = gets.chomp
      print "Enter your Contact Number : " 
      mobile = gets.chomp
      account = Account.new(name, mobile, address)
      account.account_number = @accounts.size + 1
      @accounts.push(account)
      return account
    end        
    
    def searchaccount(acountno)      
      acfound = @accounts.detect { |account| account.account_number == acountno }
      return acfound
    end
    
    def get_allaccounts()
      @acc.map{|p| p.account_number}.join(", ")    
    end        

    def deposite(acountno,amount)
      acfound1 = searchaccount(acountno)     
      acfound1.balance = acfound1.balance + amount.to_i
      acfound1.transactions.push("RS. #{amount} deposited Available Balance is #{acfound1.balance}")
      acfound1 
    end 
    
    def withdraw(acountno,amount)
      acfound1 = searchaccount(acountno)     
      if(@balance == 0)
        puts"Unable to withdraw, your account balance is 0."
      else 
        acfound1.balance = acfound1.balance - amount.to_i
        acfound1.transactions.push("Rs. #{amount} withdrawn. Available Balance is #{acfound1.balance}")
      end
      acfound1
    end 
    
    def print_transactions(acountno)
      acfound1 = searchaccount(acountno)     
      print "Account number : #{acfound1.account_number}"
      print "All transactions"
      transactions = acfound1.transactions.join("\n")
      print transactions      
    end 
    
     def print_account_detail(acountno)
      acfound1 = searchaccount(acountno)     
      puts "Your account Name : #{acfound1.account_holder_name}"
      puts "Your Account number : #{acfound1.account_number} "
      puts "Your account balance is #{acfound1.balance}"
    end      
    
end

class Account
  attr_accessor :account_number, :account_holder_name, :transactions, :balance, :mobile, :address, :amount
    
    def initialize(name, mobile, address)
      @account_holder_name = name 
      @balance = 0
      @mobile = mobile
      @address = address
      @transactions = []
    end
    
    def balance()
      @balance
    end  

    def get_alltransactions()    
      @transactions.map{|p| p.account_number}.join(", ")
    end

end

niraj_bank = Bank.new
ch = nil

while ch != 0 do

  puts "List of Operations :"
  puts "1) create account"
  puts "2) deposite"
  puts "3) withdraw"
  puts "4) print_transactions"
  puts "5) print_account_detail"
  puts "6) exit"

  print "Choose option to performance operation :"
  ch = gets.chomp.to_i
  result = nil
  case ch
  when 1
    account = niraj_bank.create_account()
    puts "Your account Name : #{account.account_holder_name}"
    puts "Your Account number : #{account.account_number}"
    puts "Your account balance is #{account.balance}"
  when 2
    print "Your Account number : "
    num = gets.chomp.to_i
    print "Amount you want to deposit :"
    amo = gets.chomp
    account = niraj_bank.deposite(num, amo)
    puts"Your account balance is : #{account.balance}"
  when 3
    print "Your Account number : "
    num = gets.chomp.to_i
    print "Amount you want to withdraw :"
    amo = gets.chomp.to_i
    print"Your account balance is :"
    result = niraj_bank.withdraw(num, amo)    
  when 4
    print "Enter Account Number : "
    num = gets.chomp.to_i
    result = niraj_bank.print_transactions(num)
  when 5
    print "Your Account number : "
    num = gets.chomp.to_i
    result = niraj_bank.print_account_detail(num)
  when 6
     exit(0)
  else
    "You gave me #{ch} -- which is not in the list."
  end

  print"Do you want to continue ? 1 for yes / 0 for no :"
  ch = gets.chomp.to_i
end

