;;; Java 支持
(use-package lsp-ui)
(use-package lsp-java
  :ensure t
  :config
  (setq lsp-java-server-install-dir (expand-file-name "~/.emacs.d/var/lsp/java"))
  (add-hook 'java-mode-hook 'lsp)
  )
(use-package dap-mode :after lsp-mode :config (dap-auto-configure-mode))
(use-package dap-java :ensure nil)

(provide 'init-java)
