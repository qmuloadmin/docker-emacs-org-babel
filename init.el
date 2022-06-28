(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq-default tab-width 4)
;; Org Mode
(use-package org
  :ensure t)
(require 'org)

;; Add go support for Org Babel
(use-package ob-go
  :ensure t
  :config
  (setq org-babel-go-command "GO111MODULE=off go"))
(require 'ob-go)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((go . t)))

(use-package ob-typescript
  :ensure t)
(require 'ob-typescript)

;; HTTP Client For Org Mode (testing)
(use-package ob-http
  :ensure t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (shell . t) ; shell is built in
   (js . t) ; js is built in
   (typescript . t)
   (http . t)))

(use-package typescript-mode :ensure t)
(use-package go-mode :ensure t)
;; rustic should automatically include support for rust in org-src blocks and babel exec
;; everything rust is just better :)
(use-package rustic :ensure t)

; Disable the confirmation prompt on execution since we won't be interactive
(setq org-confirm-babel-evaluate nil)
(setq create-lockfiles nil)

; this function enables calling a particular source block by #+NAME
(defun ob-exec-by-name (name)
  (save-excursion
  (goto-char
   (org-babel-find-named-block name))
  (org-babel-execute-src-block)))

;; random quality of life defaults for the uninitiated
(setq-default truncate-lines nil)
(setq org-startup-truncated nil)
