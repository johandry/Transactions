require_relative 'transactions'

class Account
  
  attr_accessor :transactions
  
  def initialize(id, name, database)
    @id           = id
    @name         = name
    @transactions = Transactions.new(id, database)
  end
  
  
end