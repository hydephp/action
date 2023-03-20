# HydePHP Site Builder GitHub Action

This GitHub Action builds and deploys the HydePHP project. It has the following inputs and outputs:

## Inputs

### `debug`

Enables debug mode.

*   **Description**: Enable debug mode.
*   **Required**: `false`
*   **Default**: `"false"`

### `deploy`

Specifies what to do with the compiled site. Options are: `artifact`.

*   **Description**: Specify what to do with the compiled site. Options are: `artifact`.
*   **Required**: `true`
*   **Default**: `"artifact"`

### `upload-artifact`

Uploads the compiled site as an artifact.

*   **Description**: Upload the compiled site as an artifact.
*   **Required**: `false`
*   **Default**: `"false"`

## Outputs

### `install-strategy`

The install strategy used.

*   **Description**: The install strategy used.
*   **Value**: `${{ steps.determine-install-strategy.outputs.install-strategy }}`

## Steps

1.  `Validate input`: Validates the input.

2.  `Determine install strategy`: Determines the install strategy.

3.  `Print debug information`: Prints debug information.

4.  `Validate composer.json and composer.lock`: Validates composer.json and composer.lock.

5.  `Cache Composer packages`: Caches Composer packages.

6.  `Download latest release`: Downloads the latest release of HydePHP.

7.  `Install dependencies`: Installs dependencies.

8.  `Build the site`: Builds the site.

9.  `Upload artifact`: Uploads the artifact.


After the site is built, there are several options for deployment. The site can be pushed directly to the gh-pages branch, files can be committed to /docs, the GitHub Pages action can be used to deploy the compiled site, or the site can be uploaded as an artifact for later use.
