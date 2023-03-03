import { createGenerator } from "@unocss/core";
import { parse } from "std/flags/mod.ts";
import { expandGlob } from "std/fs/mod.ts";
import config from "./unocss.config.ts";

const { watch } = parse(Deno.args, { boolean: ["watch"] });

const TARGET = new URL("./src", import.meta.url);
const generator = createGenerator(config);

async function run() {
  const contents: Array<string> = [];

  for await (const file of expandGlob("**\/*.rs", { root: TARGET.pathname })) {
    const text = await Deno.readTextFile(file.path);
    contents.push(text);
  }

  const something = await generator.generate(contents.join("\n\n"), {});

  await Deno.writeTextFile(
    new URL("./styles/main.css", TARGET),
    something.css,
  );
}

if (watch) {
  console.log("running in watch mode");
  const watcher = Deno.watchFs(TARGET.pathname);
  for await (const change of watcher) {
    console.log("The following paths changed", change.paths);
    await run();
  }
} else {
  await run();
}
