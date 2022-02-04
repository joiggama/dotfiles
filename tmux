# General
set -g mode-keys vi

# Bindings
unbind C-b                                    # Disable default prefix, Enable backtick (`) as prefix
set -g prefix `
bind ` send-prefix

bind e send-keys "$EDITOR ~/.tmux.conf" Enter # Edit configuration file
bind r source-file ~/.tmux.conf               # Reload configuration file
bind : command-prompt                         # Enter prompt mode
bind \\ send-keys -R \; clear-history         # Clear pane and history

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

set -g @plugin 'tmux-plugins/tpm'

set -g @plugin 'tmux-plugins/tmux-sensible'

set -g @plugin 'wfxr/tmux-power'
set -g @tmux_power_theme '#96bf48'


if "test ! -d ~/.tmux/plugins/tpm" \
   "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins'"


run '~/.tmux/plugins/tpm/tpm'
