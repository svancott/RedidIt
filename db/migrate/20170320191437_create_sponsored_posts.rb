class CreateSponsoredPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsored_posts do |t|
      t.string :title
      t.text :body
      t.integer :price

      t.timestamps
    end
  end
end
