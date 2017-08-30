class BankCustomer < ActiveRecord::Base
	validates_presence_of :name, :acc_no, :balance
	validates_numericality_of :balance,greater_than_or_equal_to:0
	validates_uniqueness_of :name, :acc_no

def transaction(amount,code)
	if code ==0
		if self.balance < amount
			puts "Insufficent funds"
		else
			self.balance  = self.balance - amount
			self.update_attributes(balance: self.balance)
		end
	else
		self.balance += amount
		self.update_attributes(balance: self.balance)
	end
end
end