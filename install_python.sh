#!/bin/bash

sudo apt update
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# INSTALL PYENV
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc

exec "$SHELL"


# INSTALL PYENV-VIRTUALENV
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv virtualenv-init -)"\nfi' >> ~/.bashrc

exec "$SHELL"


# INSTALL PYTHON VERSIONS
pyenv install 3.6.8
pyenv global 3.6.8
pyenv install miniconda3-latest
# add conda to PATH

pip install --upgrade pip
pip install pip-tools

python3 -m pip install --user pipx
python3 -m userpath append ~/.local/bin

# Python linters
pip install flake8 pydocstyle isort bandit black

# pip installs
pip install --user pipenv magic-wormhole jedi
pip install pytest nose

# scientific packages
pip install --user numpy scipy matplotlib pandas scikit-learn seaborn statsmodels
pip install --user ipython jupyter jupyterlab sympy jupyter_contrib_nbextensions

# extra packages
# pip install --user lifelines lifetimes fbprophet lime
