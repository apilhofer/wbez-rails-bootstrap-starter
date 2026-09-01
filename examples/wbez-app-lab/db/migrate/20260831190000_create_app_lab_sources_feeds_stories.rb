class CreateAppLabSourcesFeedsStories < ActiveRecord::Migration[8.0]
  def change
    create_table :sources do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.timestamps
    end
    add_index :sources, :slug, unique: true

    create_table :feeds do |t|
      t.references :source, null: false, foreign_key: true
      t.string :url, null: false
      t.boolean :active, null: false, default: true
      t.timestamps
    end
    add_index :feeds, :url, unique: true

    create_table :stories do |t|
      t.references :source, null: false, foreign_key: true
      t.references :feed, foreign_key: true
      t.string :guid, null: false
      t.string :canonical_url
      t.string :headline, null: false
      t.text :summary
      t.text :body_html
      t.string :image_url
      t.string :image_caption
      t.string :image_credit
      t.string :author_name
      t.datetime :published_at
      t.datetime :updated_at_remote
      t.string :section
      t.string :audio_url
      t.integer :duration_seconds
      t.timestamps
    end
    add_index :stories, [:source_id, :guid], unique: true
    add_index :stories, :published_at
  end
end
