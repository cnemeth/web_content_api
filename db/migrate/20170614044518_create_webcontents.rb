class CreateWebcontents < ActiveRecord::Migration[5.1]
  def change
    create_table :webcontents do |t|
      t.string :url
      t.text :content

      t.timestamps
    end
  end
end
