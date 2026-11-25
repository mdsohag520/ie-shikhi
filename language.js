(function () {
  'use strict';

  const KEY = 'ie-shikhi-language';
  const DEFAULT_LANG = 'bn';

  function getLang() {
    return localStorage.getItem(KEY) || DEFAULT_LANG;
  }

  function setCookie(value) {
    document.cookie = 'googtrans=' + value + ';path=/;max-age=31536000;SameSite=Lax';
  }

  function clearCookie() {
    document.cookie = 'googtrans=;path=/;expires=Thu, 01 Jan 1970 00:00:00 GMT;SameSite=Lax';
  }

  function switchLanguage(lang) {
    if (lang !== 'bn' && lang !== 'en') return;

    localStorage.setItem(KEY, lang);

    if (lang === 'bn') {
      clearCookie();
    } else {
      setCookie('/bn/en');
    }

    location.reload();
  }

  const style = document.createElement('style');
  style.textContent = `
    #ie-language-switch {
      position: fixed;
      right: 14px;
      bottom: 18px;
      z-index: 99999;
      display: flex;
      align-items: center;
      gap: 3px;
      padding: 5px;
      border-radius: 30px;
      background: #14213D;
      box-shadow: 0 3px 14px rgba(0,0,0,.25);
      font-family: Arial, sans-serif;
    }
    #ie-language-switch button {
      border: 0;
      border-radius: 22px;
      padding: 9px 14px;
      min-width: 46px;
      font-size: 14px;
      font-weight: 700;
      cursor: pointer;
      background: transparent;
      color: #fff;
    }
    #ie-language-switch button.active {
      background: #E9B824;
      color: #14213D;
    }
    body { top: 0 !important; }
    iframe.goog-te-banner-frame,
    .goog-te-banner-frame {
      display: none !important;
      visibility: hidden !important;
    }
    .goog-te-gadget {
      display: none !important;
    }
    #google_translate_element {
      position: fixed;
      left: -10000px;
      top: 0;
      width: 1px;
      height: 1px;
      overflow: hidden;
    }
  `;
  document.head.appendChild(style);

  // Keep Google's translation toolbar hidden.
  function hideGoogleToolbar() {
    if (!document.body) return;

    document.querySelectorAll(
      'iframe.goog-te-banner-frame, iframe.skiptranslate, ' +
      'body > .skiptranslate, .goog-te-banner-frame, ' +
      '.goog-te-balloon-frame, #goog-gt-tt'
    ).forEach(function (el) {
      if (el.id === 'google_translate_element') return;
      el.style.setProperty('display', 'none', 'important');
      el.style.setProperty('visibility', 'hidden', 'important');
      el.style.setProperty('height', '0', 'important');
    });

    document.documentElement.style.setProperty('margin-top', '0', 'important');
    document.body.style.setProperty('top', '0', 'important');
    document.body.style.setProperty('margin-top', '0', 'important');
  }

  const toolbarObserver = new MutationObserver(hideGoogleToolbar);

  function startToolbarProtection() {
    hideGoogleToolbar();
    toolbarObserver.observe(document.documentElement, {
      childList: true,
      subtree: true,
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', startToolbarProtection);
  } else {
    startToolbarProtection();
  }


  function createSwitch() {
    if (document.getElementById('ie-language-switch')) return;

    const box = document.createElement('div');
    box.id = 'ie-language-switch';
    box.className = 'notranslate';
    box.setAttribute('translate', 'no');
    box.setAttribute('aria-label', 'Select language');

    ['bn', 'en'].forEach(function (lang) {
      const button = document.createElement('button');
      button.type = 'button';
      button.className = 'notranslate';
      button.setAttribute('translate', 'no');
      button.textContent = lang.toUpperCase();
      button.dataset.lang = lang;
      button.className = getLang() === lang ? 'active' : '';
      button.addEventListener('click', function () {
        if (getLang() !== lang) switchLanguage(lang);
      });
      box.appendChild(button);
    });

    document.body.appendChild(box);

    const widget = document.createElement('div');
    widget.id = 'google_translate_element';
    document.body.appendChild(widget);
  }

  window.googleTranslateElementInit = function () {
    if (!window.google || !google.translate) return;

    new google.translate.TranslateElement({
      pageLanguage: 'bn',
      includedLanguages: 'bn,en',
      autoDisplay: false
    }, 'google_translate_element');
  };

  function loadTranslator() {
    if (document.getElementById('ie-google-translate-script')) return;

    const script = document.createElement('script');
    script.id = 'ie-google-translate-script';
    script.src = 'https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit';
    script.async = true;
    document.head.appendChild(script);
  }

  function start() {
    createSwitch();

    if (getLang() === 'en') {
      setCookie('/bn/en');
    }

    loadTranslator();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', start);
  } else {
    start();
  }
})();
