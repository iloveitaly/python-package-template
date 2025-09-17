# Python Package Template

Do you like building python packages? Do you hate configuring all of the things? This is for you.

Create a new folder with your package name (this makes it easier to infer the package name from the folder name via copier scripts):

```shell
mkdir your-project
cd your-project
```

Then run the copier script to set up the package:

```shell
uv tool run --with jinja2_shell_extension copier@latest copy --trust --vcs-ref=HEAD https://github.com/iloveitaly/python-package-template .
```

## What is Provided?

Here are the key tools and features provided:

1. **`uv`**. Configured in the `.envrc` file with `layout uv`.
2. **Justfile**. Provides commands for setting up (`just setup`) and cleaning (`just clean`) the project environment.
3. **GitHub Actions.** Repo metadata sync, package build and publish.
4. **Dependabot.**:
5. **VS Code Settings.** Some important py config that is hard to figure out sometimes.
6. **CLI Script Hook.** Remove if you aren't publishing a package with a CLI.

## Prompts

```
This repo:

1. Has a generic/empty template for a python package
2. Has a file extracted from a project which is $EXPLAIN

Can you:

1. $INTEGRATE_CODE
2. Add any `uv add` packages required for this to run
3. Make sure all tests pass. Add some basic tests for this.
4. Update the #file:README.md 
5. Update the `pyproject.toml` keywords and description based on the contents of this repo.
```

## Trusted Publishers

This is setup to be used with PyPi trusted publishers. You can easily change this configuration by adding `--token ${{ secrets.PYPI_API_TOKEN }}` to the build workflows.

## Related

* https://github.com/superlinear-ai/substrate