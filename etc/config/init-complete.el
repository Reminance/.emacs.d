;; 著名的Emacs补全框架
(use-package 
  company 
  :defer 2 
  :hook (after-init . global-company-mode) 
  :init (setq company-tooltip-align-annotations t company-idle-delay 0 company-echo-delay 0
              company-minimum-prefix-length 1 company-require-match nil company-dabbrev-ignore-case
              nil company-dabbrev-downcase nil company-show-numbers t) 
  :config 
  :bind (:map company-active-map
              ("M-n" . nil) 
              ("M-p" . nil) 
              ("C-n" . #'company-select-next) 
              ("C-p" . #'company-select-previous)) 
  (:map leader-key
        ("c s" . #'company-yasnippet))) 

;; 人工智能补全代码
(use-package 
  company-tabnine
  :disabled 
  :ensure t 
  :after 'company-mode 
  'company-tabnine-mode 
  :config (add-to-list 'company-backends #'company-tabnine))

;; Emacs对语言服务器支持的插件
(use-package 
  lsp-mode 
  :ensure t
  :defer t
  :commands lsp
  :hook ((java-mode python-mode js-mode js2-mode web-mode c-mode c++-mode objc-mode) . lsp)
  :custom
  (lsp-idle-delay 1200)
  (lsp-auto-guess-root nil)
  (lsp-file-watch-threshold 2000)
  (read-process-output-max (* 1024 1024))
  (lsp-eldoc-hook nil)
  (lsp-prefer-flymake nil)
  :bind (:map lsp-mode-map
			  ("C-c C-f" . lsp-format-buffer)
			  ("M-RET" . lsp-ui-sideline-apply-code-actions)
			  ("M-\\" . lsp-execute-code-action))
  :config
  (setq lsp-prefer-capf t))

;; 各个语言的Debug工具
(use-package dap-mode
  :ensure t
  :diminish
  :bind
  (:map dap-mode-map
		(("<f3>" . dap-debug)
		 ("<f4>" . dap-continue)
		 ("<f5>" . dap-next)
		 ("<f6>" . dap-step-in)
		 ("<f7>" . dap-step-out)
		 ("<f8>" . dap-breakpoint-toggle))))

(provide 'init-complete)

;; 美化company
(use-package 
  company-box 
  :ensure t 
  :hook (company-mode . company-box-mode))

;; 代码片段
(use-package 
  yasnippet 
  :ensure t 
  :commands (yas-reload-all) 
  :init (autoload 'yas-minor-mode-on "yasnippet") 
  (setq yas-snippet-dirs '("~/.emacs.d/etc/snippets")) 
  (dolist (x '(org-mode-hook prog-mode-hook snippet-mode-hook)) 
    (add-hook x #'yas-minor-mode-on)))

(provide 'init-complete)
