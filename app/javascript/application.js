import '@hotwired/turbo-rails'
import './controllers'

import { hljs } from './lib/hljs'
import ClipboardJS from 'clipboard'

document.addEventListener('turbo:load', (event) => {
  hljs.highlightAll()

  new ClipboardJS('.js-clipboard', {
    text: function(trigger) {
      return trigger.getAttribute('data-clipboard-text')
    }
  })
})
