class AddNameToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :name, :string
  end
end
