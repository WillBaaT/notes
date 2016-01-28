class PcrPrimer < ActiveRecord::Base
  belongs_to :pcr
  belongs_to :primer
end
