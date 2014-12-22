class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.datetime :duedate
      t.string :lender
      t.text :description
      t.string :category
      t.float :amount
      t.boolean :is_paid, default: false

      t.references :user

      t.timestamps
    end
  end
end
