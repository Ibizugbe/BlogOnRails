class AddUserRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comment, :post, null: false, foreign_key: true
  end
end
