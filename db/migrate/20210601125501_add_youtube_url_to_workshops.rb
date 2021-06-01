class AddYoutubeUrlToWorkshops < ActiveRecord::Migration[6.0]
  def change
    add_column :workshops, :youtube_url, :string
  end
end
