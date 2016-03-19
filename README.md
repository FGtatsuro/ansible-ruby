[![Build Status](https://travis-ci.org/FGtatsuro/ansible-ruby.svg?branch=master)](https://travis-ci.org/FGtatsuro/ansible-ruby)

ansible-ruby
====================================

Ansible role for Ruby.

Requirements
------------

The dependencies on other softwares/librarys for this role.

- Debian
- Alpine Linux
- OSX
  - Homebrew (>= 0.9.5)

Role Variables
--------------

The variables we can use in this role.

|name|description|default|
|---|---|---|
|ruby_gem_installation_become|If yes, `gem install` is executed with `become=true`.|no|

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
  - Alpine Linux: APK
  - OSX: Homebrew

  But at least, this role ensures that the supported platforms install Ruby(>= 2.0).
  This version constraints is needed to run Serverspec.

2. And this role installs not only ruby interpreter, but also Bundler.
  Bundler installation(with RubyGems) is affected by some environment variables. For example,

  - GEM_HOME
  - GEM_PATH
  - BUNDLE_PATH

  This role doesn't set above variables in the target host, thus the role user must be responsible for handling them properly.

  And you'll need root privilege when user who runs Ansible doesn't have write permission for gem directory. In this case,
  please use `ruby_gem_installation_become` role variable.

3. This role also installs packages for building Ruby extention modules. If you don't need them, please remove them in your playbook.

  - build-essential, ruby-dev (Debian)
  - build-base, ruby-dev (Alpine Linux)

License
-------

MIT
