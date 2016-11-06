export PATH=$PATH:/opt/cross/bin
export PATH="$(brew --prefix homebrew/php/php54)/bin:$PATH"
export JAVA_HOME=`/usr/libexec/java_home`
export PATH="~/bin:$PATH"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export CATALINA_HOME='/usr/local/Cellar/tomcat/8.0.23/libexec'
export PATH="/usr/local/var/rbenv/shims:$PATH"
export RBENV_ROOT=/usr/local/var/rbenv
export GOROOT=/usr/local/opt/go/libexec/bin
export GOPATH=$HOME
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/llvm/bin
export PATH=$PATH:$HOME/TreeTagger/cmd
export PATH=$PATH:$HOME/TreeTagger/bin
export TREETAGGER_BINARY='$HOME/TreeTagger/bin/tree-tagger'
export TREETAGGER_MODEL='$HOME/TreeTagger/lib/english-utf8.par'
export PATH=$PATH:$HOME/perl5/bin
export PERL5LIB=$PERL5LIB:$HOME/perl5/lib/perl5
export PERL_LOCAL_LIB_ROOT=$PERL_LOCAL_LIB_ROOT:$HOME/perl5
export PERL_MB_OPT="--install_base \"$HOME/perl5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"
export COCOS_CONSOLE_ROOT=$HOME/cocos2d-x-3.9/tools/cocos2d-console/bin
export PATH=$PATH:$COCOS_CONSOLE_ROOT
export COCOS_TEMPLATES_ROOT=$HOME/cocos2d-x-3.9/templates
export PATH=$PATH:$COCOS_TEMPLATES_ROOT
# duplicate ANDROID_HOME
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT
export PATH=$PATH:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools
export ANT_ROOT=/usr/local/Cellar/ant/1.9.6/bin
export PATH=$PATH:$ANT_ROOT
export LC_ALL="ja_JP.UTF-8"
GEM_EXE_DIR=`gem env | grep "EXECUTABLE DIRECTORY" | awk '{print $4}'`
export PATH=$GEM_EXE_DIR:$PATH
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export PATH=$PATH:GROOVY_HOME
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=/Applications/CMake.app/Contents/bin:$PATH

eval `/usr/libexec/path_helper -s`
eval "$(rbenv init - zsh)";
if which plenv > /dev/null; then
    export PLENV_ROOT=$HOME/.plenv
    export PATH=$PATH:${PLENV_ROOT}/shims
    eval "$(plenv init - zsh)";
fi
if which swiftenv > /dev/null; then
    eval "$(swiftenv init -)";
fi
eval "$(thefuck --alias)"

# pdf preview
alias MacVim='open -a MacVim'
# コマンドライン中コメント
setopt interactive_comments

# prevent delete files
alias rm='rm -i'

alias ks='echo カス👆'

# prolog
alias swipl='/Applications/SWI-Prolog.app/Contents/MacOS/swipl'

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

