class AddAttachmentRascunhoToOss < ActiveRecord::Migration
  def self.up
    change_table :oss do |t|
      t.attachment :rascunho
    end
  end

  def self.down
    drop_attached_file :oss, :rascunho
  end
end
