;;; Java 支持
(use-package lsp-java
  :ensure t
  :config
  (setq lsp-java-server-install-dir (expand-file-name "~/.emacs.d/var/lsp/java"))
  (add-hook 'java-mode-hook 'lsp)
  )
(use-package dap-java :ensure nil)

;; (require 'lsp-java-boot)
;; to enable the lenses
;; (add-hook 'lsp-mode-hook #'lsp-lens-mode)
;; (add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)

(provide 'init-java)
