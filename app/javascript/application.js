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

  const markdownSelect = document.querySelector('#snippet_markdown')

  if (markdownSelect) {
    new Choices(markdownSelect, {
      noResultsText: markdownSelect.dataset.noResults,
      itemSelectText: markdownSelect.dataset.itemSelect,
      sorter: (a, b) => new Intl.Collator(markdownSelect.dataset.locale).compare(a.label, b.label),
    })
  }
})
