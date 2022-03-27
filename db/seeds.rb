readme_path = Rails.root.join('README.md')

content = File.read(readme_path)

Text.create(body: content).update(token: 'about')
