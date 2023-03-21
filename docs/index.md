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
deployment options supported by the action:

### Artifact upload

By default, the action will "deploy" your site by uploading it as a workflow artifact. This is useful
if you want to customize the actual deployment process in a separate job, or if you just want to download
the compiled files manually.

```yaml
- uses: hydephp/action@master
  with:
    deploy: artifact # This is already the default, but it's here for clarity.
```

You can also enable artifact uploading in addition to another deployment method with the `upload-artifact` input:

```yaml
- uses: hydephp/action@master
  with:
    deploy: pages
    upload-artifact: true
```

### GitHub Pages (Direct deployment)

>warn This method depends on [`actions/deploy-pages`](https://github.com/actions/deploy-pages), which is currently in public beta.

You can also deploy the compiled site directly to GitHub Pages, by setting the `deploy` input to "pages".

```yaml
- uses: hydephp/action@master
  with:
    deploy: "pages"
```

You also need to make sure that your GitHub Pages source is set to "GitHub Actions" and that the `GITHUB_TOKEN` has the `id-token: write` and `pages: write` permissions.

You can set the permissions using the following code, added to the `jobs.<job_id>.permissions` section of your workflow file:

```yaml
build:
  runs-on: ubuntu-latest
  permissions:
    contents: read
    pages: write
    id-token: write
```

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

Uploads the compiled site as an artifact. (In addition to the deployment method specified by `deploy`. Makes no change if `deploy` is already set to `artifact`.)

*   **Description**: Upload the compiled site as an artifact.
*   **Required**: `false`
*   **Default**: `"false"`
