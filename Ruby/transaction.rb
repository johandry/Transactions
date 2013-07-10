class Transaction
  
  attr_accessor :id, :account_id, :date, :chknum, :payee, :category, :transclass, :memo, :amount, :cleared, :currencycode, :exchangerate
  
  def initialize(id, account_id = 0, date = 0, chknum = '', payee = 0, category = 0, transclass = '', memo = '', amount = 0.0, cleared = true, currencycode = 'MXP', exchangerate = 1.0)
  	@id           = id
  	@account_id   = account_id
  	@date         = date
  	@chknum       = chknum
  	@payee        = payee
  	@category     = category
  	@transclass   = transclass
  	@memo         = memo
  	@amount       = amount
  	@cleared      = cleared
  	@currencycode = currencycode
  	@exchangerate = exchangerate
  end

  
  def to_s
    output = ''
    output << "id:           #{@id}\n"           if @id
    output << "account:      #{@account_id}\n"   if @account_id
    output << "date:         #{@date}\n"         if @date
    output << "chknum:       #{@chknum}\n"       if @chknum
    output << "payee:        #{@payee}\n"        if @payee
    output << "category:     #{@category}\n"     if @category
    output << "transclass:   #{@transclass}\n"   if @transclass
    output << "memo:         #{@memo}\n"         if @memo
    output << "amount:       #{@amount}\n"       if @amount
    output << "cleared:      #{@cleared}\n"      if @cleared
    output << "currencycode: #{@currencycode}\n" if @currencycode
    output << "exchangerate: #{@exchangerate}\n" if @exchangerate
    output
  end
  
end