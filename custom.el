(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#657b83" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"))
 '(cfs--current-profile "profile1" t)
 '(cfs--profiles-steps (quote (("profile1" . 5))) t)
 '(custom-enabled-themes (quote (idea-darkula)))
 '(custom-safe-themes
   (quote
    ("82b67c7e21c3b12be7b569af7c84ec0fb2d62105629a173e2479e1053cff94bd" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(deft-directory "/Users/gordon/work/notes/")
 '(deft-extensions (quote ("org" "txt" "text" "md" "markdown")))
 '(deft-generation-rules (quote (("org" . "tex") ("md" . "tex"))))
 '(erc-autojoin-channels-alist (quote (("freenode.net" "#c_lang_cn" "#android-dev"))))
 '(erc-insert-timestamp-function (quote erc-insert-timestamp-left))
 '(erc-modules
   (quote
    (autojoin button completion irccontrols keep-place list log match menu move-to-prompt netsplit networks noncommands notify readonly ring smiley sound stamp track)))
 '(erc-nick "cnbleu")
 '(fci-rule-color "#eee8d5")
 '(ibuffer-truncate-lines nil)
 '(newsticker-url-list
   (quote
    (("androiduiux" "https://androiduiux.com/feed/" nil nil nil)
     ("android-developers" "http://android-developers.blogspot.com/atom.xml" nil nil nil)
     ("Cyril Mottier" "http://cyrilmottier.com/atom.xml" nil nil nil)
     ("The Cheese Factory" "https://inthecheesefactory.com/blog/en/rss.xml" nil nil nil)
     ("CollShell" "http://coolshell.cn/feed" nil nil nil)
     ("阮一峰的网络日志" "http://feeds.feedburner.com/ruanyifeng" nil nil nil)
     ("小众软件" "http://feeds.appinn.com/appinns/" nil nil nil)
     ("伯乐在线" "http://blog.jobbole.com/feed/" nil nil nil))))
 '(org-agenda-files (quote ("/Users/gordon/work/GTD/")))
 '(org-confirm-babel-evaluate nil)
 '(org-plantuml-jar-path "~/.emacs.d/plantuml.jar")
 '(org-src-fontify-natively t)
 '(org-startup-indented t)
 '(session-use-package t nil (session))
 '(truncate-lines t)
 '(truncate-partial-width-windows nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2B2B2B" :foreground "#A9B7C6" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "nil" :family "Menlo")))))

;;;;;;;;;;;;;;;;;;;;;;;;
;;pomodora notifier
;;;;;;;;;;;;;;;;;;;;;;;;
(defun notify-osx (title message)
  (call-process "terminal-notifier"
                nil 0 nil
                "-group" "Emacs"
                "-title" title
                "-sender" "org.gnu.Emacs"
                "-message" message
                "-activate" "org.gnu.Emacs")
  )

(add-hook 'org-pomodoro-finished-hook
          (lambda ()
            (notify-osx "Pomodoro completed!" "Time for a break.")))
(add-hook 'org-pomodoro-break-finished-hook
          (lambda ()
            (notify-osx "Pomodoro Short Break Finished" "Ready for Another?")))
(add-hook 'org-pomodoro-long-break-finished-hook
          (lambda ()
            (notify-osx "Pomodoro Long Break Finished" "Ready for Another?")))
(add-hook 'org-pomodoro-killed-hook
          (lambda ()
            (notify-osx "Pomodoro Killed" "One does not simply kill a pomodoro!")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org-mode                                                               ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'org-mode-hook
          (lambda ()
            (setq truncate-lines nil)))
;; support PlantUML
;; active Org-babel languages
(org-babel-do-load-languages 'org-babel-load-languages
                             '((plantuml . t)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; puml
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'auto-mode-alist '("\\.puml\\'" . puml-mode))
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . puml-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keybindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq mac-command-modifier 'super)
(setq mac-option-modifier 'meta)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; chinese-fonts-setup                                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'chinese-fonts-setup)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org gtd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; org-todo
(setq org-todo-keywords
      '((sequence "TODO(t!)" "NEXT(n)" "WAITTING(w)" "SOMEDAY(s)" "|"
                  "DONE(d@/!)" "ABORT(a@/!)")
        )
      )

;; org-capture
(setq org-capture-templates
      '(("n"  "New" entry (file+headline "~/work/GTD/inbox.org" "New")
         "** %? %t \n %i\n %a")
        ("t"  "Task" entry (file+headline "~/work/GTD/task.org" "Tasks")
         "** TODO %?\n %i\n %a")
        ("c"  "Calendar" entry (file+headline "~/work/GTD/task.org" "Tasks")
         "** TODO %?\n %i\n %a")
        ("i" "Idea" entry (file+headline "~/work/GTD/task.org" "Ideas")
         "** %?\n %i\n %a")
        ("r" "Note" entry (file "~/work/GTD/note.org")
         "* %?\n %i\n %a" )
        ("p" "Project" entry (file "~/work/GTD/project.org")
         "** %? %^g\n %i\n %a")
        ("j" "Journal" entry (file+datetree "~/work/GTD/finished.org")
         "** %?\n Entered on %U\n %i\n %a")
        ))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
