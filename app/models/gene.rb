class Gene <ActiveRecord::Base
  has_many :pcr
  has_one :forprimer, :class_name => "Primer"
  has_one :revprimer, :class_name => "Primer"
  accepts_nested_attributes_for :pcr, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :forprimer, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :revprimer, :allow_destroy => true, :reject_if => :all_blank

before_save :check_gene_name_upcase

  private
  
  def check_gene_name_upcase
    if self.gene_name_changed?
      self.gene_name = self.gene_name.upcase
    end
    if self.number_changed?
      self.number = self.number.upcase
    end
  end
end
