# -*- encoding : utf-8 -*-
class CreateNotices < ActiveRecord::Migration
  def change
    create_table :notices do |t|
      t.string :title
      t.text :content
      t.datetime :published_at

      t.timestamps
    end
  end
end
