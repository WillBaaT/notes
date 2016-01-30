class Gene <ActiveRecord::Base
  has_many :pcr
  accepts_nested_attributes_for :pcr, :allow_destroy => true, :reject_if => :all_blank

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
