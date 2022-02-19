class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.hstore :on_chain_attrs
      t.references :wallet

      t.timestamps
    end
  end
end
