# frozen_string_literal: true

FactoryBot.define do
  factory :picture do
    height { Faker::Number.between(from: 20, to: 30) }
    width { Faker::Number.between(from: 20, to: 30) }
    original_picture do
      ActionDispatch::Http::UploadedFile.new(tempfile: File.new("#{Rails.root}/spec/fixtures/picture.jpg"), filename: "picture.jpg")
    end
    
    association :user, factory: :user
  end
end
