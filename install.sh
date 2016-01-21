# =============================
# install sh
# =============================


# =============================
# brew
# =============================

if ! which brew > /dev/null 2>&1 ; then
    echo '##############################'
    echo 'Install [brew] command'
    echo '##############################'
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew update
    brew doctor
fi

# =============================
# clone git repogitory
# =============================

install_dir="$HOME/src/github.com/Surume/mac-provisioning"
if [ ! -d $install_dir ]; then
    echo '##############################'
    echo 'start git clone'
    echo '##############################'
    git clone git@github.com:Surume/mac-provisioning.git $install_dir
fi

echo "Change Directory $install_dir"
cd $install_dir

if ! which bundle > /dev/null 2>&1 ; then
    echo '##############################'
    echo 'Install [bundler] command'
    echo '##############################'
    sudo gem install bundler
fi

echo 'bundle exec itamae-env local -y node.yml roles/local.rb'
bundle exec itamae-env local -y node.yml roles/local.rb