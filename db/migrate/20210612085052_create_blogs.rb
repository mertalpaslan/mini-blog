class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :name
      t.string :subdomain
      t.string :background_color
      t.string :header_color
      t.string :text_color
      t.string :font_family
      t.integer :user_id

      t.index :user_id
    end
  end
end
