class AddAttachmentLayoutToOss < ActiveRecord::Migration
  def self.up
    change_table :oss do |t|
      t.attachment :layout
    end
  end

  def self.down
    drop_attached_file :oss, :layout
  end
end
