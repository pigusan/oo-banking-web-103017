class Transfer
  attr_reader :sender, :receiver, :status, :amount
# your code here		+  attr_reader :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
    @counter = 0
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    if @sender.valid? && @counter == 0 && @sender.balance >= @amount
      @counter = 1
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      #binding.pry
    else
        @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if @status == "complete" || @status == "reversed"
      @sender.balance += @amount
      #binding.pry
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
 end
