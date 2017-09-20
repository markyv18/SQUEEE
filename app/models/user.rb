require 'securerandom'
class User < ApplicationRecord
  after_create :welcome_email

  has_secure_password
  enum role: [:user, :vendor, :admin]

  has_many :trips, dependent: :destroy
  has_many :tours
  has_many :messages

  #validates_presence_of :last_name
  #validates_presence_of :email
  #validates_presence_of :phone
  #validates_presence_of :password_digest
  #validates_presence_of :status
  #validates_presence_of :role

  #before_save :create_username

  #def create_username
    #self.username = "#{self.email.split("@")[0]}"
  #end

  def self.sorted_descending
    self.order(:id)
  end

  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid'], password_digest: SecureRandom.hex(15))
    auth['info']['first_name'] ? user.first_name = auth['info']['first_name'] : user.first_name = auth['info']['name'].split(" ").first
    auth['info']['last_name'] ? user.last_name = auth['info']['last_name'] : user.last_name = auth['info']['name'].split(" ").last
    user.email = auth['info']['email']

    user.save
    user
  end

  def welcome_email
    SendEmailJob.perform_later(self)
  end
end
