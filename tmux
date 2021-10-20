# General
set -g mode-keys vi

# Bindings
unbind C-b                                    # Disable default prefix, Enable backtick (`) as prefix
set -g prefix `
bind ` send-prefix

bind e send-keys "$EDITOR ~/.tmux.conf" Enter # Edit configuration file
bind r source-file ~/.tmux.conf               # Reload configuration file
bind : command-prompt                         # Enter prompt mode

# Disable base-index overrider for spin compat
# Windows
#set -g base-index 1

# Panes
#set-window-option -g pane-base-index 1

bind v split-window -h                        # Split vertically
bind | split-window -h
bind s split-window -v                        # Split horizontally
bind _ split-window -v
bind < resize-pane -L 5                       # Resize to left
bind > resize-pane -R 5                       # Resize to right
bind \{ resize-pane -U 5                      # Resize to top
bind \} resize-pane -D 5                      # Resize to bottom

bind h select-pane -L                         # Navigate like vim
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

##########################################
# Theme                                  #
##########################################
set -g main-pane-width 120

# Status
#set -g monitor-activity off
#set -g visual-activity  off

#set -g status-justify      centre
#set -g status-left         "#[bold] ≪ #S ≫ #[nobold]"
#set -g status-left-length  10
#set -g status-position    bottom
#set -g status-right        "#[bold] ≪ #(whoami)@#h ≫ #[nobold]"
#set -g status-right-length 100

#set -g window-status-current-format "#[bg=black,fg=gray] <#I> #W "
#set -g window-status-format " <#I> #W "
#set -g window-status-separator  ""

#set -g status-bg gray
#set -g status-fg black

set -g @plugin 'tmux-plugins/tpm'

#set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @plugin 'tmux-plugins/tmux-copycat'
set -g @plugin 'tmux-plugins/tmux-open'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'
set -g @plugin 'wfxr/tmux-power'

set -g @tmux_power_theme '#96bf48'

#set -g @copycat_hash_search 'C-h'
#set -g @copycat_ip_search 'C-i'

run '~/.tmux/plugins/tpm/tpm'
