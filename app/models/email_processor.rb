class EmailProcessor
  def self.process(email)
    p "a"* 100
    p email.body
    puts email.body
    debugger
  end
end
