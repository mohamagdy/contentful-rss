# A wrapper to Contentful Sync API

module Contentful
  class Entry
    def display
      entry = OpenStruct.new(publication_date: self.updated_at)

      self.fields.each do |field_name, field_value|
        entry.title = self.sys[:id]
        entry.description = "#{field_name}: #{field_value}"
      end

      entry
    end
  end
end