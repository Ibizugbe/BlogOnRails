class AddColumnToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :Title, :string
    add_column :posts, :Text, :text
    add_column :posts, :CommentsCounter, :integer, default: 0
    add_column :posts, :LikesCounter, :integer, default: 0
  end
end
