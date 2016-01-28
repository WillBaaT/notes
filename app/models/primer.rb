class Primer < ActiveRecord::Base
  belongs_to :gene
  has_many :pcr_primer
  has_many :pcr, :through => :pcr_primer
end
class ForPrimer < Primer
end
class RevPrimer < Primer
end
