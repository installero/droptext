class Snippet < ApplicationRecord
  enum markdown: {
    auto: 'auto',
    apache: 'apache',
    bash: 'bash',
    c: 'c',
    coffeescript: 'coffeescript',
    cpp: 'cpp',
    crystal: 'crystal',
    csharp: 'csharp',
    csp: 'csp',
    css: 'css',
    dart: 'dart',
    diff: 'diff',
    django: 'django',
    dockerfile: 'dockerfile',
    elixir: 'elixir',
    elm: 'elm',
    erb: 'erb',
    erlang: 'erlang',
    go: 'go',
    gradle: 'gradle',
    graphql: 'graphql',
    groovy: 'groovy',
    haml: 'haml',
    haskell: 'haskell',
    ini: 'ini',
    java: 'java',
    javascript: 'javascript',
    json: 'json',
    kotlin: 'kotlin',
    less: 'less',
    lisp: 'lisp',
    lua: 'lua',
    makefile: 'makefile',
    markdown: 'markdown',
    matlab: 'matlab',
    nginx: 'nginx',
    nix: 'nix',
    objectivec: 'objectivec',
    perl: 'perl',
    pgsql: 'pgsql',
    php: 'php',
    plaintext: 'plaintext',
    properties: 'properties',
    protobuf: 'protobuf',
    python: 'python',
    r: 'r',
    ruby: 'ruby',
    scala: 'scala',
    scheme: 'scheme',
    scss: 'scss',
    shell: 'shell',
    smalltalk: 'smalltalk',
    sql: 'sql',
    swift: 'swift',
    typescript: 'typescript',
    vim: 'vim',
    yaml: 'yaml',
  }, _suffix: true
end
