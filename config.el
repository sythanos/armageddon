(setq user-full-name "Urban Avsec"
      user-mail-address "urban.avsec@outlook.com")

(setq doom-theme 'doom-dracula)

(setq org-directory "~/org/")

(after! org
  (setq org-startup-with-inline-images t)
  (custom-set-faces!
    '(org-document-title :height 1.4)))

(after! org
  (setq org-agenda-files '("~/OneDrive/Dokumenti/Brain/Tasks"))
  (setq org-todo-keywords '((sequence "TODO(t)" "PROJ(p)" "MEETING(m)" "BLOCKED(b)" "LEARN(l)" "DOING" "|" "DONE(d)" "CANCELLED(c)")))
  )

(setq org-roam-directory "~/OneDrive/Dokumenti/Brain")
(setq org-roam-db-locaiton "~/org-roam.db")
(setq org-roam-tag-sources '(prop first-directory))

(after! org
  (setq org-roam-capture-templates
        '(("T" "Task" plain (function org-roam--capture-get-point)
           "%?"
           :file-name "Tasks/%<%Y%m%d%H%M%S>-${slug}"
           :head "#+TITLE: ${title}\n#+CREATED: %<%Y-%m-%d %H:%M:%S>\n"
           :unnarrowed t)
          ("W" "Wiki" plain (function org-roam--capture-get-point)
           "%?"
           :file-name "Wiki/%<%Y%m%d%H%M%S>-${slug}"
           :head "#+TITLE: ${title}\n#+CREATED: %<%Y-%m-%d %H:%M:%S>\n#+STARTUP: latexpreview showall"
           :unnarrowed t)
          ("Z" "Zettel" plain (function org-roam--capture-get-point)
           "%?"
           :file-name "Zettel/%<%Y%m%d%H%M%S>-${slug}"
           :head "#+TITLE: ${title}\n#+CREATED: %<%Y-%m-%d %H:%M:%S>\n#+STARTUP: latexpreview showall"
           :unnarrowed t)
          ("L" "Literature" plain (function org-roam--capture-get-point)
           "%?"
           :file-name "LiteratureNote/%<%Y%m%d%H%M%S>-${slug}"
           :head "#+TITLE: ${title}\n#+CREATED: %<%Y-%m-%d %H:%M:%S>\n#+STARTUP: latexpreview showall"
           :unnarrowed t))))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Org - Attach Settings
(setq org-attach-id-dir "~/OneDrive/Dokumenti/Brain/Attachments")

(use-package org-download
  :after org
  :defer nil
  :custom
  (org-download-method 'directory)
  (org-download-imge-dir "~/OneDrive/Dokumenti/Brain/Attachments")
  (org-download-screenshot-method "fireshot gui --raw > %s")
  :config
  (require 'org-download))

;; Org Agenda Configs
;;
;; Org Agenda is used to track my items that needs to happen


;; Org Roam Bibtex Settings
(use-package org-roam-bibtex
  :after org-roam
  :hook (org-roam-mode . org-roam-bibtex-mode)
  )

;; Org Roam Server
(use-package org-roam-server
  :after org-roam
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8080
        org-roam-server-export-inline-images t
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20)
  (defun org-roam-server-open ()
    "Ensure the server is active, then open the roam graph."
    (interactive)
    (org-roam-server-mode 1)
    (browse-url-xdg-open (format "http://localhost:%d" org-roam-server-port))))


;; Org - Noter Configs
(setq org-noter-notes-search-path '("~/OneDrive/Dokumenti/Library"))

;; Org - Ref Configs
(setq reftex-default-bibliography '("~/OneDrive/Dokumenti/Library/Library.bib"))
(setq org-ref-default-bibliography '("~/OneDrive/Dokumenti/Library/Library.bib")
      org-ref-pdf-directory "~/OneDrive/Dokumenti/Library/")
