require 'spec_helper'

describe Contentful::DeletedEntry do
  let(:user) { FactoryGirl.create(:user) }

  let(:contentful_deleted_entry) do
    client = Contentful::Client.new(
      access_token: user.access_token,
      space: user.space
    )

    client.entry("nyancat")
  end

  context "display deleted entry fields" do
    it "should return openstruct that responds with main fields" do
      expect(
        contentful_deleted_entry.display.publication_date
      ).to eq(contentful_deleted_entry.updated_at)

      expect(
        contentful_deleted_entry.display.title
      ).to eq(contentful_deleted_entry.sys[:id])
    end
  end
end
