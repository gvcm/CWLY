class Admin::User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  def self.authenticate(username, password)
    where(username: username, password: password_hash(password)).one?
  end

  def self.add(username, password)
    create(username: username, password: password_hash(password))
  end

  private

  def self.password_hash(password)
    Digest::SHA1.hexdigest(password) if password.present?
  end
end
