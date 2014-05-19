# A wrapper to Contentful Sync API
module Contentful
  class Asset
    def display
      OpenStruct.new(
        publication_date: self.updated_at,
        url: self.fields[:file].url,
        title: self.sys[:id],
        description: [self.fields[:title], self.fields[:description]].join(", ")
      )
    end
  end
end
