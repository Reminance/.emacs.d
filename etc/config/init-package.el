(require 'package)

(package-initialize) ;; You might already have this line

(setq package-archives '(("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(provide 'init-package)
 
