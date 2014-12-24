class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.date :duedate
      t.string :lender
      t.text :description
      t.string :category
      t.decimal :amount, :precision => 8, :scale => 2
      t.boolean :is_paid, default: false

      t.references :user

      t.timestamps
    end
  end
end
