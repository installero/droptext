import '@hotwired/turbo-rails'
import './controllers'

import hljs from './lib/highlight.js'
import ClipboardJS from 'clipboard'
import Choices from 'choices.js'

document.addEventListener('turbo:load', (event) => {
  hljs.highlightAll()

  new ClipboardJS('.js-clipboard', {
    text: function(trigger) {
      return trigger.getAttribute('data-clipboard-text')
    }
  })

  const languageSelect = document.querySelector('#snippet_language')

  if (languageSelect) {
    new Choices(languageSelect, {
      noResultsText: languageSelect.dataset.noResults,
      itemSelectText: languageSelect.dataset.itemSelect,
      sorter: (a, b) => new Intl.Collator(languageSelect.dataset.locale).compare(a.label, b.label),
    })
  }
})
