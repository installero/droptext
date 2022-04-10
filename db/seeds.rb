pages =
  [
    { filename: 'README.md', markdown: :markdown, token: 'about' },
    { filename: 'disclamer.md', markdown: :markdown, token: 'disclamer' }
  ]

pages.each do |page|
  page => { filename:, markdown:, token: }
  file_path = Rails.root.join(filename)
  content = File.read(file_path)
  snippet = Snippet.find_or_create_by!(token: token)
  snippet.update(body: content, markdown: markdown)
end
