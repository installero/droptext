pages =
  [
    { filename: 'README.md', language: :markdown, token: 'about' },
    { filename: 'disclamer.md', language: :markdown, token: 'disclamer' }
  ]

pages.each do |page|
  page => { filename:, language:, token: }
  file_path = Rails.root.join(filename)
  content = File.read(file_path)
  snippet = Snippet.find_or_create_by!(token: token)
  snippet.update(body: content, language: language)
end
