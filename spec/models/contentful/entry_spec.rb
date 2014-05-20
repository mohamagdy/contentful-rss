require 'spec_helper'

describe Contentful::Entry do
  let(:user) { FactoryGirl.create(:user) }

  let(:contentful_entry) do
    client = Contentful::Client.new(
      access_token: user.access_token,
      space: user.space
    )

    client.entry("nyancat")
  end

  context "display entry fields" do
    it "should return openstruct that responds with main fields" do
      expect(
        contentful_entry.display.publication_date
      ).to eq(contentful_entry.updated_at)

      expect(
        contentful_entry.display.title
      ).to eq(contentful_entry.sys[:id])

      contentful_entry.fields do |field_name, field_value|
        expect(
          contentful_entry.display.description
        ).to eq("#{field_name}: #{field_value}")
      end
    end
  end
end
