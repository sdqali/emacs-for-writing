;; Marmalade for more awesomeness
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)


;; file associations
(add-to-list 'auto-mode-alist '("\\Rakefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Capfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))

;;utf
(setq buffer-file-coding-system 'utf-8-unix)
(setq default-file-name-coding-system 'utf-8-unix)
(setq default-keyboard-coding-system 'utf-8-unix)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))
(setq default-sendmail-coding-system 'utf-8-unix)
(setq default-terminal-coding-system 'utf-8-unix)


;; hack to view magit-log when committing from terminal.
;; load-magit-log-when-committing-mode
(define-minor-mode load-magit-log-when-committing-mode
  "dummy")

;; the hook
(defun show-magit-log-hook ()
  (cd "..")
  (magit-log)
  (switch-to-buffer-other-window "COMMIT_EDITMSG"))

;; add the hook
(add-hook 'load-magit-log-when-committing-mode-hook 'show-magit-log-hook)

;; load the mode for commit message
(add-to-list 'auto-mode-alist '("\\COMMIT_EDITMSG\\'" . load-magit-log-when-committing-mode))


;; I don't want a menu bar
(menu-bar-mode -1)

;; ido - because it is awesome
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; don't want toolbar
(toggle-tool-bar-mode-from-frame)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; I want to use these functions; Don't disable them
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Because I want cleaner frames while writing
(global-visual-line-mode)

;; Find binaries installed by Homebrew
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;; Find binaries installed by npm
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/share/npm/bin"))
(setq exec-path (append exec-path '("/usr/local/share/npm/bin")))

;; Because unwanted trailing spaces are ugly.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; autocomplete awesomeness.
(require 'auto-complete)
(global-auto-complete-mode)

;; use aspell, because I write British English and ispell doesn't like that
(setq ispell-program-name "aspell")
(setq ispell-dictionary "british")

;; Key bindings - what it says on the label.
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-M-e") 'eval-buffer)

;; don't pollute cwd tree with temp files.
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;; y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;; word count
(require 'wc-mode)

;; highlight style issue
(require 'writegood-mode)

;;synonyms
(setq synonyms-file        "/Users/sdqali/.mthes10/mthesaur.txt")
(setq synonyms-cache-file  "/Users/sdqali/.mthes10/mthesaur-cache.txt")
(require 'synonyms)

;; writer mode

(define-minor-mode writer-mode
  (writegood-mode)
  (flyspell-mode)
  (wc-mode))

(require 'smartparens)
(require 'markdown-mode)
(require 'octomacs)
(require 'rbenv)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(octomacs-workdir-alist (quote (("sdqali" . "/Users/sdqali/src/sdqali.github.com")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'color-theme-solarized)
(load-theme 'solarized-dark t)

(require 'typopunct)
