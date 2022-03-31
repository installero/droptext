import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  connect() {
    this.form = document.querySelector('#snippet_form')
    this.modal = document.querySelector('#unsafe-modal-confirm')
    this.backdrop = document.querySelector('#unsafe-modal-backdrop')
  }

  async submitForm() {
    const formData = new FormData(this.form)

    const response =
      await fetch(this.form.action, {
        method: 'post',
        body: formData
      })

    const json = await response.json()
    const unsafe_words = json.unsafe_words
    const token = json.token

    if (unsafe_words && !token) {
      document.querySelector('#unsafe-words').innerHTML = unsafe_words[0]
      this.toggleUnsafeConfirmModal()
    }

    if (token) {
      window.location.href = `/s/${encodeURIComponent(token)}`
    }
  }

  toggleUnsafeConfirmModal() {
    this.modal.classList.toggle('hidden')
    this.backdrop.classList.toggle('hidden')
    this.modal.classList.toggle('flex')
    this.backdrop.classList.toggle('flex')
  }

  unsafeSnippetSubmitForm() {
    const unsafeConfirmInput = document.createElement('input')

    Object.assign(unsafeConfirmInput, {
      type: 'hidden',
      value: true,
      name: 'skip_check_unsafe_words'
    })

    this.form.appendChild(unsafeConfirmInput)
    this.toggleUnsafeConfirmModal()
    this.submitForm()
  }
}
