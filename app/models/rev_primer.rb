class RevPrimer < ActiveRecord::Base
  belongs_to :pcr
  has_many :primer_pair
  has_many :for_primer, :through => :primer_pair
end
