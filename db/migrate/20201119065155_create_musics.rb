# frozen_string_literal: true

class CreateMusics < ActiveRecord::Migration[6.0]
  def change
    create_table :musics do |t|
      t.string     :file, null: false
      t.text       :artist, null: false
      t.text       :title, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
