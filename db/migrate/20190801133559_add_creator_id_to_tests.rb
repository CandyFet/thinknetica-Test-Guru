class AddCreatorIdToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :creator, foreign_key: true, null: false, default: 1
  end
end
