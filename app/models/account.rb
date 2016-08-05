class Account < ActiveRecord::Base
  belongs_to :user
  validates :gender, inclusion: { in: %w(male female N/A), message: "only allows 'male', 'female', 'N/A'" }
  validates :age, inclusion: { in: 20..100, message: "only allows integers between 20 and 100, inclusive" }

  def to_s
  	"Account Details: First Name: '#{first_name}', Last Name: '#{last_name}', Gender: '#{gender}', Age: '#{age}'"
  end
end
