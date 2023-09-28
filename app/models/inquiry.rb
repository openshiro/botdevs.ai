class Inquiry < ApplicationRecord
  belongs_to :contact, optional: true

  validates :email, presence: true
  validates_format_of :email, with: Devise::email_regexp, message: "Incorrect email format"

  after_create :match_contact

  def email=(value)
    self[:email] = value.downcase.strip
  end

  private

  def match_contact
    contact = Contact.create_or_find_by(email: email)
    contact.update(name: name) if name.present?
    update(contact: contact)
  end
end
