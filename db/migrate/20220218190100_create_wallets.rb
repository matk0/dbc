class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.hstore :on_chain_properties
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
