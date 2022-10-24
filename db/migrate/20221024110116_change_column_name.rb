class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :Text, :text
    rename_column :posts, :Title, :Title
    rename_column :posts, :Text, :text
    rename_column :posts, :CommentsCounter, :comment_counter
    rename_column :posts, :LikesCounter, :like_counter
    rename_column :users, :PostCounter, :post_counter
    rename_column :users, :Name, :name
    rename_column :users, :Photo, :photo
    rename_column :users, :Bio, :bio
  end
end
