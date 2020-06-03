<p align="center">
  <a href="http://www.openymca.org">
    <img alt="react-router" src="https://www.ymcamn.org/themes/custom/ymca/img/ymca-logo.svg" width="144">
  </a>
</p>

<h3 align="center">
  Open YMCA
</h3>
<p align="center">
  http://openymca.org
</p>
<p align="center">
  An open source platform for YMCAs, by YMCAs built on <a href="http://drupal.org">Drupal</a>.
</p>

<p align="center">
  <a href="https://packagist.org/packages/ymcatwincities/openy-project"><img src="https://img.shields.io/packagist/v/ymcatwincities/openy-project.svg?style=flat-square"></a>
  <a href="https://packagist.org/packages/ymcatwincities/openy-project"><img src="https://img.shields.io/packagist/dm/ymcatwincities/openy-project.svg?style=flat-square"></a>
  <a href="https://circleci.com/gh/ymcatwincities/openy-project"><img src="https://img.shields.io/circleci/project/github/ymcatwincities/openy-project/8.1.x.svg?style=flat-square"></a>
</p>

***

The [Open Y Project](http://www.openymca.org/) is a composer based installer for the [Open Y distribution](https://github.com/ymcatwincities/openy).


## Requirements

#### Composer    
If you do not have [Composer](http://getcomposer.org/), you may install it by following the [official instructions](https://getcomposer.org/download/). For usage, see [the documentation](https://getcomposer.org/doc/).

## Installation

#### Latest STABLE version
```
composer create-project ymcatwincities/openy-project MY_PROJECT --no-interaction --no-dev
cd MY_PROJECT && composer update
```

This command will build project based on [**latest stable**](https://github.com/ymcatwincities/openy/releases) release.

#### Latest 2.0 BETA version
```
composer create-project ymcatwincities/openy-project:8.2.x-dev MY_PROJECT --no-interaction --no-dev
cd MY_PROJECT && composer update
```

This command will build project based on [**latest 8.2 beta**](https://github.com/ymcatwincities/openy/releases) release.

#### Latest DEVELOPMENT version (1.x)
```
composer create-project ymcatwincities/openy-project:8.1.x-development-dev MY_PROJECT --no-interaction --no-dev
cd MY_PROJECT && composer update
```

This command will build project based on [**latest development**](https://github.com/ymcatwincities/openy/commits/8.x-1.x) release.

#### Latest DEVELOPMENT version (2.x)
```
composer create-project ymcatwincities/openy-project:8.2.x-development-dev MY_PROJECT --no-interaction --no-dev
cd MY_PROJECT && composer update
```

This command will build project based on the [**development branch**](https://github.com/ymcatwincities/openy/commits/8.x-2.x) release.

See https://youtu.be/jRlinjpTl0c how to video for the whole process of this command usage.


## Development environment

You should use composer command without `--no-dev` if you would like to get environment that was configured especially for OpenY. This means you'd remove Vagrant/Docksal from the code tree.
So it should look like this:
```
composer create-project ymcatwincities/openy-project:8.1.x-development-dev MY_PROJECT --no-interaction
cd MY_PROJECT && composer update
```

See https://youtu.be/jRlinjpTl0c how to video for the whole process of this command usage.
=======


or (for Open Y 2.0)

```
composer create-project ymcatwincities/openy-project:8.2.x-development-dev MY_PROJECT --no-interaction
cd MY_PROJECT && composer update

```

If you need to keep all git submodules - use
```sh
composer create-project ymcatwincities/openy-project:8.x-2.x-git-dev MY_PROJECT --no-interaction
cd MY_PROJECT && composer update

```
See https://youtu.be/jRlinjpTl0c how to video for the whole process of this command usage.

### CIBox VM
[CIBox VM](http://cibox.tools) allows you to make a contribution into OpenY in a few minutes. Just follow steps and then you'll know how to do it.

- [Pre Requirements](https://github.com/ymcatwincities/openy-cibox-vm#pre-requirements)
- [Installation](https://github.com/ymcatwincities/openy-cibox-vm#usage)
- [Local build](https://github.com/ymcatwincities/openy-cibox-vm#reinstall-options)
  
Read more details on [CIBox VM](https://github.com/ymcatwincities/openy-cibox-vm) repo.

### Docksal
[Docksal](http://docksal.io) is a tool for defining and managing development environments.

- [How to develop](https://github.com/ymcatwincities/openy-docksal#how-to-develop)
- [How to run behat tests](https://github.com/ymcatwincities/openy-docksal#how-to-run-behat-tests)
  
Read more details on [Docksal](https://github.com/ymcatwincities/openy-docksal) repo.

# Use Fork for the development

All development happens in the [Open Y Drupal 8 installation profile](https://github.com/ymcatwincities/openy). In order to start development:

1. Create fork of [Open Y installation profile](https://github.com/ymcatwincities/openy)
2. Add your repository to `composer.json`
```
"repositories": [
    {
        "type": "vcs",
        "url": "https://github.com/GITHUB_USERNAME/openy"
    }
]
```

3. Change a version for `ymcatwincities/openy` to `dev-8.x-1.x` or any other branch. E.g.:
- branch name "bugfix" - version name `dev-bugfix`
- branch name "feature/workflow" - version name `dev-feature/workflow`

```
"require": {
    "ymcatwincities/openy": "dev-8.x-1.x",
}
```
```
"require": {
    "ymcatwincities/openy": "dev-feature/workflow",
}
```

4. Run `composer update` to update packages
5. Add and commits changes in `docroot/profiles/contrib/openy`. Now it should be pointed to your fork.

# Directory structure
| Directory | Purpose |
|-----------|---------|
| [**OpenY**](https://github.com/ymcatwincities/openy) ||
| `docroot/` | Contains Drupal core |
| `docroot/profiles/contrib/openy/` | Contains Open Y distribution |
| `vendor/` | Contains Open Y distribution |
| `composer.json` | Contains Open Y distribution |
| [**CIBox VM**](https://github.com/ymcatwincities/openy-cibox-vm) + [**CIBox Build**](https://github.com/ymcatwincities/openy-cibox-build)  ||
| `cibox/` | Contains CIBox libraries |
| `docroot/devops/` | DevOps scripts for the installation process |
| `provisioning/` | Vagrant configuration |
| `docroot/*.sh` | Bash scripts to trigger reinstall scripts
| `docroot/*.yml` | YAML playbooks for the installation process |
| `Vagrantfile` | Vagrant index file |
| [**Docksal**](https://github.com/ymcatwincities/openy-docksal) ||
| `.docksal/` | Docksal configuration |
| `build.sh` | Build script for Docksal environment |

# Documentation
Documentation about Open Y is available at [docs](https://github.com/ymcatwincities/openy/tree/8.x-1.x/docs). For details please visit [http://www.openymca.org](http://www.openymca.org).

For Development information please take a look at [docs/Development](https://github.com/ymcatwincities/openy/tree/8.x-1.x/docs/Development).

# License
OpenY Project is licensed under the [GPL-3.0](https://www.gnu.org/licenses/gpl-3.0-standalone.en.html). See the [License file](https://github.com/ymcatwincities/openy-project/blob/8.1.x/LICENSE) for details.
