[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White

# Symbols
Arrow=$'\xe2\x86\x92'
TopLeft=$'\xE2\x8C\x9C'
TurnedNotSign=$'\xE2\x8C\x99'

# Various variables you might want for your PS1 prompt instead
StartSymbol=$'\342\224\214\342\224\200'
EndSymbol=$'\342\224\224\342\224\200\342\224\200\u27a4'
PathShort="\w"
NewLine="\n"
User="\u@\h "


# This PS1 snippet was adopted from code for MAC/BSD I saw from: http://allancraig.net/index.php?option=com_content&view=article&id=108:ps1-export-command-for-git&catid=45:general&Itemid=96
# I tweaked it to work on UBUNTU 11.04 & 11.10 plus made it mo' better

export PS1=$StartSymbol[$IBlue$User$Color_Off]-[$IYellow$PathShort]$Color_Off'$(\
if [ $? -eq 0 ]; then \
  echo  "'$IGreen' :) "; \
else \
  echo  "'$IRed' :( "; \
fi\
)''$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$IGreen'"$(__git_ps1 " (%s)"); \
  else \
    # @5 - Changes to working tree
    echo "'$IRed'"$(__git_ps1 " {%s}"); \
  fi) '$Color_Off'\n$EndSymbol "; \
else \
  # @2 - Prompt when not in GIT repo
  echo " '$Color_Off'\n$EndSymbol ";
fi)'
