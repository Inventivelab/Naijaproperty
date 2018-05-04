class AddAttachmentBannerToLogos < ActiveRecord::Migration[5.1]
  def self.up
    change_table :logos do |t|
      t.attachment :banner
    end
  end

  def self.down
    remove_attachment :logos, :banner
  end
end
