class Pcr < ActiveRecord::Base
  belongs_to :gene
  has_one :for_primer
  has_one :rev_primer
  has_one :pcrcondition
  has_attached_file :gel,
    styles: {
      original: "500x500",
      medium: "300x300>",
      icon: "100x100#>"
    },
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :gel, content_type: /\Aimage\/.*\Z/
  
  accepts_nested_attributes_for :for_primer, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :rev_primer, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :pcrcondition, :allow_destroy => true, :reject_if => :all_blank


end
