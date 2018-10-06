class CreateWeatherDegrees < ActiveRecord::Migration[5.1]
  def change
    create_table :weather_degrees do |t|
      t.string :status
      t.string :date
      t.string :time
      t.string :degree
      t.timestamps
    end
  end
end
