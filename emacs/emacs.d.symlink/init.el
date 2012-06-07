;; (push "/usr/local/bin" exec-path)
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/internet")

(global-set-key
 [f7]
 (lambda () (interactive)
   (find-file "~/.emacs.d/init.el" t)))

(defun jmc-eval-to-here ()
  (interactive)
  (eval-region 0 (point)))
(global-set-key
 [f9]
 'jmc-eval-to-here)

;; Packaging
(setq package-archives
      '(("ELPA" . "http://tromey.com/elpa/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")))

;; look and feel
(if window-system
    (then
     (set-frame-font "Meslo LG M DZ-14")
     (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
     (delete-selection-mode t)
     (scroll-bar-mode -1)
     (tool-bar-mode -1)
     (blink-cursor-mode -1)))


(show-paren-mode t)
(column-number-mode t)
(set-fringe-style -1)
(tooltip-mode -1)

; no starup message
(setq inhibit-startup-message t)

; no visual bell
(setq ring-bell-function 'ignore)

(fset 'yes-or-no-p 'y-or-n-p)

(setq make-backup-files nil)
(setq auto-save-default nil)

;; tab settings
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

;; key bindings
(global-set-key (kbd "C-x g") 'grep)
(global-set-key (kbd "C-x C-g") 'grep)
(global-set-key (kbd "C-<f5>") 'linum-mode)

;; ido settings (fuzzy finder)
(when (require 'ido)
  (ido-mode t)
  (setq ido-max-directory-size 10000
        Ido-enable-flex-matching t)) ;; enable fuzzy matching

;; language settings
(require 'haml-mode nil 'noerror)
(require 'coffee-mode nil 'noerror)
(require 'less-css-mode nil 'noerror)
(require 'php-mode nil 'noerror)