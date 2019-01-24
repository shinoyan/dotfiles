;;; init.el --- 初期化
;;; Commentary:
;;; パッケージ管理ツールのインストール 及び init.orgのビルド
;;; Code:

;;; パッケージ管理ツールのインストール
;;; https://github.com/raxod502/straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;; el-patch, use-packageをインストールする
(straight-use-package 'el-patch)
(straight-use-package 'use-package)

;;; init.orgをコンパイル
(use-package org
  :straight t)
(defvar dropbox-dir "~/Dropbox/")
(defvar my-config-dir (concat (file-name-as-directory user-emacs-directory) "conf.d/"))
;; dotファイルで管理しない様な設定の置き場所
(defvar private-config-dir (concat (file-name-as-directory dropbox-dir) "emacs.d/"))
(org-babel-load-file (expand-file-name "init.org" my-config-dir))
;;; slack.orgが存在する場合はコンパイル
(when (and (file-exists-p (expand-file-name "slack.org" my-config-dir))
           (file-exists-p (expand-file-name "slack-config.el" private-config-dir)))
  (org-babel-load-file (expand-file-name "slack.org" my-config-dir)))
(provide 'init)
;;; init.el ends here
