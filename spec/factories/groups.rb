FactoryBot.define do
  factory :group do
    name { 'Sample Group' }
    icon do
      Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'images', 'dummy_image.jpg'), 'image/jpeg')
    end
    user
  end
end
