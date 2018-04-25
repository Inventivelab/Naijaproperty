class RemoveAttachmentImageToListings < ActiveRecord::Migration[5.1]
  def change
    remove_attachment :listings, :image
  end
end
