class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password
  before_save :downcase_email

  private

  def downcase_email
    self.email.downcase!
  end
end
