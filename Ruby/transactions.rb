require_relative 'transaction'

require 'nokogiri'

class Transactions
  
  attr_accessor :transactions
  
  def initialize(account_id, database)
    @account_id   = account_id
    @database     = database
    @transactions = Array.new
  end
  
  def load_xml(xml_file, fields)
    @xml = Nokogiri::XML(File.open(xml_file))
    @xml.remove_namespaces!
    id = transactions.last ? transactions.last.id + 1 : 1 
    
    fields.keys.each do |tag|
      xml_transactions = @xml.xpath("//#{tag}")
      xml_transactions.each do |xml_transaction|
        transaction = Transaction.new(id, @account_id)
        id +=1
        fields[tag].keys.each do |attribute|
          if fields[tag][attribute] and xml_transaction[attribute]
            transaction.instance_variable_set('@' + fields[tag][attribute], xml_transaction[attribute])
          end
        end
        @transactions.push(transaction)
      end
    end
  end
  
  def to_s
    output = ''
    @transactions.each do |transaction|
      output << transaction.to_s + "\n"
    end
    output
  end
  
end