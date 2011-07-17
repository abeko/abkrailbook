class User < ActiveRecord::Base
  has_one :author
  def self.auhenticate(username, password)
    where(:username => username,
      :password => Digest::SHA1.hexdigest(password)).first
  end
end
