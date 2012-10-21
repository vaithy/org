;; ************** Programming Start **************
;; ***********************************************

 ;;Go-to-line mapped to C-l
(global-set-key "\C-l" 'goto-line)


;; Tabs won't indent
(setq indent-tabs-mode nil)

;; Four spaces per tabs
(setq default-tab-width 4)
(setq-default tab-width 4)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(global-set-key "\C-b" 'select-block)

; (eshell)

(put 'downcase-region 'disabled nil)

(delete-selection-mode t)       ; delete the selection area with a keypress

;Enable cua mode. Just try for a few days.
(cua-mode 1)

;Enable CEDET
;(load-file "C:/home/emacs/cedet-1.1/common/cedet.el")
;(global-ede-mode 1)                      ; Enable the Project management system
;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;(global-srecode-minor-mode 1)            ; Enable template insertion menu


;; ******************** Add ECB *********************
;; ************************************************

;(add-to-list 'load-path "C:/home/emacs/ecb-2.40")
;(load-file "C:/home/emacs/ecb-2.40/")
;(require 'ecb)
;(require 'ecb-autoloads)

;; ************** Programming End ****************
;; ***********************************************



;; ************** Behavior Start **************
;; ********************************************

;; Map C-w to quit the window
(global-set-key "\C-w" 'quit-window)


;; Delete using the delete char !!!!!!!!!!!!!!!!! TODO !!!!!!!!!!!!!!!!!!!
(global-set-key [del] 'delete-region)


;;Place Backup Files in Specific Directory ==========
;; Enable backup files.
(setq make-backup-files t)
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backups/"))))

;; Indicate blank lines
;; '(indicate-empty-lines t)
'(line-number-display-limit 10000)


;;Customisations specific to C programming language
'(c-doc-comment-style (quote ((c-mode) (pike-mode . autodoc))))
'(c-echo-syntactic-information-p t)
'(c-enable-xemacs-performance-kludge-p t)
'(c-ignore-auto-fill (quote (string c c++ cpp code)))
'(c-indent-comments-syntactically-p t)
'(c-mode-common-hook nil)
'(c-report-syntactic-errors t)
;; '(c-strict-syntax-p t)

;;Default key bindings
;(windmove-default-keybindings)
(windmove-default-keybindings 'super)

;; Load folding.el
(autoload 'folding-mode "folding"
 "Minor mode that simulates a folding editor" t)


;;Set the default width and height when starting up
;; (defun set-frame-size-according-to-resolution ()
;;   (interactive)
;;   (if window-system
;;   (progn
;;     ;; use 120 char wide window for largeish displays
;;     ;; and smaller 80 column windows for smaller displays
;;     ;; pick whatever numbers make sense for you
;;     (if (> (x-display-pixel-width) 1280)
;;         (add-to-list 'default-frame-alist (cons 'width 150))
;;       (add-to-list 'default-frame-alist (cons 'width 150)))
;;     ;; for the height, subtract a couple hundred pixels
;;     ;; from the screen height (for panels, menubars and
;;     ;; whatnot), then divide by the height of a char to
;;     ;; get the height we want
;;     (add-to-list 'default-frame-alist
;;                  (cons 'height (/ (- (x-display-pixel-height) 210) (frame-char-height)))))))


;; (set-frame-size-according-to-resolution)

;; Start up actions

;; Maximize the window on startup
(defun w32-maximize-frame ()
  "Maximize the frame"
  (interactive)
  (w32-send-sys-command 61488)
)

(add-hook 'window-setup-hook 'w32-maximize-frame t)


;; Change the cursor colour depending on file read/write mode

;; Change cursor color according to mode; inspired by
;; http://www.emacswiki.org/emacs/ChangingCursorDynamically
(setq djcb-read-only-color       "DarkSlateGray")
;; valid values are t, nil, box, hollow, bar, (bar . WIDTH), hbar,
;; (hbar. HEIGHT); see the docs for set-cursor-type

(setq djcb-read-only-cursor-type '(hbar.10) )
(setq djcb-overwrite-color       "red")
(setq djcb-overwrite-cursor-type 'box)
(setq djcb-normal-color          "blue")
(setq djcb-normal-cursor-type    'bar)

;; Start emacs server.. Allows to open multiple files in the same display window
(require 'server)
(or (server-running-p)
    (server-start))

;; Uniquify mode
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")

(put 'narrow-to-region 'disabled nil)
(setq make-backup-files nil)
(setq-default truncate-lines t)
(global-set-key "\C-z" 'undo)
(global-set-key "\M-\C-z" 'iconify-or-deiconify-frame)
(global-set-key "\C-@" 'shell)
(global-set-key [f10] 'call-last-kbd-macro)
(global-set-key (kbd "<C-tab>") 'other-window) ;; will work in non-org mode buffers
(global-set-key (kbd "C-<f4>") 'delete-window)
(global-set-key (kbd "M-<f4>") 'delete-frame)
(global-set-key (kbd "S-M-<f4>") 'save-buffers-kill-emacs)
;(global-set-key (kbd "C-x C-c") nil)
(global-set-key (kbd "C-n") 'make-frame)

(global-set-key [f12] 'make-notes-frame)
(global-set-key [f8] 'linum-mode)
(windmove-default-keybindings)
(winner-mode t)
(iswitchb-mode t)


;; ************** Behavior End **************
;; ******************************************


;; ************** Personal packages start **************
;; *****************************************************

;; Personal lisp packages directory
;; Tell emacs where is your personal elisp lib dir
;; this is the dir you place all your extra packages
(add-to-list 'load-path "C:/home/.emacs.d")
(add-to-list 'load-path "C:/home/emacs/tabbar")
(add-to-list 'load-path "C:/home/emacs/yasnippet")
;(add-to-list 'load-path "C:/home/emacs/ahk-mode")


;; Load all the additional packages

;; load the tabbar.
(load "tabbar")
;(load "ahk-mode")

(tabbar-mode 1)
;(ahk-mode 1)

(global-set-key (kbd "M-j") 'tabbar-backward)
(global-set-key (kbd "M-k") 'tabbar-forward)

(require 'ido)

;;;; Setup yasnippet
(require 'yasnippet-bundle)



;; ************** Personal packages end **************
;; ***************************************************



;; ************** Configure  printer start ***********
;; ***************************************************

(setq printer-name nil)
(setq lpr-command "C:/Program Files/Caterpillar/PDF Writer/PDFWriterV2.exe")
(setq lpr-switches '("/q"))
(setq ps-lpr-command "C:/Program Files/Caterpillar/PDF Writer/PDFWriterV2.exe")
(setq ps-lpr-switches '("/q"))

;; ************** Configure  printer end ***********
;; ***************************************************


(setq toggle-debug-on-error 1)

