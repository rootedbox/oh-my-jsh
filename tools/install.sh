set -e

CHECK_ZSH_INSTALLED=$(grep /zsh$ /etc/shells | wc -l)
if [ ! $CHECK_ZSH_INSTALLED -ge 1 ]; then
  echo "\033[0;33m Zsh is not installed!\033[0m Please install zsh first!"
  exit
fi
unset CHECK_ZSH_INSTALLED

if [ ! -n "$ZSH" ]; then
  ZSH=~/.oh-my-zsh
fi

if [ -d "$ZSH" ]; then
  echo "\033[0;33mYou already have Oh My Zsh installed.\033[0m You'll need to remove $ZSH if you want to install"
  exit
fi

echo "\033[0;34mCloning Oh My Zsh...\033[0m"
hash git >/dev/null && /usr/bin/env git clone https://github.com/rootedbox/oh-my-jsh.git ~/.oh-my-zsh || {
  echo "git not installed"
  exit
}

echo "\033[0;34mLooking for an existing zsh config...\033[0m"
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
  echo "\033[0;33mFound ~/.zshrc.\033[0m \033[0;32mBacking up to ~/.zshrc.pre-oh-my-zsh\033[0m";
  mv ~/.zshrc ~/.zshrc.pre-oh-my-zsh;
fi

echo "\033[0;34mUsing the Oh My Zsh template file and adding it to ~/.zshrc\033[0m"
cp $ZSH/templates/zshrc.zsh-template ~/.zshrc
sed "/^export ZSH=/ c\\
export ZSH=$ZSH
" ~/.zshrc > ~/.zshrc-omztemp
mv -f ~/.zshrc-omztemp ~/.zshrc

echo "\033[0;34mCopying your current PATH and adding it to the end of ~/.zshrc for you.\033[0m"
sed "/export PATH=/ c\\
export PATH=\"$PATH\"
" ~/.zshrc > ~/.zshrc-omztemp
mv -f ~/.zshrc-omztemp ~/.zshrc

TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
    echo "\033[0;34mTime to change your default shell to zsh!\033[0m"
    chsh -s $(grep /zsh$ /etc/shells | tail -1)
fi
unset TEST_CURRENT_SHELL

echo "       (        )       (     (     "
echo "       )\ )  ( /(       )\ )  )\ )  "
echo "   (  (()/(  )\()) (   (()/( (()/(  "
echo "   )\  /(_))((_)\  )\   /(_)) /(_)) "
echo "  ((_)(_))   _((_)((_) (_))  (_))   "
echo " _ | |/ __| | || || __|| |   | |    "
echo "| || |\__ \ | __ || _| | |__ | |__  "
echo " \__/ |___/ |_||_||___||____||____| "



echo "\n\n \033[0;32m....is now installed.\033[0m"
/usr/bin/env zsh
source ~/.zshrc
