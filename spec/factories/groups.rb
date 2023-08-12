FactoryBot.define do
    factory :group do
      name { "Sample Group" }
      icon { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'images', 'dummy_image.jpg'), 'image/jpeg') }
      user
    end
  end
  