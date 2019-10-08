class Admin < User
  belongs_to :user, optional: true
end
