# ========== binds ==========
bind \b 'backward-kill-word'
bind \cb 'backward-kill-word'
bind \e\[3\;5~ 'kill-word'  

# ========== other ==========
# source ~/.asdf/asdf.fish
set -g fish_greeting
set -g EDITOR /usr/bin/nvim
alias code='code --enable-features=UseOzonePlatform --ozone-platform=wayland'
amixer -c 0 set Front unmute > /dev/null 2>&1
amixer -c 1 set Front unmute > /dev/null 2>&1
amixer -c 2 set Front unmute > /dev/null 2>&1
amixer -c 3 set Front unmute > /dev/null 2>&1



# ========== personal ==========
alias v='nvim'
alias cd-doc='cd ~/Documents'
alias cd-p='cd ~/Documents/personal'
alias cd-scripts='cd ~/Documents/personal/scripts'
alias cd-code='cd ~/Documents/personal/code'
alias cd-clones='cd ~/Documents/clones'
alias cd-fish='cd ~/.config/fish/'
alias learn-init='bash ~/Documents/personal/scripts/learn-init.sh'

# ========== work (general) ==========
alias cd-w='cd ~/Documents/work'
alias cd-w-scripts='cd ~/Documents/work/scripts'
alias code-w-scripts='code ~/Documents/work/scripts'



# ========== ikeeper ==========
alias ik:cd='cd ~/Documents/work/intexsoft/ikeeper/'
alias ik:code='code ~/Documents/work/intexsoft/ikeeper/'

alias ik:cd-f='cd ~/Documents/work/intexsoft/ikeeper/client/'
alias ik:code-f='code ~/Documents/work/intexsoft/ikeeper/client/'

alias ik:cd-b='cd ~/Documents/work/intexsoft/ikeeper/server/'
alias ik:code-b='code ~/Documents/work/intexsoft/ikeeper/server/'

alias ik:msg-init='bash ~/Documents/work/scripts/ik/ik:msg-init.sh'
alias ik:code-init='bash ~/Documents/work/scripts/ik/ik:code-init.sh'



# ========== SaleSpot ==========
alias ss:cd-f='cd ~/Documents/work/intexsoft/ss/ss-client/'
alias ss:code-f='code ~/Documents/work/intexsoft/ss/ss-client/'

alias ss:msg-init='bash ~/Documents/work/scripts/ss/ss:msg-init.sh'
alias ss:code-init='bash ~/Documents/work/scripts/ss/ss:code-init.sh'



# ========== Defect Prescription ==========
alias dp:cd='cd ~/Documents/work/intexsoft/defect-prescription/develop'
alias dp:code='code ~/Documents/work/intexsoft/defect-prescription/develop'

alias dp:msg-init='bash ~/Documents/work/scripts/dp/dp:msg-init.sh'
alias dp:code-init='bash ~/Documents/work/scripts/dp/dp:code-init.sh'



# ========== GBI ==========
alias gbi:master:cd='cd ~/Documents/work/gbi/health-gbm-master'
alias gbi:master:code='code ~/Documents/work/gbi/health-gbm-master'

alias gbi:df:cd='cd ~/Documents/work/gbi/dynamic-forms'

alias gbi:common:cd='cd ~/Documents/work/gbi/health-gbm-master/health-gbm-common'
alias gbi:common:code='code ~/Documents/work/gbi/health-gbm-master/health-gbm-common'

alias gbi:fe:cd='cd ~/Documents/work/gbi/health-gbm-master/health-gbm-colleague-fe'
alias gbi:fe:code='code ~/Documents/work/gbi/health-gbm-master/health-gbm-colleague-fe'

alias gbi:be:cd='cd ~/Documents/work/gbi/health-gbm-master/health-gbm-colleague-be'
alias gbi:be:code='code ~/Documents/work/gbi/health-gbm-master/health-gbm-colleague-be'

alias gbi:api:cd='cd ~/Documents/work/gbi/health-gbm-master/health-gbm-api'
alias gbi:api:code='code ~/Documents/work/gbi/health-gbm-master/health-gbm-api'

alias gbi:doc-api:cd='cd ~/Documents/work/gbi/health-gbm-master/health-gbm-document-api'
alias gbi:doc-api:code='code ~/Documents/work/gbi/health-gbm-master/health-gbm-document-api'

alias gbi:msg-init='bash ~/Documents/work/scripts/gbi/gbi:msg-init.sh'
alias gbi:code-init='bash ~/Documents/work/scripts/gbi/gbi:code-init.sh'

alias gbi:cp-commons-to-fe='bash ~/Documents/work/scripts/gbi/gbi:cp-commons-to-fe.sh'
alias gbi:cp-commons-to-be='bash ~/Documents/work/scripts/gbi/gbi:cp-commons-to-be.sh'

alias gbi:cp-df-fe-components-srcs-to-fe='bash ~/Documents/work/scripts/gbi/gbi:cp-df-fe-components-srcs-to-fe.sh'

alias gbi:cp-ui-widget-components-srcs-to-fe='bash ~/Documents/work/scripts/gbi/gbi:cp-ui-widget-components-srcs-to-fe.sh'

alias gbi:cp-df-api-components-to-be='bash ~/Documents/work/scripts/gbi/gbi:cp-df-api-components-to-be.sh'

alias gbi:cp-df-common-components-to-df-api='bash ~/Documents/work/scripts/gbi/gbi:cp-df-common-components-to-df-api.sh'

alias gbi:cp-df-common-components-to-df-fe='bash ~/Documents/work/scripts/gbi/gbi:cp-df-common-components-to-df-fe.sh'

alias gbi:cp-df-common-components-to-be='bash ~/Documents/work/scripts/gbi/gbi:cp-df-common-components-to-be.sh'
alias gbi:cp-df-common-components-to-fe='bash ~/Documents/work/scripts/gbi/gbi:cp-df-common-components-to-fe.sh'


