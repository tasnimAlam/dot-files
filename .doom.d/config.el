;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Tasnim Alam"
      user-mail-address "tasnimalamcse@gmail.com")

;; Font string. You generally only need these two:
(setq doom-font (font-spec :family "Monaco" :size 16))

;; Theme
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Start doom fullscreen mode
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; Custom key bindings
(setq-default evil-escape-key-sequence "kj")
(setq avy-all-windows t)

;; Run js2 as minor mode
(add-hook 'js-mode-hook 'js2-minor-mode)

;; Company config
(setq company-minimum-prefix-length 1
      company-idle-delay 0.0)

;; Prettier config
 (add-hook 'js2-mode-hook 'prettier-js-mode)
 (add-hook 'web-mode-hook 'prettier-js-mode)
 (add-hook 'typescript-mode-hook 'prettier-js-mode)

;; Easymotion config
(map! :leader "a" #'evil-avy-goto-char-timer)
