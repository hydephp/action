# HydePHP GitHub Actions Workflow

[![Continuous Integration](https://github.com/hydephp/action/actions/workflows/continuous-integration.yml/badge.svg)](https://github.com/hydephp/action/actions/workflows/continuous-integration.yml)
[![GitHub Marketplace](https://img.shields.io/badge/Marketplace-Build%20HydePHP%20Site-blue.svg?colorA=24292e&colorB=0366d6&style=flat&longCache=true&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAM6wAADOsB5dZE0gAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAERSURBVCiRhZG/SsMxFEZPfsVJ61jbxaF0cRQRcRJ9hlYn30IHN/+9iquDCOIsblIrOjqKgy5aKoJQj4O3EEtbPwhJbr6Te28CmdSKeqzeqr0YbfVIrTBKakvtOl5dtTkK+v4HfA9PEyBFCY9AGVgCBLaBp1jPAyfAJ/AAdIEG0dNAiyP7+K1qIfMdonZic6+WJoBJvQlvuwDqcXadUuqPA1NKAlexbRTAIMvMOCjTbMwl1LtI/6KWJ5Q6rT6Ht1MA58AX8Apcqqt5r2qhrgAXQC3CZ6i1+KMd9TRu3MvA3aH/fFPnBodb6oe6HM8+lYHrGdRXW8M9bMZtPXUji69lmf5Cmamq7quNLFZXD9Rq7v0Bpc1o/tp0fisAAAAASUVORK5CYII=)](https://github.com/marketplace/actions/build-hydephp-site)
[![GitHub Release](https://img.shields.io/github/v/release/hydephp/action?include_prereleases)](https://github.com/hydephp/action/releases/latest)

[![Test Suite](https://github.com/hydephp/action/actions/workflows/test-suite.yml/badge.svg)](https://github.com/hydephp/action/actions/workflows/test-suite.yml)
[![Integration Test 1](https://github.com/hyde-staging/github-action-test-project-1/actions/workflows/test.yml/badge.svg)](https://github.com/hyde-staging/github-action-test-project-1/actions/workflows/test.yml)
[![Integration Test 2](https://github.com/hyde-staging/github-action-test-project-2/actions/workflows/test.yml/badge.svg)](https://github.com/hyde-staging/github-action-test-project-2/actions/workflows/test.yml)

## About

The HydePHP Site Builder Action is a GitHub Action you can use in your Actions Workflow and that takes care building and deploying of HydePHP projects. It can upload the site as a workflow artifact or deploy directly to GitHub Pages.

The action can be used with full HydePHP projects or "anonymous" projects containing only Markdown/Blade source files. The strategy used is automatically determined by the action depending on the contents of the repository.

## Usage

### Starter Workflow

The following example shows the most basic usage of the action. It will build the site and upload the result as a workflow artifact.

```yaml
name: Build HydePHP Site

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: hydephp/action@master
```

The artifact will be uploaded as `build` and can be downloaded from the workflow run, or in a subsequent workflow step for custom deployment.

### With Deployment

The following example shows how to deploy the site to GitHub Pages. The action will build the site and deploy directly to GitHub Pages.

```yaml
name: Build and Deploy HydePHP Site

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      pages: write
      id-token: write
    steps:
      - uses: actions/checkout@v3
      - uses: hydephp/action@master
        with:
          deploy-to: "pages"
```

Note that the GitHub token must have the proper permissions. You also need to configure your repository to use GitHub Pages using the Actions workflow.

You can enable Pages by visiting the Pages section of your repository settings, and setting the build and deployment source to GitHub Actions.

### Configuration Options

There are a few more configuration options available, that can be supplied to the action using the `with` keyword, as shown in the examples above.

| Input Name             | Description                                                                                                                                                     | Default Value |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------|
| `deploy-to`            | Specify what to do with the compiled site.<br><small>Supported options are: ["artifact", "pages"]</small>                                                       | "artifact"    |
| `upload-artifact`      | Upload the site artifact, regardless of the `deploy-to` option                                                                                                  | `false`       |
| `debug`                | Enable additional debug output                                                                                                                                  | `false`       |
| `framework-version`    | Specify the HydePHP Framework version to use<br><small>(only applicable for [anonymous projects](https://hydephp.github.io/action/#anonymous-projects))</small> | "latest"      |
| `directory`            | The directory to use as the project root                                                                                                                        | none          |
| `config`               | String of lines to add to the `hyde.yml` config file                                                                                                            | none          |
| `env-site-name`        | Set the `SITE_NAME` environment variable                                                                                                                        | _none_        |
| `env-site-url`         | Set the `SITE_URL` environment variable                                                                                                                         | _none_        |
| `env-torchlight-token` | Set the `TORCHLIGHT_TOKEN` environment variable                                                                                                                 | _none_        |

## Further documentation

See the live documentation, built with this action and through this repository, at [hydephp.github.io/action](https://hydephp.github.io/action/).
