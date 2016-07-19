class ChangePosterColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :movies, :poster_image_url, :poster
  end
end
