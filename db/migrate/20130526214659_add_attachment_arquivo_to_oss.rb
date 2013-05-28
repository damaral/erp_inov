class AddAttachmentArquivoToOss < ActiveRecord::Migration
  def self.up
    change_table :oss do |t|
      t.attachment :arquivo
    end
  end

  def self.down
    drop_attached_file :oss, :arquivo
  end
end
