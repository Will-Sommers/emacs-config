(require 'package)

;;; HACK
(defun set-exec-path-from-shell-PATH ()
  "Sets the exec-path to the same value used by the user shell"
  (let ((path-from-shell "/Users/wls/.rvm/gems/ruby-2.0.0-p247/bin:/Users/wls/.rvm/gems/ruby-2.0.0-p247@global/bin:/Users/wls/.rvm/rubies/ruby-2.0.0-p247/bin:/Users/wls/.rvm/bin:/Users/wls/.rvm/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/sbin:/usr/sbin:/usr/local/bin"))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
 
;; call function now
(set-exec-path-from-shell-PATH)

(menu-bar-mode -1)
(when window-system
  (scroll-bar-mode -1)
  (mouse-wheel-mode -1)
  (tool-bar-mode -1))

(setq inhibit-splash-screen t)

(setq initial-scratch-message ";; scratch
")

;; font family
(set-default-font "Source Code Pro-12")

;; automatically delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; the cursor should be a bar instead of a block
(setq-default cursor-type 'bar)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(load "~/.emacs.d/user.el")
