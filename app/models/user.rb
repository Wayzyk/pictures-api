# frozen_string_literal: true

class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :auth_token, type: String

  has_many :pictures

  before_create :generate_auth_token

  private

  def generate_auth_token
    self.auth_token = Digest::SHA256.hexdigest(Time.zone.now.to_s)
  end
end
