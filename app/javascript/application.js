import '@hotwired/turbo-rails'
import './controllers'

import { HighlightJS } from 'highlight.js'
import ClipboardJS from 'clipboard'

document.addEventListener('turbo:load', (event) => {
  HighlightJS.highlightAll();

  new ClipboardJS('.js-clipboard', {
    text: function(trigger) {
      return trigger.getAttribute('data-clipboard-text')
    }
  })
})
