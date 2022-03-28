# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "highlight.js", to: "https://ga.jspm.io/npm:highlight.js@11.5.0/es/index.js", preload: true
pin "clipboard", to: "https://ga.jspm.io/npm:clipboard@2.0.10/dist/clipboard.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
