Been reading about all the hype from [Vite](https://vitejs.dev) users and decided to give it a try.

### Create Vite Project

First step was to create a Vite project. I'm choosing no framework (vanilla js/ts), as I don't foresee a need to use React with Elm, but we do need to use ports and other things probably. Also, Typescript over JS.

```sh
npm init vite@latest
✔ Project name: … test
✔ Select a framework: › vanilla
✔ Select a variant: › vanilla-ts

Scaffolding project in /Users/jposadas/src/sandbox/test...

Done. Now run:

  cd test
  npm install
  npm run dev

```

> Apparently `npm init <name>` is a shortcut for `npx create-<name>`, hence our command above is basically `npx create-vite@latest`


### Add Elm to Vite Project

Found this plugin called [vite-plugin-elm](https://github.com/hmsk/vite-plugin-elm) that allows us to import Elm as EcmaScript modules (ESM). Follow instructions in [README.md](https://github.com/hmsk/vite-plugin-elm/blob/main/README.md) to install.

To test this, I create a simple hello world elm file and import it from the entrypoint file (`src/main.ts`).
```elm
module Hello exposing (main)

import Html exposing (text)


main =
	text "Hello World"
```

```ts
import "./style.css";
import {Elm} from "./Hello.elm";

const app = document.querySelector<HTMLDivElement>("#app")!;

Elm.Hello.init({node: app});
```

Run the app in dev mode `npm run dev` and "Hello world" should show up.


### Add Tailwindcss

Even though I've only been using tailwind for a month on a side project, I'm currently favoring it over writing vanilla css. This may go away in the future, but not having to name classes is a blessing.

Followed [installation instructions](https://tailwindcss.com/docs/guides/vite) from Tailwind for Vite projects. It should add both a `postcss.config.js` and a `tailwind.config.js` file.

If there's a `postcss.config.js` file present, Vite will automatically apply its configuration to the css files. Tailwind is just a postcss plugin. Since I'm looking to use Elm more heavily, this configuration tells tailwind to look for tailwind classes in `.elm` files (as well as js/ts files).

```js
module.exports = {
  content: [
    "./src/**/*.{js,ts,jsx,tsx,elm}"
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}

```

To test, let's add a couple of tailwind utility classes in our elm file.

```elm
module Hello exposing (main)

import Html exposing (p, text)
import Html.Attributes exposing (class)


main =
    p
        [ class "text-lg text-blue-400 border-2 p-10 inline-block ml-4 mt-4" ]
        [ text "Hello World" ]
```

And we should see this now!

![[Screen Shot 2022-02-05 at 18.11.42.png]]
