class Book < ApplicationRecord

belongs_to :user

has_one_attached :book_image

def get_book_image(width, height)
  unless book_image.attached?
    file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
    book_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
end

validates :title, presence: true
validates :body, presence: true
validates :body, length: { maximum: 200 }

end
