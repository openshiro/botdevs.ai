class Inquiry < ApplicationRecord
  belongs_to :contact
  validates :email, presence: true
  validates_format_of :email, with: Devise::email_regexp, message: "Incorrect email format"

  def email=(value)
    self[:email] = value.downcase.strip
  end
end
