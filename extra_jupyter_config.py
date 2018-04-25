# If you want to auto-save .html and .py versions of your notebook
# save this code in the file .jupyter/jupyter_notebook_config.py
# Modified from: https://github.com/ipython/ipython/issues/8009

c = get_config()

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

