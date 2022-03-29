readme_path = Rails.root.join('README.md')

content = File.read(readme_path)

Snippet.create!(body: content, token: 'about')
