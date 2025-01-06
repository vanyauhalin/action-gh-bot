# Setup GitHub Actions Bot

This GitHub Action configure Git with [GitHub Actions Bot]'s profile by adding a step to your workflow:

```yml
- name: Setup GitHub Actions Bot
  uses: vanyauhalin/action-gh-bot@v0
```

Under the hood, this action sets up the following Git configuration:

```sh
$ git config set --global user.name "github-actions[bot]"
$ git config set --global user.email "41898282+github-actions[bot]@users.noreply.github.com"
```

That is all.

## License

[MIT] (c) [Ivan Uhalin]

<!-- Footnotes -->

[GitHub Actions Bot]: https://api.github.com/users/github-actions%5Bbot%5D

[Ivan Uhalin]: https://github.com/vanyauhalin/
[MIT]: https://github.com/vanyauhalin/action-gh-bot/blob/main/LICENSE.txt/
