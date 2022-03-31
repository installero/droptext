pages = {
  'README.md' => 'about',
  'disclamer.md' => 'disclamer'
}

pages.each do |filename, token|
  file_path = Rails.root.join(filename)
  content = File.read(file_path)
  snippet = Snippet.find_or_create_by!(token: token)
  snippet.update(body: content)
end
