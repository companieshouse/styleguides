# Typescript Coding Standards

[!IMPORTANT]
TypeScript is now the default language for all JavaScript and Node.js projects. Refer to existing JavaScript style guides for specific information on Javascript styling that isn't covered by TypeScript.

## Why Use TypeScript?

TypeScript is a superset of JavaScript that allows you to write code more efficiently. It uses type definitions and a built-in checker to highlight errors and suggest code during the writing stage.

This style guide is based on the [Google TypeScript Style Guide](https://google.github.io/styleguide/tsguide.html). Please refer directly to the style guide for specific information on typing, features, and so on.

### Key Benefits

+ **Static typing:** TypeScript allows you to define types, helping to catch errors at compile rather than run time
+ **Varying levels of strictness:** TypeScript lets you set strictness limits that can prevent undefined and any type values
+ **Readability:** Typing makes code more readable to humans, allowing us to work across teams on the same repos

## How to Install Typescript

Globally: 
```npm install -g typescript```

In project: 
```npm install typescript --save-dev```

### IDE Integration

TypeScript is compatible with popular IDEs and comes bundled with VSCode and IntelliJ as standard. Refer to the [VSCode](https://code.visualstudio.com/Docs/languages/typescript) and [IntelliJ](https://www.jetbrains.com/help/idea/typescript-support.html) pages for more configuration details.

## Strictness and Pretty

TypeScript includes settings for typing strictness. This refers to the level of checks it performs on your code and the errors it catches. The most lenient level allows null values. Stricter levels check everything in more detail, allowing you to get the most out of TypeScript.

Two flags you should turn on are:

+ **noImplicitAny:** TypeScript will issue an error for values inferred as the any type
+ **strictNullChecks:** This setting forces you to explicitly handle null and undefined values

Avoid using the "any" type in your code. Instead, use "unknown" for something you don't want to associate with a type. Using the "any" type will turn off type checking, which can allow an error to slip through.

Another useful feature is the pretty function, which is enabled by default. It uses colours and styles to highlight types and errors in your code. Keep it enabled for usability purposes.

## tsconfig File

The default settings for your tsconfig file will be fine for the majority of projects. Double check that noImplictAny, strictNullChecks, and pretty are all set to true. 

Include your root directory or folder (typically src) and exclude node_modules. Anything under include will have type checking run against it; conversely, anything in exclude will be ignored.

Here is an example tsconfig.json. Your settings should be the same:

```JSON
{
  "compilerOptions": {
    "target": "es6",
    "module": "commonjs",
    "moduleResolution": "node",
    "allowJs": true,
    "sourceMap": true,
    "outDir": "./dist",
    "esModuleInterop": true,
    "strict": true,
    "noImplicitAny": true,
    "skipLibCheck": true,
    "pretty": true,
    "strictNullChecks": true,
    "baseUrl": "./src",
    "emitDecoratorMetadata": true,
    "experimentalDecorators": true,
  },
  "include": [
    "src/**/*",
  ],
  "exclude": [
    "node_modules"
  ]
}
```

[!NOTE]

At the time of writing, ES6 is the target ECMAScript. Be aware that this may change in the future or may differ depending on your project.

## package.json

Add TypeScript and typescript-eslint versions to your package.json under devDependencies. For example: 

```JSON
  "devDependencies":
    "@typescript-eslint/eslint-plugin": "^5.15.0",
    "@typescript-eslint/parser": "^5.15.0",
    "typescript": "^4.6.2"
```

[!NOTE]

These are the latest versions at the time of writing. Check you have the latest versions before adding to your json.

## Naming and Linting

As TypeScript is a superset of JavaScript, follow existing [naming](https://typescript-eslint.io/rules/) and linting conventions discussed in the JavaScript style guides.

Use typescript-eslint to enforce TypeScript rules. The [typescript-eslint page](https://typescript-eslint.io/rules/) has more information on specific linting rules.