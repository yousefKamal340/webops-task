class CreateTags < ActiveRecord::Migration[7.1]
  def change
    create_table :tags do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :posts_tags, id: false do |t|
      t.references :post, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
    end

    add_index :tags, :name, unique: true
    add_index :posts_tags, [:post_id, :tag_id], unique: true
  end
end 