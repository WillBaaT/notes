class Ppp < ActiveRecord::Migration
  def change
    create_table :ppps do|t|
      t.string :mail
      t.string :ppp
    end
  end
end
