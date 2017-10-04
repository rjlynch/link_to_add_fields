class AddBodyToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :body, :string
  end
end
