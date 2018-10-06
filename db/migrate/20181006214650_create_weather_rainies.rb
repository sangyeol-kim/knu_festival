class CreateWeatherRainies < ActiveRecord::Migration[5.1]
  def change
    create_table :weather_rainies do |t|
      t.string :status
      t.string :date
      t.string :time
      t.string :rainy
      t.timestamps
    end
  end
end
