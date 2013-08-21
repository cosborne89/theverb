class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :category
      t.string :author_id
      t.string :homespace_id
      t.string :body
      t.string :link

      t.timestamps
    end
  end
end
