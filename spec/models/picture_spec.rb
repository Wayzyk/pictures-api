# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Picture, type: :model do
  it { is_expected.to have_timestamps }
  it { is_expected.to validate_presence_of(:height) }
  it { is_expected.to validate_presence_of(:width) }
  it { is_expected.to validate_presence_of(:original_picture) }
  it { is_expected.to validate_numericality_of(:height).greater_than(0) }
  it { is_expected.to validate_numericality_of(:width).greater_than(0) }

  it { is_expected.to belong_to(:user) }

  describe '#picture_url' do
    let(:picture) { create(:picture) }

    it 'returns link to scaled picture version' do
      expect(picture.picture_url).to eq(picture.original_picture.scaled.url)
    end
  end
end
