class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :post, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
