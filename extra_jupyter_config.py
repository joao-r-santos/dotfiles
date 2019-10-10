import getpass, time

# Connection and Security
#c.NotebookApp.open_browser = False

# Enable SSL connections by Default
# Obtain the certificates by running the following inside .ssh/
#% openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mykey.key -out mycert.pem
#c.NotebookApp.certfile = u'/csnzoo/{}/.ssh/mycert.pem'.format(getpass.getuser())
#c.NotebookApp.keyfile = u'/csnzoo/{}/.ssh/mykey.key'.format(getpass.getuser())
#c.NotebookApp.ip = '*' #Open to all IPs
# Point port to 8480 instead of 8080 if 8080 in use. Please confirm if port 8480 is open. Next available port will be assigned if you comment out this line.
# c.NotebookApp.port = 8480
#c.NotebookApp.port_retries = 50
#c.NotebookNotary.db_file = u'/home/{}/.ipython_db_file'.format(getpass.getuser())

# This is the directory where Jupyter Opens. You can move to any directory below.
# I created a single directory that I keep all my repos in and use that as my home.
#c.NotebookApp.notebook_dir = u'/home/{}'.format(getpass.getuser())

# Customizations
## Sets the default name of a New Notebook from `Untitled` to 'USER_EDA'
default_name = [getpass.getuser(), 'EDA', time.strftime("%Y-%m-%d", time.localtime())]
c.ContentsManager.untitled_notebook = '_'.join(default_name)

# If you want to auto-save .html and .py versions of your notebook
# save this code in the file .jupyter/jupyter_notebook_config.py
# Modified from: https://github.com/ipython/ipython/issues/8009

# c = get_config()

import os
from subprocess import check_call

def post_save(model, os_path, contents_manager):
    """post-save hook for converting notebooks to .py scripts"""
    if model['type'] != 'notebook':
        return # only do this for notebooks
    d, fname = os.path.split(os_path)
    check_call(['jupyter', 'nbconvert', '--to', 'script', fname], cwd=d)
    check_call(['jupyter', 'nbconvert', '--to', 'html', fname], cwd=d)

c.FileContentsManager.post_save_hook = post_save

