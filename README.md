ansible-rbenv
====================================

[![Build Status](https://travis-ci.org/FGtatsuro/ansible-rbenv.svg?branch=master)](https://travis-ci.org/FGtatsuro/ansible-rbenv)

Ansible role for rbenv.

Requirements
------------

The dependencies on other softwares/libraries for this role.

- Debian
- OSX
  - Homebrew (>= 0.9.5)

Role Variables
--------------

The variables we can use in this role.

|name|description|default|
|---|---|---|
|rbenv_ruby_versions|Installed ruby versions with rbenv.|It isn't defined in default. No ruby is installed.|
|rbenv_global_version|This version is used as global in target host.|It isn't defined in default. Default version isn't set.|
|rbenv_login_shell|Login shell used when this role installs rbenv and ruby.|/bin/bash|

Role Dependencies
-----------------

The dependencies on other roles for this role.

- FGtatsuro.python-requirements
- FGtatsuro.anyenv

Example Playbook
----------------

    - hosts: all
      roles:
         - { role: FGtatsuro.rbenv }

Test on local Docker host
-------------------------

This project run tests on Travis CI, but we can also run them on local Docker host.
Please check `install`, `before_script`, and `script` sections of `.travis.yml`.
We can use same steps of them for local Docker host.

Local requirements are as follows.

- Ansible (>= 2.0.0)
- Docker (>= 1.10.1)

Notes
-----

- `anyenv_profile` variable of `FGtatsuro.anyenv` must exist on path `rbenv_login_shell` can load automatically. For example, the combination of `rbenv_login_shell=/bin/bash` and `anyenv_profile=.bash_profile` will be good.
- Tasks of this role are executed by `anyenv_owner`(variable of `FGtatsuro.anyenv`).
- If rbenv is already installed in different place from `anyenv_home`(variable of `FGtatsuro.anyenv`), this role mayn't work as you expect.

License
-------

MIT
