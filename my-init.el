;;; package --- Main init file
;;; Commentary:
;;; This is my init file

;;; Code:

(add-to-list 'load-path "C:/Vaidy/emacs_init/my-elisp")
(add-to-list 'load-path "C:/Vaidy/emacs_init/my-elisp/screenshot.el")

(setq url-proxy-services
   '(("http"  . "185.46.212.88:80")
     ("https" . "185.46.212.88:80")))


(setq url-http-proxy-basic-auth-storage
    (list (list "185.46.212.88:80"
                (cons "Input your UID !"
                      (base64-encode-string "vgovinda:Shishtaha123#")))))

(require 'base)
(require 'base-theme)
(require 'base-extensions)
(require 'base-functions)
(require 'base-global-keys)
(require 'base-theme)

(require 'my-org)
(require 'my-functions)

;;; (require 'lang-python)

;;; (require 'lang-ruby)

;;; (require 'lang-go)

;;; (require 'lang-javascript)

;;; (require 'lang-web)

;;; (require 'lang-haskell)


(require 'screenshot)
(setq screenshot-schemes
      '(
        ;; To local image directory
        ("local"
         :dir "C:/Users/vgovinda/org-files/")            ; Image repository directory
)
(setq screenshot-default-scheme "local")




(require 'lang-c)

;; Ergoemacs
; (setq ergoemacs-theme "lvl2")
; (setq ergoemacs-keyboard-layout "us")
; (require 'ergoemacs-mode)
; (ergoemacs-mode 1)

;; (require 'lang-clojure)
