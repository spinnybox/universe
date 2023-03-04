import { createGenerator } from "@unocss/core";
import { parse } from "std/flags/mod.ts";
import { expandGlob } from "std/fs/mod.ts";
import config from "./unocss.config.ts";

const { watch } = parse(Deno.args, { boolean: ["watch"] });

const TARGET = new URL("./src", import.meta.url);
const CSS_RESET_URL = new URL("https://unpkg.com/@unocss/reset/antfu.css");
const CSS_RESET_TARGET = new URL("./styles/reset.css", TARGET);
const generator = createGenerator(config);

try {
  // Do nothing if the file exists.
  await Deno.readTextFile(CSS_RESET_TARGET);

  console.log(
    "%c✔ %c`reset.css` %calready exists",
    "color: green",
    "color: gray",
    "color: rgb(255, 192, 203)",
  );
} catch {
  console.log(
    "%cℹ %cDownloading %c`reset.css`",
    "color: blue",
    "color: rgb(255, 192, 203)",
    "color: gray",
  );

  // When the file doesn't exist write it.
  const response = await fetch(CSS_RESET_URL);
  const file = await Deno.open(CSS_RESET_TARGET, { write: true, create: true });

  if (response.body) {
    await response.body?.pipeTo(file.writable);
    // The above should automatically close the file.
  } else {
    file.close();
  }
}

const RESET = await Deno.readTextFile(CSS_RESET_TARGET);

async function run() {
  const contents: Array<string> = [];

  for await (const file of expandGlob("**\/*.rs", { root: TARGET.pathname })) {
    const text = await Deno.readTextFile(file.path);
    contents.push(text);
  }

  const generated = await generator.generate(contents.join("\n\n"), {});

  console.log(
    "%cℹ %cHere are the generated styles",
    "color: blue",
    "color: gray",
  );
  console.log([...generated.matched]);

  await Deno.writeTextFile(
    new URL("./styles/main.css", TARGET),
    `${RESET}\n\n${generated.css}`,
  );
}

if (watch) {
  await run();

  console.log(
    "%cℹ %cRunning in %cwatch mode",
    "color: blue",
    "color: orange",
    "font-weight: bold; color: orange",
  );
  const watcher = Deno.watchFs(TARGET.pathname);

  for await (const change of watcher) {
    console.log(
      "%cℹ %cThe following paths changed",
      "color: blue",
      "color: gray",
    );
    console.log(change.paths);
    console.log();

    await run();
  }
} else {
  await run();
}
