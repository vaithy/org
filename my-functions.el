
; (defun xah-open-file-fast ()
  ; "Prompt to open a file from bookmark `bookmark-bmenu-list'.
; This command is similar to `bookmark-jump', but use `ido-mode' interface, and ignore cursor position in bookmark.

; URL `http://ergoemacs.org/emacs/emacs_hotkey_open_file_fast.html'
; Version 2017-04-26"
  ; (interactive)
  ; (require 'bookmark)
  ; (bookmark-maybe-load-default-file)
  ; (let (($this-bookmark
         ; (ido-completing-read "Open bookmark:" (mapcar (lambda ($x) (car $x)) bookmark-alist))))
    ; (find-file (bookmark-get-filename $this-bookmark))
    ; ;; (bookmark-jump -this-bookmark)
; ))


; (defun my-open-workspace-fast ()
  ; "Prompt to open a workspace from `workspace-alist'."
  ; (interactive)
  ; (let (($this-wkspc
         ; (ido-completing-read "Open workspace:" (mapcar (lambda ($x) (car $x)) workspace-alist))))
    ; (dired $this-wkspc)
; ))


;;; Copied from xah-open-file-fast()
(defun open-file-dir-fast (openCode)
  "Prompt to open a file from a pre-defined set."
  (interactive "sOpen file: [aa]org [ab]emacs-init [at]todo [ad]ae-de [dd]Desktop [ap]Py-src [aw]Tools :")
  (setq my-org-home "C:/Users/vgovinda/org-files/")
  (setq my-users "C:/Users/vgovinda/")
  (setq my-emacs-home "C:/Vaidy/emacs_init/")
  (setq my-emacs-lisp "C:/Vaidy/emacs_init/my-elisp/")
  (setq my-cpp-src "C:/Vaidy/src/cpp/")
  (setq my-py-src "C:/Vaidy/src/python/")
  (setq my-tools-src "C:/Vaidy/src/tools/")
  (let (ξfile )
    (setq ξfile
          (cond
           ((string= openCode "aa") (concat my-org-home  "" ))
		   ((string= openCode "ab") (concat my-emacs-lisp  "" ))
		   ((string= openCode "ac") (concat my-cpp-src   "" ))
		   ((string= openCode "ad") (concat my-org-home  "ae-de.org"))
		   ((string= openCode "am") (concat my-org-home  ""))
		   ((string= openCode "an") (concat my-org-home  ""))
		   ((string= openCode "ao") (concat my-org-home  ""))
		   ((string= openCode "ap") (concat my-py-src    "" ))
		   ((string= openCode "at") (concat my-org-home  "todo.org"))
		   ((string= openCode "aw") (concat my-tools-src "" ))
		   ((string= openCode "dd") (concat my-users "Desktop" ))
		   (t (error "You typed 「%s」, it doesn't associate with a file." openCode ))
           )
          )
(find-file ξfile ) ) )

;;; Copied from xah-open-file-fast()
(defun open-file-wkspc-fast (openCode)
  "Prompt to open a file from a pre-defined set."
  (interactive "sOpen file: [0]my18_ae_hev_11_9_1 [1]DE_PHEV_1_25_1 [2]AE_PHEV_1.21_1 [3]BDc_TuringA :")
  (setq my-wkspc-home "C:/Vaidy/workspace/")
  (let (ξfile )
    (setq ξfile
          (cond
           ((string= openCode "0") (concat my-wkspc-home    "my18_ae_hev_11_9_1" ))
		   ((string= openCode "1") (concat my-wkspc-home    "DE_PHEV_1_25_1" ))
		   ((string= openCode "2") (concat my-wkspc-home    "AE_PHEV_1.21_1"))
		   ((string= openCode "3") (concat my-wkspc-home    "BDc_TuringA"))
		   ((string= openCode "4") (concat my-wkspc-home    ""))
		   ((string= openCode "5") (concat my-wkspc-home    ""))
		   ((string= openCode "6") (concat my-wkspc-home    ""))
		   ((string= openCode "7") (concat my-wkspc-home    "" ))
		   ((string= openCode "8") (concat my-wkspc-home    "" ))
		   ((string= openCode "9") (concat my-wkspc-home    "" ))
		   ((string= openCode "10") (concat my-wkspc-home   "" ))
		   (t (error "You typed 「%s」, it doesn't associate with a file." openCode ))
           )
          )
(find-file ξfile ) ) )

(set-frame-font "DejaVu Sans Mono-11")




(defun org-agenda-buffer-screenshot()
  "Take screenshot of the org agenda buffer & save it as a bmp"
  (interactive)
  (internal-show-cursor nil nil)
  (shell-command "C:/Vaidy/bin/boxcutter-1.5/boxcutter.exe -c 53,22,1053,900 c:/users/vgovinda/org-files/agenda.bmp")
  (internal-show-cursor nil true)
)










(provide 'my-functions)
