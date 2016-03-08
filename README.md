[![Build Status](https://travis-ci.org/FGtatsuro/ansible-ruby.svg?branch=master)](https://travis-ci.org/FGtatsuro/ansible-ruby)

ansible-ruby
====================================

Ansible role for Ruby.

Requirements
------------

The dependencies on other softwares/librarys for this role.

- Debian
- OSX
  - Homebrew (>= 0.9.5)

Role Variables
--------------

The variables we can use in this role.

Role Dependencies
-----------------

The dependencies on other roles for this role.

- FGtatsuro.python-requirements

Example Playbook
----------------

    - hosts: all
      roles:
         - { role: FGtatsuro.ruby }

Test on local Docker host
-------------------------

This project run tests on Travis CI, but we can also run then on local Docker host.
Please check `install`, `before_script`, and `script` sections of `.travis.yml`.
We can use same steps of them for local Docker host.

Local requirements are as follows.

- Ansible (>= 2.0.0)
- Docker (>= 1.10.1)

Notes
-----

1. Installed Ruby version depends on the contents package system of each platform provides.

  - Debian: APT
  - OSX: Homebrew

  But at least, this role ensures that the supported platforms install Ruby(>= 2.0).
  This version constraints is needed to run Serverspec.

2. And this role installs not only ruby interpreter, but also Bundler.

License
-------

MIT
