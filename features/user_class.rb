
class User

  def initialize(email, password)

    @@email = email
    @@password = password

  end

  def self.email
    @@email
  end

  def self.password
    @@password
  end

end