module ApplicationHelper
  OG_META_TAGS = {
    title: 'Droptext — закинь текст, отправь ссылку',
    site_name: 'Droptext',
    description: 'Площадка для публикации снипетов'
  }

  def og_meta_tags
    tags = OG_META_TAGS.map do |property, content|
      content_tag('meta', '', property: "og:#{property}", content: content)
    end

    tags.join("\n").html_safe
  end
end
