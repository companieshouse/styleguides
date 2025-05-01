# JavaScript (Node) Coding Standards

This document outlines key practices for writing clean and efficient JavaScript code for Node applications.

It is based on the [Standard JS guide](https://standardjs.com/).

## Why Use JavaScript Standard Style?
JavaScript Standard Style is designed to streamline development by enforcing a unified style guide with minimal setup. It helps developers write consistent, clean code while avoiding unnecessary debates over formatting preferences.

### Key Benefits:
- **No configuration required**: No need to manage `.eslintrc` files or make style-related decisions.
- **Automatic formatting**: Run `standard --fix` to instantly clean up and align code.
- **Catch issues early**: Reduce unnecessary back-and-forth during code reviews by enforcing a standard style.
- **Improved readability**: A consistent codebase makes it easier to onboard new developers.
- **Broad adoption**: Used by many major companies and open-source projects.

## Installation
JavaScript Standard Style can be installed globally or locally within a project.

### Global Installation
Install globally for use across multiple projects:
```sh
npm install standard --global
```

### Local Installation (Per Project)
To use StandardJS within a specific project:
```sh
npm install standard --save-dev
```

## Usage
Once installed, StandardJS can be used to check and format code.

### Checking Code Style
Run the following command in the terminal to check for style violations:
```sh
standard
```
For local installations, use:
```sh
npx standard
```

### Checking Specific Files
To lint specific files or directories, use:
```sh
standard "src/**/*.js" "test/**/*.js"
```

### Fixing Code Automatically
To automatically resolve style issues:
```sh
standard --fix
```
This will format the code to conform to StandardJS rules where possible.

## Best Practices

### Adding to `package.json`
Integrate StandardJS into your project by adding it to the `scripts` section of `package.json`:
```json
{
  "scripts": {
    "test": "standard && node my-tests.js"
  }
}
```
Run tests using:
```sh
npm test
```

### Enforcing StandardJS in CI/CD
For automated checks in CI/CD pipelines, add `standard` as a test step.
Example for GitHub Actions:
```yaml
jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - run: npm install
      - run: npm test
```

## Ignoring Files
To exclude specific files or directories from linting, add a `standard.ignore` entry in `package.json`:
```json
{
  "standard": {
    "ignore": ["**/out/", "lib/select2/"]
  }
}
```
Alternatively, use `.gitignore` for broader exclusion.

## Overriding Rules
If a rule needs to be disabled for a specific line, use ESLint inline comments:
```js
// eslint-disable-next-line no-use-before-define
console.log(myVar);
```
For multiple lines:
```js
/* eslint-disable no-use-before-define */
console.log(myVar);
console.log(anotherVar);
/* eslint-enable no-use-before-define */
```

## Supported Editors
StandardJS integrates with popular code editors:
- **VS Code**: Install `vscode-standard`.
- **Sublime Text**: Use `SublimeLinter` and `SublimeLinter-contrib-standard`.
- **Atom**: Install `linter-js-standard`.
- **Vim**: Use `ale`.
- **Emacs**: Install `Flycheck`.
- **WebStorm**: Has built-in support for `standard`.

## Dev Environments
### JavaScript
StandardJS offers a [Visual Studio Code plugin](https://marketplace.visualstudio.com/items?itemName=chenxsan.vscode-standardjs) that is very easy to set up.

Steps to set up:
1. Install the **JavaScript Standard Style** extension.
2. Install StandardJS:
   ```sh
   npm install standard --save-dev
   ```
3. Disable the built-in VS Code validator by adding the following to `settings.json`:
   ```json
   {
     "javascript.validate.enable": false
   }
   ```

### TypeScript
There are multiple ways to set up linting for TypeScript in Visual Studio Code:
1. Follow [this guide](https://dev.to/itmayziii/typescript-eslint-and-standardjs-5hmd), which uses ESLint and is the recommended approach.
2. Refer to the official StandardJS documentation: [Using JavaScript Variants](https://standardjs.com/#can-i-use-a-javascript-language-variant-like-flow-or-typescript).
3. Follow [this older guide](https://minimaldevelop.blog/2017/05/05/how-to-setup-standardjs-for-visual-studio-code-nodejs-and-typescript/), which uses TSLint (note that TSLint is deprecated and may lose support in the future).

By setting up VS Code using these guides, you will benefit from automatic linting and real-time error reporting.

## Using JavaScript Variants
StandardJS supports JavaScript variants with additional configuration.

### TypeScript
Use `ts-standard` to enforce standard rules in TypeScript projects:
```sh
npm install ts-standard --save-dev
ts-standard
```

### Flow
For projects using Flow, install the required plugins:
```sh
npm install @babel/eslint-parser eslint-plugin-flowtype --save-dev
standard --parser @babel/eslint-parser --plugin flowtype
```

## Environment-Specific Settings

### Testing Frameworks (Mocha, Jest, etc.)
To ensure compatibility with testing frameworks, add the appropriate comment at the beginning of test files:
```js
/* eslint-env mocha */
```
Or specify the environment using the command line:
```sh
standard --env mocha
```

### Web Workers and Service Workers
For compatibility with Web and Service Workers:
```js
/* eslint-env worker */
/* eslint-env serviceworker */
```

## Advanced Usage

### Checking Code Inside Markdown or HTML
To lint JavaScript code within Markdown or HTML:
```sh
npm install eslint-plugin-markdown
standard --plugin markdown "**/*.md"
```

### Using Pre-commit Hooks
To prevent unstyled code from being committed:
```yaml
- repo: https://github.com/standard/standard
  hooks:
    - id: standard
```

### Customizing Output
For improved readability in CLI output:
```sh
npm install snazzy
standard | snazzy
```
