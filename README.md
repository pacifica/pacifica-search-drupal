# Pacifica Search Interface
[![Build Status](https://travis-ci.org/pacifica/pacifica-search.svg?branch=master)](https://travis-ci.org/pacifica/pacifica-search)
[![Code Climate](https://codeclimate.com/github/pacifica/pacifica-search/badges/gpa.svg)](https://codeclimate.com/github/pacifica/pacifica-search)
[![Issue Count](https://codeclimate.com/github/pacifica/pacifica-search/badges/issue_count.svg)](https://codeclimate.com/github/pacifica/pacifica-search)

## Installation
### Docksal (local development)
#### Requirements
* [Docksal](https://docksal.io)

Set local environment variables:

```bash
cp .docksal/example.docksal-local.env .docksal/docksal-local.env
vi .docksal/docksal-local.env
```

Run installation script

```bash
fin init
```

Navigate to [pacifica.docksal](http://pacifica.docksal) in your browser

### Manual Installation
#### Requirements
* [Composer](https://getcomposer.org/download/)
* LAMP or similar web server

Install dependencies

```bash
composer install
```

Navigate to `http://localhost` (or location where Drupal `docroot` is available) and follow the installation instructions.

**Note:** Web server root should be set to the `docroot` folder within this repository.
