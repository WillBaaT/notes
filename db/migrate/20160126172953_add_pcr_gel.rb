class AddPcrGel < ActiveRecord::Migration
  def up
    add_attachment :pcrs, :gel
  end

  def down
    remove_attachment :pcrs, :gel
  end
end
