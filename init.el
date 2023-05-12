;;; package --- Summary:
;;; Commentary:
;;; This is where the initialization takes place
;;; Code:


;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless(package-installed-p 'use-package)
            
  (package-refresh-contents)
  (package-install 'use-package))
 
; Adding use-package, we will be using it continuously
(require 'use-package)
(setq use-package-always-ensure t)

;; From use-package README
(eval-when-compile
  (require 'use-package))
(require 'bind-key)

;;; Load the config
;;; Org-may need to be installed seperately
(org-babel-load-file (concat user-emacs-directory "emacs.org"))
(setq gc-cons-threshold (* 2 1000 1000))
(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "latex --shell-escape")
 '(TeX-view-program-list '(("zathura" ("zathura") "")))
 '(TeX-view-program-selection
   '(((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Zathura")
     (output-html "xdg-open")))
 '(dashboard-banner-logo-title "Welcome to Simon's Emacs config")
 '(dashboard-buffer-last-width 212)
 '(dashboard-center-content t)
 '(dashboard-set-file-icons t)
 '(dashboard-set-navigator t)
 '(dashboard-startup-banner 'logo)
 '(eldoc-box-max-pixel-width 400)
 '(eldoc-box-offset '(1450 16 16))
 '(eldoc-echo-area-prefer-doc-buffer t)
 '(evil-undo-system 'undo-redo)
 '(lsp-bridge-tex-lsp-server "digestif")
 '(nano-modeline-position 'bottom)
 '(notmuch-search-oldest-first t)
 '(org-highlight-latex-and-related '(latex script entities))
 '(package-selected-packages
   '(org-inline-anim dogears corfu-popupinfo corfu consult-eglot kind-icon all-the-icons-completion disaster pdf-tools tree-sitter-langs tree-sitter ctrlf w3m vterm ripgrep yasnippet-snippets xenops which-key visual-fill-column vertico use-package treemacs-tab-bar treemacs-projectile treemacs-magit treemacs-icons-dired treemacs-evil treemacs-all-the-icons smartparens slime rg rainbow-delimiters pyvenv popper platformio-mode paredit ox-reveal org-roam org-ref org-bullets orderless nov notmuch modus-themes marginalia langtool helpful forge flycheck-languagetool excorporate evil-org evil-collection embark-consult eglot doom-modeline diminish dashboard company-box citar))
 '(ripgrep-arguments
   '(" --null --line-buffered --color=never --max-columns=1000 --path-separator /   --smart-case --no-heading --line-number ."))
 '(shell-file-name "/usr/bin/zsh")
 '(warning-suppress-types '((modus-themes) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
