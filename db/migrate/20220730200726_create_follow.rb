# frozen_string_literal: true

class CreateFollow < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.bigint :follower_id
      t.bigint :followee_id

      t.index :follower_id
      t.index :followee_id

      t.timestamps
    end
  end
end
