require 'rails_helper'

RSpec.describe Url, type: :model do
  describe  "URL Creation" do
    before do
      @url = Url.create(original_url: "www.bbc.co.uk")
    end

    it 'can be created' do
      expect(@url).to be_valid
    end

    it 'cannot be created with an original_url' do
      @url.original_url = nil
      expect(@url).to_not be_valid
    end
  end
end
