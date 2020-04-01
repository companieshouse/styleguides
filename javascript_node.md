JavaScript Coding Standards (Node)
===================================

Node coding standards at Companies House follows:
* [StandardJS](https://standardjs.com/)

StandardJS supports both JavaScript and Typescript. The purpose of choosing one set of linting rules is to allow all of our projects to be consistent and therefore easier to work on and maintain.
***

Dev environments
-----------------
To set up 
### JavaScript

StandardJS offers a Visual Studio Code plugin that is very easy to setup (https://marketplace.visualstudio.com/items?itemName=chenxsan.vscode-standardjs) 

 1. Install 'JavaScript Standard Style' extension
 2. Install standard (`npm install standard --save-dev`)
 3. Disable the built-in VSCode validator (To do this, set `"javascript.validate.enable": false` in your VSCode `settings.json`)

### TypeScript

There are a few ways to set up linting in Visual Studio Code for TypeScript. 

1. Follow this guide: https://dev.to/itmayziii/typescript-eslint-and-standardjs-5hmd. This uses eslint, so should be the option of choice.
2. Follow the official guide here: https://standardjs.com/#can-i-use-a-javascript-language-variant-like-flow-or-typescript
3. Follow this guide: https://minimaldevelop.blog/2017/05/05/how-to-setup-standardjs-for-visual-studio-code-nodejs-and-typescript/. This method uses tslint, which may lose support in the near future.

By setting up VSCode using the guides above, you should get automatic lint reporting