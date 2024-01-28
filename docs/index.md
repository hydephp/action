---
title: Documentation
navigation:
  label: Documentation
---

# HydePHP Site Builder GitHub Action

<p class="not-prose">
<a href="https://github.com/hydephp/action/actions/workflows/continuous-integration.yml"><img src="https://github.com/hydephp/action/actions/workflows/continuous-integration.yml/badge.svg" alt="Continuous Integration" style="display: inline;"></a>
<a href="https://github.com/marketplace/actions/build-hydephp-site"><img src="https://img.shields.io/badge/Marketplace-Build%20HydePHP%20Site-blue.svg?colorA=24292e&amp;colorB=0366d6&amp;style=flat&amp;longCache=true&amp;logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAM6wAADOsB5dZE0gAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAERSURBVCiRhZG/SsMxFEZPfsVJ61jbxaF0cRQRcRJ9hlYn30IHN/+9iquDCOIsblIrOjqKgy5aKoJQj4O3EEtbPwhJbr6Te28CmdSKeqzeqr0YbfVIrTBKakvtOl5dtTkK+v4HfA9PEyBFCY9AGVgCBLaBp1jPAyfAJ/AAdIEG0dNAiyP7+K1qIfMdonZic6+WJoBJvQlvuwDqcXadUuqPA1NKAlexbRTAIMvMOCjTbMwl1LtI/6KWJ5Q6rT6Ht1MA58AX8Apcqqt5r2qhrgAXQC3CZ6i1+KMd9TRu3MvA3aH/fFPnBodb6oe6HM8+lYHrGdRXW8M9bMZtPXUji69lmf5Cmamq7quNLFZXD9Rq7v0Bpc1o/tp0fisAAAAASUVORK5CYII=" alt="GitHub Marketplace" style="display: inline;"></a>
<a href="https://github.com/hydephp/action/releases/latest"><img src="https://img.shields.io/github/v/release/hydephp/action?include_prereleases" alt="GitHub Release" style="display: inline;"></a>
</p>

<p class="lead">
This GitHub Action builds and optionally deploys your HydePHP project.
</p>

## Usage

This action is available on the [GitHub Marketplace](https://github.com/marketplace/actions/build-hydephp-site),
and can be used in a few ways depending on your needs.

### Basic Usage

Here is a quick sample workflow to get you started. It will automatically build your HydePHP site
when you push to your repository, and then upload the compiled site as a workflow artifact.

```yaml
on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: hydephp/action@master
```

### Deployment options

This action not only builds your site, but it can also deploy it for you. Here are the various
deployment options supported by the action.

### Artifact upload

By default, the action will "deploy" your site by uploading it as a workflow artifact. This is useful
if you want to customize the actual deployment process in a separate job, or if you just want to download
the compiled files manually.

```yaml
- uses: hydephp/action@master
  with:
    deploy-to: artifact # This is already the default, but it's here for clarity.
```

You can also enable artifact uploading in addition to another deployment method with the `upload-artifact` input:

```yaml
- uses: hydephp/action@master
  with:
    deploy-to: pages
    upload-artifact: true
```

### GitHub Pages (Direct deployment)


You can also deploy the compiled site directly to GitHub Pages, by setting the `deploy-to` input to "pages". This uses the official [`actions/deploy-pages`](https://github.com/actions/deploy-pages) action.

```yaml
- uses: hydephp/action@master
  with:
    deploy-to: "pages"
```

Please make sure that the `GITHUB_TOKEN` has the `id-token: write` and `pages: write` permissions.

You can set the permissions using the following code, added to the `jobs.<job_id>.permissions` section of your workflow file:

```yaml
build:
  runs-on: ubuntu-latest
  permissions:
    contents: read
    pages: write
    id-token: write
```

You also need to make sure that your GitHub Pages source is set to "GitHub Actions". Simply follow the steps in the image below.

![1: Visit the settings tab of your repository. 2: Click on the "Pages" tab in the sidebar. 3: Under "Build and deployment", select "GitHub Actions" from the "Source" dropdown.](https://github.com/hydephp/action/assets/95144705/73c8b5ac-b26b-4763-b29b-ad118c1ea6a7)

## Supported repository structures

The action works for both full HydePHP projects and "anonymous" projects containing only Markdown/Blade source files.
The strategy used is automatically determined by the action, depending on the contents of the repository.

Both strategies require that the source files are located in the root directory of the repository.
They both also support reading configuration from the `hyde.yml` file in the root directory.

### Full HydePHP Projects

The full HydePHP project strategy works by installing the project's composer dependencies.

This is the recommended setup for most projects, as allows you to use project directories, like additional Composer dependencies,
the full configuration suite, custom code in the app directory, as well as custom views in the `resources` directory, and more.

This strategy is enabled when the project contains a `composer.json` file in the root directory.

Here is an example of a repository tree that would be built using this strategy:

```tree
├── _media
|── _pages
|── _posts
|── app
|── config
|── resources
|── composer.json
|── package.json
|── tailwind.config.js
└── webpack.mix.js
```

You can also see this test repository where the tree was taken from: [`hyde-staging/github-action-test-project-1`](https://github.com/hyde-staging/github-action-test-project-1)

### Anonymous Projects

The anonymous project strategy works by creating a new HydePHP project and then copying the source files into it.
This is done when the project does not contain a `composer.json` file in the root directory. The installed project will use the latest stable version of HydePHP.

This strategy is great for simple projects that just contain basic pages and that don't require any additional dependencies.
This documentation site, for example, is built using this strategy, and only contains a single `docs/index.md` file and a `hyde.yml` config file.
The Torchlight syntax highlighting is enabled automatically by supplying the `env-torchlight-token` secret input.

Here is an example of a repository tree that would be built using this strategy:

```tree
├── _media
│   └── app.css
├── _pages
│   ├── 404.blade.php
│   └── index.blade.php
└── _posts
    └── hello-world.md
```

You can also see this test repository where the tree was taken from: [`hyde-staging/github-action-test-project-2`](https://github.com/hyde-staging/github-action-test-project-2)

## Inputs

### `debug`

Enables debug mode.

*   **Description**: Enable debug mode.
*   **Required**: `false`
*   **Default**: `"false"`

### `deploy-to`

Specifies what to do with the compiled site. Options are: `artifact` or `pages`.

*   **Description**: Specify what to do with the compiled site. Options are: `artifact` or `pages`.
*   **Required**: `true`
*   **Default**: `"artifact"`

### `upload-artifact`

Uploads the compiled site as an artifact. (In addition to the deployment method specified by `deploy-to`. Makes no change if `deploy-to` is already set to `artifact`.)

*   **Description**: Upload the compiled site as an artifact.
*   **Required**: `false`
*   **Default**: `"false"`

### `framework-version`

Specifies the version of the HydePHP framework to use. If not specified, the latest stable version will be used.

This is only used when the anonymous project strategy is used, (i.e. when the project does not contain a `composer.json` file in the root directory).

*   **Description**: Specify the version of HydePHP to use. If not specified, the latest stable version will be used.
*   **Required**: `false`
*   **Default**: `"latest"`

### `directory`

Specifies the directory containing the source files to build. This is useful if your source files are not located in the root directory of the repository.

*   **Description**: Specify the directory containing the source files to build.
*   **Required**: `false`
*   **Default**: `"."`

### `config`

You can also specify configuration options using the `config` input. The lines in this input will be appended to the `hyde.yml` file in the root directory, allowing you to configure many parts of the Hyde project before the build.

*   **Description**: List of lines to add to the `hyde.yml` config file
*   **Required**: `false`
*   **Default**: `""`

Example:

```yaml
- uses: hydephp/action@config-array
  with:
    config: |
      # Enter key-value Yaml here:
      name: Example
      url: ${{ github.deployment.url }}
```

See the [HydePHP documentation](https://hydephp.com/docs/1.x/customization#yaml-configuration) for more information on the available configuration options and how to use the `hyde.yml` file.

### Environment variables

>warning If your inputs contain sensitive information, you should use [GitHub Secrets](https://docs.github.com/en/actions/reference/encrypted-secrets) to store them.

You can also pass set the following inputs to be passed as environment variables for the build process:

#### `env-site-name`
Sets the `SITE_NAME` environment variable

#### `env-site-url`
Sets the `SITE_URL` environment variable

#### `env-torchlight-token`
Sets the `TORCHLIGHT_TOKEN` environment variable
