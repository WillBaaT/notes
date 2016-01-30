class ForPrimer < ActiveRecord::Base
  belongs_to :pcr
  has_many :primer_pair
  has_many :rev_primer, :through => :primer_pair
end
