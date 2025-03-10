# Python Package Template

Do you like building python packages? Do you hate configuring all of the things?

This is for you. Create a new folder with your package name, then run the following script:

```shell
mkdir your-project
uv tool run --with jinja2_shell_extension copier@latest copy https://github.com/iloveitaly/python-package-template . --trust
```

## What is Provided?

Here are the key tools and features provided:

1. **`uv`**. Configured in the `.envrc` file with `layout uv`.
2. **Makefile**. Provides commands for setting up (`make setup`) and cleaning (`make clean`) the project environment.
1. **GitHub Actions.** Repo metadata sync, package build and publish.
3. **Dependabot.**:
4. **VS Code Settings.** Some important py config that is hard to figure out sometimes.
5. **CLI Script Hook.** Remove if you aren't publishing a package with a CLI.