module Contentful::SyncHelper
  def page_data(page, xml)
    page.items.each { |item| display_item(item, xml) }
  end

  def display_item(item, xml)
    display_item_sys(item.sys, xml)
    display_item_field(item.fields, xml)
  end

  def display_item_sys(sys, xml)

  end

  def display_item_fields(sys, xml)

  end
end
