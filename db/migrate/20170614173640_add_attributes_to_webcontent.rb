class AddAttributesToWebcontent < ActiveRecord::Migration[5.1]
  def change
    add_column :webcontents, :status_code, :string
    add_column :webcontents, :status_message, :string
    add_column :webcontents, :headers, :string
    add_column :webcontents, :total_time, :string
  end
end
