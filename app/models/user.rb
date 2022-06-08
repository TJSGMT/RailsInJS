class User < ApplicationRecord
validate :pwauthenticate, on: :update
  def pwauthenticate
    user = User.find_by_id(self.id)
    if ((self.password != user.password) && (self.email != user.email))
      errors.add(:base, "Password is incorrect.")
    else
      self.password = user.password
    end
  end
end
