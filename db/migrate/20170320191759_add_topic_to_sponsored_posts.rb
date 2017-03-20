class AddTopicToSponsoredPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :sponsored_posts, :topic_id, :integer
    add_index :sponsored_posts, :topic_id
  end
end
