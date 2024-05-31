# GitHub Actions Selfcontained

You're using GitHub Enterprise and you're restricted to use only corporate-enabled actions. On top of it those actions are outdates as well.  
But you want your actions, right? No matter what.

## Solution

We'll use public actions repositoreies as git submodules and refer them as local actions.

## Usage

Add actions as modules:

``` shell
git submodule add -- https://github.com/actions/github-script.git .github/local-actions/actions/github-script
git submodule add -- https://github.com/hashicorp/setup-terraform.git .github/local-actions/terraform/setup-terraform
git submodule add -- https://github.com/reviewdog/action-tflint.git .github/local-actions/reviewdog/action-tflint
```

Recommended: use specific tags to maintan stability of your actions

``` shell
git submodule set-branch --branch v7 -- .github/local-actions/actions/github-script
git submodule set-branch --branch v3 -- .github/local-actions/terraform/setup-terraform
git submodule set-branch --branch v1 -- .github/local-actions/reviewdog/action-tflint
```

In your workflow, upon checkout don't forget to clone submodules:

``` yaml
...
    steps:
      - name: Checkout
        uses: actions/checkout@v3
        with:
          submodules: recursive
...
```

Then use these local actions in your steps as follows:

``` yaml
...
uses: ./.github/local-actions/actions/github-script
...
uses: ./.github/local-actions/terraform/setup-terraform
...
uses: ./.github/local-actions/reviewdog/action-tflint
```
