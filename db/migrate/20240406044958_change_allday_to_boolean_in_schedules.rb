class ChangeAlldayToBooleanInSchedules < ActiveRecord::Migration[6.1]
  def change
    change_column :schedules, :allday, :boolean, default: false, null: false
  end
end
