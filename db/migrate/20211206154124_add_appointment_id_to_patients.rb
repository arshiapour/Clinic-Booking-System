class AddAppointmentIdToPatients < ActiveRecord::Migration[6.1]
  def change
    add_column :patients, :appointment_id, :integer
  end
end
