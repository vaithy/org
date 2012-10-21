;; ************** Setup Org  *********************
;; ***********************************************

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(provide (quote org-install))
;; Info directory
(add-to-list 'Info-default-directory-list
             (expand-file-name "/path/to/org-mode/info"))

;; Byte compile org source files
(defvar my/org-lisp-directory "C:\home\emacs\emacs-23.2\lisp\org\lisp"
  "Directory where your org-mode files live.")

(defvar my/org-compile-sources t
  "If `nil', never compile org-sources. `my/compile-org' will only create
the autoloads file `org-install.el' then. If `t', compile the sources, too.")

;; Customize:
(setq my/org-lisp-directory "C:\home\emacs\emacs-23.2\lisp\org\lisp")

;; Customize:
(setq  my/org-compile-sources t)

(defun my/compile-org(&optional directory)
  "Compile all *.el files that come with org-mode."
  (interactive)
  (setq directory (concat
                        (file-truename
                    (or directory my/org-lisp-directory)) "/"))

  (add-to-list 'load-path directory)

  (let ((list-of-org-files (file-expand-wildcards (concat directory "*.el"))))

    ;; create the org-install file
    (require 'autoload)
    (setq esf/org-install-file (concat directory "org-install.el"))
    (find-file esf/org-install-file)
    (erase-buffer)
    (mapc (lambda (x)
            (generate-file-autoloads x))
          list-of-org-files)
    (insert "\n(provide (quote org-install))\n")
    (save-buffer)
    (kill-buffer)
    (byte-compile-file esf/org-install-file t)

    (dolist (f list-of-org-files)
      (if (file-exists-p (concat f "c")) ; delete compiled files
          (delete-file (concat f "c")))
      (if my/org-compile-sources     ; Compile, if `my/org-compile-sources' is t
          (byte-compile-file f)))))


'(load "org")
'(require 'org-install) 
		  
 
 ;; Org mode additions -- Of course copied !!! :)

(setq org-agenda-files (quote 
                               (
								"C:/My Documents and Settings/govinva/My Documents/Dropbox/Org/agenda.org"							   
								"C:/My Documents and Settings/govinva/My Documents/Dropbox/Org/notes.org"
                                "C:/My Documents and Settings/govinva/My Documents/Dropbox/Org/todo.org"
                                "C:/My Documents and Settings/govinva/My Documents/Dropbox/Org/time.org"								
							   )
                       )
)

;; Keybindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key (kbd "<C-M-tab>") 'other-window)


;; Time logging when the TODO is done
(setq org-log-done 'time)

;; Additional to-do key words
;;(setq org-todo-keywords '(    (sequence "TODO" "STARTED" "PENDING" "FEEDBACK" "VERIFY" "|" "DELEGATED" "DONE")))

(setq org-todo-keywords '( 
							(sequence "FUTURE" "TODO" "STARTED" "PENDING" "WAITING" "CANCELLED" "DONE"	) 
						)
)

;; Faces for Org mode -- Copied again...
;available colors -  dimgrey, sienna, blue, steelblue
(setq org-todo-keyword-faces
	'( ("TODO"     .    (:background "yellow" :weight normal))
       ("STARTED"  .    (:background "cyan" :weight normal))
	   ("WAITING"   .   (:foreground "brown" :weight normal))
	   ("CANCELLED" .   shadow)
	   ("SUSPENDED" .   (:foreground "grey" :weight normal))
	   ("DONE"     .    (:foreground "darkgreen" :weight bold))
	 )
)


;; Setup clocking
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)


(defun bh/insert-inactive-timestamp ()
  (interactive)
  (org-insert-time-stamp nil t t nil nil nil)
)

(defun clock-log-in () 
  "Open the specified file and do a org timestamp without prompting user"
  (interactive)
  (setq inputFile "C:\\My Documents and Settings\\govinva\\My Documents\\Dropbox\\Org\\time.org")

  ;; open the file
  (find-file inputFile)
  (goto-char (buffer-size)) 			;; needed in case the file is already open.
  
  (insert "\n---------------------------------------------------------------\n")
  ;; (org-timer-stop)
  ;; (org-timer-start)
  ;; (timer-item "Logged in")
  
  ;; Insert timestamp
  (bh/insert-inactive-timestamp)
  (save-buffer)
  (kill-buffer (current-buffer))
)



(clock-log-in )



;; (bh/insert-inactive-timestamp)

;; ************** Org mode Setup end  ************
;; ***********************************************


