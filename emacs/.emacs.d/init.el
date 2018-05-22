;; useful links: http://aaronbedra.com/emacs.d/

;; User details
(setq user-full-name "Yves Ackermann")
(setq user-mail-address "y.ackermann(at)gmail.com")

;; Package management
(load "package")
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


;; Install default packages
(defvar vyse/packages
  '(
    auto-complete
    autopair
    base16-theme
    nord-theme
    xresources-theme
    deft
    htmlize
    ido
    magit
    markdown-mode
    org
    paredit
    smex
    visual-fill-column
  )"default packages")

(require 'cl)

(defun vyse/packages-installed-p ()
  (loop for p in vyse/packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (vyse/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (p vyse/packages)
    (when (not (package-installed-p p))
      (package-install p))))


;; minimal gui, no splash screen
(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(setq ring-bell-function 'ignore)

;; load theme
(load-theme 'xresources t)

;; Marking text
(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

;; backup files
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Answering just 'y' or 'n' will do
(defalias 'yes-or-no-p 'y-or-n-p)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; misc
(setq echo-keystrokes 0.1
      use-dialog-box nil)
(show-paren-mode t)

;; Always display line and column position in the status bar
(setq line-number-mode t)
(setq column-number-mode t)

;; Always show line numbers
(global-linum-mode 1)
(setq linum-format "%d ")
;; Wrap lines on column width 80, with full words
(require 'visual-fill-column)
(global-visual-line-mode 1)
(global-visual-fill-column-mode 1)
(setq fill-column 80)

;; Save a list of recent files visited. (open recent file with C-x f)
(recentf-mode 1)
(setq recentf-max-saved-items 100
      recentf-max-menu-items 15)
;; (global-set-key (kbd "C-c C-r") 'recentf-open-files)

;; Sentences do not need double spaces to end. Period.
(set-default 'sentence-end-double-space nil)

;; autopair braces
(require 'autopair)

;; workaround for dead keys eg. tilde/umlaut etc
(require 'iso-transl)

;; font settings
(setq-default line-spacing 1) ; 行間のポイント数
  (let* ((size 9) ; ASCII フォントのサイズ
    (asciifont "Hack Nerd Font") ;ASCII フォント
      (jpfont "Noto Sans CJK JP") ; 日本語フォント
        (h (* size 9))
        (fontspec (font-spec :family asciifont))
        (jp-fontspec (font-spec :family jpfont)))
        (set-face-attribute 'default nil :family asciifont :height h)
        (set-fontset-font nil 'japanese-jisx0213.2004-1 jp-fontspec) ; JISX0213 04年版
          (set-fontset-font nil 'japanese-jisx0213-2 jp-fontspec) ; JISX0213 00年版
            (set-fontset-font nil 'katakana-jisx0201 jp-fontspec) ; 半角カナ
              (set-fontset-font nil '(#x3040 . #x309F) jp-fontspec) ; ひらがな
                (set-fontset-font nil '(#x0080 . #x024F) fontspec) ; ラテン文字
                  (set-fontset-font nil '(#x0370 . #x03FF) fontspec) ; ギリシャ文字
                    )

;; deft
(setq deft-extension "txt")
(setq deft-text-mode 'markdown-mode)
(setq deft-directory "~/documents/notes")
(setq deft-use-filename-as-title t)
(global-set-key [f12] 'deft)

;; dired
(global-set-key [f11] 'dired)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (xresources-theme visual-fill-column smex paredit markdown-mode magit htmlize deft nord-theme base16-theme autopair auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
