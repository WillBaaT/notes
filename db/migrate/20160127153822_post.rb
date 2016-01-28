class Post < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :geek_id
      t.text :content
    end
  end
end
