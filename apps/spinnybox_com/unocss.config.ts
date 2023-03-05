import type { UserConfig } from "@unocss/core";
import { Theme } from "@unocss/preset-mini";
import presetTypography from "@unocss/preset-typography";
import presetUno from "@unocss/preset-uno";
import presetTheme from "unocss-preset-theme";

const mainFontFamily =
  'gloriah, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol"';
const headerFontFamily =
  'sippin, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol"';

// @ref https://github.com/unocss/unocss#configurations
export default <UserConfig<Theme>> {
  cli: {
    entry: { patterns: ["**/*.rs"], outFile: "" },
  },
  theme: {
    colors: {
      primary: "#fd0a5b",
      secondary: "#ffbd33",
      tertiary: "#0099ff",
      text: "#1f1f1f",
      border: "#1f1f1f",
      background: "#f9f9f9",
    },
    fontFamily: {
      main: mainFontFamily,
      header: headerFontFamily,
    },
  },
  presets: [
    presetUno({ dark: "class" }),
    presetTypography({
      cssExtend: {
        html: {
          "font-family": mainFontFamily,
        },
        "h1,h2,h3,h4,h5,h6": {
          "font-weight": "400",
          "font-family": headerFontFamily,
        },
      },
    }),
    presetTheme({
      theme: {
        dark: {},
      },
    }),
  ],
  rules: [
    ["bg-home-top", {
      "background-image": "url('/svg/website_home_page_top_background.svg')",
      "background-size": "100% 600px",
      // "background-position": "top center",
      "background-repeat": "no-repeat",
    }],
    ["bg-home-bottom", {
      "background-image": "url('/svg/website_home_page_bottom_background.svg')",
      "background-size": "100% 600px",
      // "background-position": "top center",
      "background-repeat": "no-repeat",
    }],
  ],
};
