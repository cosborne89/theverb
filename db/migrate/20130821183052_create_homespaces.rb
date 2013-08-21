class CreateHomespaces < ActiveRecord::Migration
  def change
    create_table :homespaces do |t|
      t.integer :user_id
      t.integer :partner_id
      t.string :title
      t.string :post_ids

      t.timestamps
    end
  end
end
