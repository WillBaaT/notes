class Ligation < ActiveRecord::Base
  belongs_to :ligatable, :polymorphic => true
end
