require 'spec_helper'

describe Contentful::Asset do
  let(:user) { FactoryGirl.create(:user) }

  let(:contentful_asset) do
    client = Contentful::Client.new(
      access_token: user.access_token,
      space: user.space
    )

    client.asset("nyancat")
  end

  context "display asset fields" do
    it "should return openstruct that responds with main fields" do
      expect(
        contentful_asset.display.publication_date
      ).to eq(contentful_asset.updated_at)

      expect(
        contentful_asset.display.title
      ).to eq(contentful_asset.sys[:id])

      expect(
        contentful_asset.display.description
      ).to eq("#{contentful_asset.fields[:title]}, #{contentful_asset.fields[:description]}")
    end
  end
end