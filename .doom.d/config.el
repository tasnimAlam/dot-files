;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Tasnim Alam"
      user-mail-address "tasnimalamcse@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Monaco" :size 16))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-one-light)

(setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; Open in home directory
(setq default-directory "~/")
(setq blink-cursor-mode 0)

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
(setq-default evil-escape-key-sequence "kj")
(setq avy-all-windows t)

;;Org mode keybindings
;; (after! org
;; (map! :map org-mode-map
;;       :n 'M-j' #'org-metadown
;;       :n 'M-k' #'org-metaup))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; tabnine config
;; (setq +lsp-company-backend '(company-lsp :with company-tabnine :separate))
;; (after! company
;;   (setq company-idle-delay 0
;;         company-show-numbers t))

;; Run js2 as minor mode
(add-hook 'js-mode-hook 'js2-minor-mode)

;; Prettier config
 (add-hook 'js2-mode-hook 'prettier-js-mode)
 (add-hook 'web-mode-hook 'prettier-js-mode)
 (add-hook 'typescript-mode-hook 'prettier-js-mode)

;; Easymotion config
(map! :leader "a" #'evil-avy-goto-char-timer)

;;Company config
(after! company
  (setq company-minimum-prefix-length 2)
  (setq company-idle-delay 0)                         ; decrease delay before autocompletion popup shows
  (setq company-echo-delay 0)                          ; remove annoying blinking
  (setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
  (global-company-mode t))

(setq-default typescript-indent-level 2)

;; Config rust developement
(setq rustic-lsp-server 'rust-analyzer)

(setq-default flycheck-disabled-checkers '(css-stylelint))
