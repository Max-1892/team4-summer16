class User < ActiveRecord::Base

  has_secure_password

  has_one :account
  has_many :todo_lists
  has_many :todo_items, :through => :todo_lists

  def to_s
    "User: 'Login: #{login}', Password: '#{password}'"
  end
end
