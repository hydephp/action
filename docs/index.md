---
title: Documentation
navigation:
  label: Documentation
---

# HydePHP Site Builder GitHub Action

<p class="lead">
This GitHub Action builds and optionally deploys your HydePHP project.
</p>

## Usage

This action is available on the [GitHub Marketplace](https://github.com/marketplace/actions/build-hydephp-site), and can be used in a few ways depending on your needs.

### Basic Usage

Here is a quick sample workflow to get you started. It will automatically build your HydePHP site on every push to the `master` branch, and upload the compiled site as a workflow artifact.

```yaml
name: Build HydePHP Site

on:
  push:
    branches:
      - master

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: hydephp/action@master
```

For the rest of the examples, we will omit everything but the `jobs` section as the rest stays the same for all examples.

## Inputs

### `debug`

Enables debug mode.

*   **Description**: Enable debug mode.
*   **Required**: `false`
*   **Default**: `"false"`

### `deploy`

Specifies what to do with the compiled site. Options are: `artifact` or `pages`.

*   **Description**: Specify what to do with the compiled site. Options are: `artifact` or `pages`.
*   **Required**: `true`
*   **Default**: `"artifact"`

### `upload-artifact`

Uploads the compiled site as an artifact.

*   **Description**: Upload the compiled site as an artifact.
*   **Required**: `false`
*   **Default**: `"false"`
