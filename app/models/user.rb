class User < ActiveRecord::Base
  has_one :author
  validates :username,
    :presence => true,
    :uniqueness => true
  validates :password,
    :presence => true
    
  def self.auhenticate(username, password)
    where(:username => username,
      :password => Digest::SHA1.hexdigest(password)).first
  end
end
