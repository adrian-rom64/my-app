class Image < ApplicationRecord
  belongs_to :user
  mount_uploader :file, ImageUploader
  validate :image_size

  private

  def image_size
    if file.size > 5.megabytes
      errors.add(:file, 'should be less than 5MB')
    end

end
