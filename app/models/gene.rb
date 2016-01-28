class Gene <ActiveRecord::Base
  has_many :pcr
  has_many :primer
end
