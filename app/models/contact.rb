class Contact < ApplicationRecord
  validates_format_of :email, with: Devise::email_regexp, message: "Incorrect email format"

  def email=(value)
    self[:email] = value.downcase.strip
  end
end
