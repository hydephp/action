# Experimental GitHub Actions HydePHP Workflow

[![Continuous Integration](https://github.com/hydephp/action/actions/workflows/continuous-integration.yml/badge.svg)](https://github.com/hydephp/action/actions/workflows/continuous-integration.yml)
[![GitHub Marketplace](https://img.shields.io/badge/Marketplace-Build%20HydePHP%20Site-blue.svg?colorA=24292e&colorB=0366d6&style=flat&longCache=true&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAM6wAADOsB5dZE0gAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAERSURBVCiRhZG/SsMxFEZPfsVJ61jbxaF0cRQRcRJ9hlYn30IHN/+9iquDCOIsblIrOjqKgy5aKoJQj4O3EEtbPwhJbr6Te28CmdSKeqzeqr0YbfVIrTBKakvtOl5dtTkK+v4HfA9PEyBFCY9AGVgCBLaBp1jPAyfAJ/AAdIEG0dNAiyP7+K1qIfMdonZic6+WJoBJvQlvuwDqcXadUuqPA1NKAlexbRTAIMvMOCjTbMwl1LtI/6KWJ5Q6rT6Ht1MA58AX8Apcqqt5r2qhrgAXQC3CZ6i1+KMd9TRu3MvA3aH/fFPnBodb6oe6HM8+lYHrGdRXW8M9bMZtPXUji69lmf5Cmamq7quNLFZXD9Rq7v0Bpc1o/tp0fisAAAAASUVORK5CYII=)](https://github.com/marketplace/actions/build-hydephp-site)
[![GitHub Release](https://img.shields.io/github/v/release/hydephp/action?include_prereleases)](https://github.com/hydephp/action/releases/latest)

[![Test Suite](https://github.com/hydephp/action/actions/workflows/test-suite.yml/badge.svg)](https://github.com/hydephp/action/actions/workflows/test-suite.yml)
[![Integration Test 1](https://github.com/hyde-staging/github-action-test-project-1/actions/workflows/test.yml/badge.svg)](https://github.com/hyde-staging/github-action-test-project-1/actions/workflows/test.yml)
[![Integration Test 2](https://github.com/hyde-staging/github-action-test-project-2/actions/workflows/test.yml/badge.svg)](https://github.com/hyde-staging/github-action-test-project-2/actions/workflows/test.yml)

## About

The HydePHP Site Builder Action is a GitHub Action you can use in your Actions Workflow and that takes care building and deploying of HydePHP projects. It can upload the site as a workflow artifact or deploy directly to GitHub Pages.

The action can be used with full HydePHP projects or anonymous projects containing only Markdown/Blade source files. The strategy used is automatically determined by the action depending on the contents of the repository.
