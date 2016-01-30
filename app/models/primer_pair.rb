class PrimerPair < ActiveRecord::Base
  belongs_to :for_primer
  belongs_to :rev_primer
end
