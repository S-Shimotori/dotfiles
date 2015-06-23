export PATH=$PATH:/opt/cross/bin
export PATH="$(brew --prefix homebrew/php/php54)/bin:$PATH"
export JAVA_HOME=`/usr/libexec/java_home`
export PATH="~/bin:$PATH"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
eval `/usr/libexec/path_helper -s`
# pdf preview
alias MacVim='open -a MacVim'
# コマンドライン中コメント
setopt interactive_comments

# prevent delete files
alias rm='rm -i'

# brew
if [ -e /usr/local/share/zsh-completions ]; then
	fpath=(/usr/local/share/zsh-completions $fpath)
fi

# エディタvim
export EDITOR=vim

# 環境変数
export LANG=ja_JP.UTF-8

# 補完
autoload -Uz compinit
compinit
setopt list_types
setopt auto_param_keys
setopt auto_param_slash
setopt mark_dirs
#eval 'dircolors'
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
bindkey "^[[Z" reverse-menu-complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
setopt correct

# ヒストリ
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt extended_glob
setopt hist_no_store
alias history-all='history -n 1'
bindkey "^r" history-incremental-pattern-search-backward
bindkey "^s" history-incremental-pattern-search-forward
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end \
    history-search-end
zle -N history-beginning-search-forward-end \
    history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# 日本語ファイル名
setopt print_eight_bit

# beep無効
setopt no_beep

# ディレクトリ
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt share_history

# confirm before rm *
setopt rmstar_wait

## Prompt ###
autoload -U colors
colors
## 一般ユーザ時
tmp_prompt="%F{cyan}[%n@%~]
%m $ %f"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# rootユーザ時(太字にし、アンダーバーをつける)
if [ ${UID} -eq 0 ]; then
    tmp_prompt="%B%U${tmp_prompt}%u%b"
    tmp_prompt2="%B%U${tmp_prompt2}%u%b"
    tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt    # 通常のプロンプト
PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト
# SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"

# login, logout
watch="all"
log
setopt ignore_eof

# for syntax highlight
source ~/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
