class Pcr < ActiveRecord::Base
  belongs_to :gene
  has_many :pcr_primer
  has_many :primer, :through => :pcr_primer
  has_one :pcr_condition, :as => "usable"
  has_attached_file :gel,
    styles: {
      original: "500x500",
      medium: "300x300>",
      icon: "100x100#>"
    },
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :gel, content_type: /\Aimage\/.*\Z/
  
  accepts_nested_attributes_for :pcr_condition, :allow_destroy => true, :reject_if => :all_blank


end
