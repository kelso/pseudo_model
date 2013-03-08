class User < PseudoModel::Base
  
  attr_accessor :email, :name, :age, :gender, :password
  
  validates :email, :name, :age, :gender, presence: true
  validates :age, numericality: true
  validates :gender, inclusion: { in: [:male, :female, :none_of_your_business] }
  
  after_validation :set_default_password_if_needed
  
  protected
  
  def set_default_password_if_needed
    self.password = SecureRandom.hex if self.password.nil?
  end
  
end