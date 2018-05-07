#!/usr/bin/env python
# coding=utf-8

import zipfile
import shutil
import tempfile
import requests

from os import path, system
from sys import argv


# --- Globals ----------------------------------------------
GITHUB_ZIP = '%s/archive/%s.zip'
GITHUB_GIT = '%s.git'

GIT_CLONE_CMD = 'git clone -b %s --recursive %s %s'
GIT_CHECKOUT_CMD = 'git -C %s checkout %s'
GIT_PULL_CMD = 'git -C %s pull --recurse-submodules'

SOURCE_DIR = path.join(path.dirname(__file__), 'sources_non_forked')

CONFIG_FILE = path.join(path.dirname(__file__), 'plugins.config')


def git_system(cmd, plugin_bar, last_cmd=True):
    if system(cmd) != 0:
        print '\033[31mfailed %s\033[0m' % plugin_bar
        print '\033[31mskipped %s\033[0m' % plugin_bar
        return -1
    elif last_cmd:
        print '\033[34mupdated %s\033[0m' % plugin_bar
    return 0


def download_git_clone(plugin_name, github_url, branch_name, source_dir):
    git_path = GITHUB_GIT % github_url
    plugin_dest_path = path.join(source_dir, plugin_name)
    plugin_bar = "%s-%s" % (plugin_name, branch_name)

    if path.exists(path.join(plugin_dest_path, '.git')):
        # Git checkout on target branch
        cmd = GIT_CHECKOUT_CMD % (plugin_dest_path, branch_name)
        if git_system(cmd, plugin_bar, False) < 0:
            return
        # Git pull to update plugins
        cmd = GIT_PULL_CMD % plugin_dest_path
        git_system(cmd, plugin_bar)
    else:
        # Try to remove plugin_dest_path
        try:
            shutil.rmtree(plugin_dest_path)
        except OSError:
            pass
        # Git clone on some plugins with subgit
        cmd = GIT_CLONE_CMD % (branch_name, git_path, plugin_dest_path)
        git_system(cmd, plugin_bar)


def download_extract_replace(
        plugin_name, github_url, branch_name, temp_dir, source_dir):
    zip_path = GITHUB_ZIP % (github_url, branch_name)
    temp_zip_path = path.join(temp_dir, plugin_name)

    # Download and extract file in temp dir
    req = requests.get(zip_path)
    open(temp_zip_path, 'wb').write(req.content)

    zip_f = zipfile.ZipFile(temp_zip_path)
    zip_f.extractall(temp_dir)

    plugin_temp_path = path.join(
        temp_dir,
        path.join(
            temp_dir,
            '%s-%s' %
            (plugin_name, branch_name)))

    # Remove the current plugin and replace it with the extracted
    plugin_dest_path = path.join(source_dir, plugin_name)

    try:
        shutil.rmtree(plugin_dest_path)
    except OSError:
        pass

    shutil.move(plugin_temp_path, plugin_dest_path)

    print '\033[31mupdated %s-%s\033[0m' % (plugin_name, branch_name)


if __name__ == '__main__':
    temp_directory = tempfile.mkdtemp()
    if len(argv) == 2 and len(argv[1].strip()) > 0:
        target_plugin = argv[1].strip()
    else:
        target_plugin = None

    try:
        for line in file(CONFIG_FILE):
            line = line.strip()
            if line == '' or line.startswith('#'):
                continue
            download_type, name, github_url, branch_name = line.split()
            if (target_plugin is not None) and (target_plugin != name):
                continue
            print "\033[36mupdating %s ...\033[0m" % name
            if download_type == 'ZIP':
                download_extract_replace(name, github_url, branch_name,
                                         temp_directory, SOURCE_DIR)
            elif download_type == 'GIT':
                download_git_clone(name, github_url, branch_name, SOURCE_DIR)
            else:
                raise KeyError(download_type)
    finally:
        shutil.rmtree(temp_directory)

    exit(0)
