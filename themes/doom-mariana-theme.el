;;; doom-mariana-theme.el --- An implementation of the Sublime Text 4 Mariana theme -*- no-byte-compile: t; -*-
(require 'doom-themes)

(defgroup doom-mariana-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-mariana-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-mariana-theme
  :type 'boolean)

(defcustom doom-mariana-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-mariana-theme
  :type 'boolean)

(defcustom doom-mariana-comment-bg doom-mariana-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-mariana-theme
  :type 'boolean)

(defcustom doom-mariana-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-mariana-theme
  :type '(choice integer boolean))

;;
(def-doom-theme doom-mariana
  "An implementation of the Sublime Text 4 Mariana theme"

  ;; name      default     256       16
  ((bg         '("#2E3842" nil       nil            ))
   (bg-alt     '("#21262A" nil       nil            ))
   (base0      '("#28313A" "black"   "black"        ))
   (base1      '("#4A5865" "#1E1E1E" "brightblack"  ))
   (base2      '("#65737E" "#2E2E2E" "brightblack"  ))
   (base3      '("#A5ACBA" "#262626" "brightblack"  ))
   (base4      '("#BEC5D1" "#3F3F3F" "brightblack"  ))
   (base5      '("#C0C5CE" "#525252" "brightblack"  ))
   (base6      '("#CDD3DE" "#6B6B6B" "brightblack"  ))
   (base7      '("#D8DEE9" "#979797" "white"        ))
   (base8      '("#FFFFFF" "#FFFFFF" "brightwhite"  ))
   (fg         base8)
   (fg-alt     base2)

   (grey       base3)
   (red        '("#FF5161" "#FF5560" "red"          ))
   (orange     '("#FFAB42" "#FFAA44" "brightred"    ))
   (green      '("#A3CE9E" "#A3CE9E" "green"        ))
   (teal       '("#5FB3B3" "#5FB3B3" "brightgreen"  ))
   (yellow     '("#FAB763" "#FAB763" "yellow"       ))
   (blue       '("#6699CC" "#6699CC" "brightblue"   ))
   (dark-blue  '("#406DB7" "#2257A0" "blue"         ))
   (magenta    '("#C594C5" "#C594C5" "magenta"      ))
   (violet     '("#A9A1E1" "#A9AAEE" "brightmagenta"))
   (cyan       '("#46D9FF" "#46D9FF" "brightcyan"   ))
   (dark-cyan  cyan)

   ;; face categories -- required for all themes
   (highlight      base1)
   (vertical-bar   bg-alt)
   (selection      base1)
   (builtin        red)
   (comments       (if doom-mariana-brighter-comments dark-blue (doom-lighten fg-alt 0.2)))
   (doc-comments   (doom-lighten (if doom-mariana-brighter-comments dark-blue fg-alt) 0.25))
   (constants      violet)
   (functions      magenta)
   (keywords       blue)
   (methods        cyan)
   (operators      dark-blue)
   (type           yellow)
   (strings        green)
   (variables      magenta)
   (numbers        orange)
   (region         base1)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-mariana-brighter-modeline)
   (-modeline-pad
    (when doom-mariana-padded-modeline
      (if (integerp doom-mariana-padded-modeline) doom-mariana-padded-modeline 4)))

   (modeline-fg nil)
   (modeline-fg-alt base3)

   (modeline-bg
    (if -modeline-bright
	(doom-darken blue 0.45)
      `(,(doom-darken (car bg-alt) 0.1) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
	(doom-darken blue 0.475)
      `(,(doom-darken (car bg-alt) 0.15) ,@(cdr base0))))
   (modeline-bg-inactive   `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-l `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg-alt))))


  ;;;; Base theme face overrides
  ((button :foreground cyan :underline t :weight 'bold)
   (cursor :background orange)
   (hl-line :background (doom-lighten base0 0.05))
   (isearch :foreground yellow :background base1)
   (lazy-highlight :background cyan :foreground base0 :distant-foreground base0 :bold bold)
   (minibuffer-prompt :foreground cyan)
   ((line-number &override) :foreground base1)
   ((line-number-current-line &override) :foreground fg :background base1)
   ((font-lock-comment-face &override)
    :background (if doom-mariana-comment-bg (doom-lighten bg 0.05)))
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if -modeline-bright base2 highlight))
    ;;;; rainbow-delimiters
   (rainbow-delimiters-depth-1-face :foreground green)
   (rainbow-delimiters-depth-2-face :foreground yellow)
   (rainbow-delimiters-depth-3-face :foreground orange)
   (rainbow-delimiters-depth-4-face :foreground red)
   (rainbow-delimiters-depth-5-face :foreground magenta)
   ;;;; show-paren <built-in>
   ((show-paren-match &override) :foreground nil :background base1 :bold t)
   ((show-paren-mismatch &override) :foreground nil :background "red")
   ;;;; company
   (company-preview-common :foreground cyan :background base0)
   (company-tooltip-common :foreground cyan :background base0)
   (company-tooltip-common-selection :foreground yellow :background base1)
   (company-tooltip-annotation :foreground cyan)
   (company-tooltip-annotation-selection :foreground yellow :background base1)
   (company-scrollbar-bg :background base1)
   (company-scrollbar-fg :background cyan)
   (company-tooltip-selection :background bg-alt)
   (company-tooltip-mouse :background bg-alt :foreground nil)
   ;;;; magit
   (magit-diff-context  :background base0 :foreground (doom-darken fg 0.4) :extend t)
   (magit-diff-context-highlight :background base1 :foreground fg :extend t)
   (magit-diff-removed :background (doom-blend red bg 0.05) :foreground red)
   (magit-diff-removed-highlight :background (doom-blend red bg 0.2) :foreground red)
   ;;;; dired
   (dired-directory :foreground cyan)
   ;;;; css-mode <built-in> / scss-mode
   (css-font-lock-keywords :foreground violet)
   (css-property :foreground blue)
   (css-property-ids :foreground magenta)
   (css-proprietary-property :foreground cyan)
   (css-selector :foreground magenta)
   ;;;; doom-modeline
   (doom-modeline-bar :background yellow)
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground green :weight 'bold)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; markdown-mode
   (markdown-markup-face :foreground base3)
   (markdown-header-face :inherit 'bold :foreground blue)
   ((markdown-code-face &override) :background (doom-lighten bg 0.05))
   ;;;; ivy
   (ivy-current-match :background base2 :distant-foreground base0 :weight 'bold)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; ivy
   (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)
   ;;;; vertico
   (vertico-current :background base1 :foreground yellow)
   ;;;; org <built-in>
   ((org-block &override) :background base0)
   ((org-block-begin-line &override) :foreground base5 :background (doom-lighten base0 0.1))
   ((org-block-end-line &override) :foreground base5 :background (doom-lighten base0 0.1))
   (org-done :foreground base2)
   (org-link :foreground cyan :underline t)
   ;;;; rjsx-mode
   (rjsx-tag :foreground red)
   (rjsx-attr :foreground orange)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l))))

  ;;;; Base theme variable overrides
  ())

;;; doom-mariana-theme.el ends here
