## zsh module

Hi, this is a basic zsh module. You can use this to install all deps for testing purposes:

```bash
bundle install --path .vendor/ --without system_tests development;

```

To list all rake tasks:

```bash
bundle exec rake -T
```

To run spec tests and linter:

```bash
bundle exec rake test
```
