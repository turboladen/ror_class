class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :file_name
      t.string :path

      t.timestamps
    end
  end
end
