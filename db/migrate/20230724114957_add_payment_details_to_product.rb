class AddPaymentDetailsToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :is_paid, :boolean, :default => false
  end
end
