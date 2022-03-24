;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Elias Lundell"
      user-mail-address "lundell.elias@protonmail.com")

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
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Fira Code" :size 30 :weight 'medium))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dark+)

;; (custom-set-faces '(default ((t (:background "#1d1f21")))))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

(setq auto-save-default t
      make-backup-files t)

(setq confirm-kill-emacs nil)

;; (add-hook 'after-make-frame-functions 'toggle-frame-fullscreen)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq-default tab-width 4
              indent-tabs-mode nil)
(setq-default c-default-style "linux"
              c-basic-offset 4)
(setq-default js-indent-level 4)


(defun prog-custom-settings ()
  (setq tab-width 4)
  (setq c-basic-offset 4)
  (setq js-indent-level 4)
  (setq lsp-enable-indentation nil))

(add-hook 'prog-mode-hook 'prog-custom-settings)

(setq select-enable-clipboard t)
(setq yank-pop-change-selection t)
(setq save-interprogram-paste-before-kill t)

(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\C-cc" 'whole-line-or-region-comment-dwim-2)
    map)
  "my-keys-minor-mode keymap.")

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter " my-keys")

(my-keys-minor-mode 1)

(setq company-idle-delay 0.05)
(setq company-minimum-prefix-length 3)

(setq +ligatures-extras-in-modes nil)

(let ((ligatures-to-disable '(:true :false :int :float :str :bool :list :and :or :for :not :def :null :return :require :import)))
  (dolist (sym ligatures-to-disable)
    (plist-put! +ligatures-extra-symbols sym nil)))


(add-hook 'python-mode-hook
          (lambda ()
            (set 'prettify-symbols-alist (default-value 'prettify-symbols-alist))
            (delete '("x" 57707) prettify-symbols-alist)
            (set 'tab-width 4)
            nil t))

(add-hook 'c-mode-common-hook
          (lambda ()
            (delete '("x" 57707) prettify-symbols-alist)
            nil t))

(add-hook 'rjsx-mode-hook
          (lambda ()
            (delete '("x" 57707) prettify-symbols-alist)
            nil t))

;; (add-hook 'html-mode-hook
;;           (lambda ()
;;             (set 'prettify-symbols-alist (default-value 'prettify-symbols-alist))
;;             (delete '("x" 57707) prettify-symbols-alist)
;;             (set 'tab-width 4)
;;             nil t))

(add-hook 'js-mode-hook
          (lambda ()
            (set 'js--prettify-symbols-alist (default-value 'prettify-symbols-alist))
            (set 'prettify-symbols-alist (default-value 'prettify-symbols-alist))
            ))

(setq +ligatures-in-modes t)

(add-hook 'vterm-mode-hook
          (lambda ()
            (define-key vterm-mode-map "\C-c\C-C" 'vterm-send-C-c)))

(defun evil-collection-vterm-escape-stay ()
  "Go back to normal state but don't move
cursor backwards. Moving cursor backwards is the default vim behavior but it is
not appropriate in some cases like terminals."
  (setq-local evil-move-cursor-back nil))

(add-hook 'vterm-mode-hook #'evil-collection-vterm-escape-stay)

(set-background-color "gray11") ; #1c1c1c

;;(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
;;(set-frame-parameter (selected-frame) 'alpha <both>)
(set-frame-parameter (selected-frame) 'alpha '(85 . 70))
(add-to-list 'default-frame-alist '(alpha . (85 . 70)))

(defun toggle-transparency ()
   (interactive)
   (let ((alpha (frame-parameter nil 'alpha)))
     (set-frame-parameter
      nil 'alpha
      (if (eql (cond ((numberp alpha) alpha)
                     ((numberp (cdr alpha)) (cdr alpha))
                     ;; Also handle undocumented (<active> <inactive>) form.
                     ((numberp (cadr alpha)) (cadr alpha)))
               100)
          '(85 . 70) '(100 . 100)))))
 (global-set-key (kbd "C-c t") 'toggle-transparency)


;; (defvar hexcolor-keywords
;;   '(("#[[:xdigit:]]\\{6\\}"
;;      (0 (put-text-property (match-beginning 0)
;;                            (match-end 0)
;;                            'face (list :background
;;                                        (match-string-no-properties 0)))))))

;; (defun hexcolor-add-to-font-look ()
;;   (font-lock-add-keywords nil hexcolor-keywords))

;; (add-hook 'prog-mode-hook 'hexcolor-add-to-font-look)

(add-hook 'company-mode-hook
          (lambda ()
            (define-key company-active-map (kbd "<tab>") 'company-complete-selection)
            (define-key company-active-map (kbd "TAB") 'company-complete-selection)
            (define-key company-active-map (kbd "<return>") nil)
            (define-key company-active-map (kbd "RET") nil)
            ))

(add-hook 'ivy-mode-hook
          (lambda ()
            (define-key ivy-minibuffer-map (kbd "<tab>") 'ivy-alt-done)
            (define-key ivy-minibuffer-map (kbd "TAB") 'ivy-alt-done)
            (define-key ivy-minibuffer-map (kbd "C-i") 'ivy-partial-or-done)
            (define-key ivy-minibuffer-map (kbd "RET") 'ivy-immediate-done)
            ))

(define-prefix-command 'multiedit-keymap)
(define-key 'multiedit-keymap (kbd "c") 'mc/edit-lines)
(define-key 'multiedit-keymap (kbd "b") 'mc/edit-beginnings-of-lines)
(define-key 'multiedit-keymap (kbd "1") 'mc/insert-numbers)
(define-key 'multiedit-keymap (kbd "v") 'mc/vertical-align-with-space)
(define-key 'multiedit-keymap (kbd "a") 'mc/mark-all-dwim)
(define-key 'multiedit-keymap (kbd "n") 'mc/mark-next-lines)
(define-key 'multiedit-keymap (kbd "p") 'mc/mark-previous-lines)
(global-set-key (kbd "C-c m") 'multiedit-keymap)

(evil-define-key 'normal 'global "U" 'evil-redo)

(defun replace-buffer-with-clipboard ()
  (interactive)
  (delete-region (point-min) (point-max))
  (yank))

(global-set-key (kbd "C-c r") 'replace-buffer-with-clipboard)

;; (projectile-add-known-project "~/code/python")


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
