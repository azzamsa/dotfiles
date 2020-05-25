(in-package :next-user)

(defvar *my-keymap* (make-keymap "my-map"))

(define-key *my-keymap*
  "S-m" 'switch-buffer)

(define-mode my-mode ()
  "Dummy mode for the custom key bindings in `*my-keymap*'."
  ((keymap-scheme :initform (keymap:make-scheme
                             scheme:cua *my-keymap*
                             scheme:emacs *my-keymap*
                             scheme:vi-normal *my-keymap*))))


(define-configuration buffer
  ((default-modes (append '(my-mode emacs-mode) %slot-default))))
