---
title: Documentation
navigation:
  label: Documentation
---

# HydePHP Site Builder GitHub Action

<p class="lead">
This GitHub Action builds and optionally deploys your HydePHP project.
</p>

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
