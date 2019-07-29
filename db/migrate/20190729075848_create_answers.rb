class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.boolean :correct, null: false, default: true
      t.reference :test, null: false

      t.timestamps
    end
  end
end
