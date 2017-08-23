class CreateHOuses < ActiveRecord::Migration[5.1]
  def change
    create_table :h_ouses do |t|

      t.timestamps
    end
  end
end
