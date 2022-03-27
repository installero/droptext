module ApplicationHelper
  OG_META_TAGS = {
    title: 'Droptext — закинь текст, отправвь ссылку',
    site_name: 'Droptext',
    description: 'Площадка для публикации снипетов'
  }

  def text_for_display(text)
    h(text).gsub("\r\n", '<br>').html_safe
  end

  def og_meta_tags
    tags = OG_META_TAGS.map do |property, content|
      content_tag('meta', '', property: "og:#{property}", content: content)
    end

    tags.join("\n").html_safe
  end
end
