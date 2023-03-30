require 'rails_helper'

RSpec.describe "Public::Relationships", type: :request do
  let(:following) { create(:user) }
  let(:follower) { create(:user) }
end