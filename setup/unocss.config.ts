import type { UserConfig } from "@unocss/core";
import presetUno from "@unocss/preset-uno";
import presetTheme from "unocss-preset-theme";

// @ref https://github.com/unocss/unocss#configurations
export default <UserConfig> {
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
      main: "",
    },
  },
  presets: [
    presetUno({ dark: "class" }),
    presetTheme({
      theme: {
        dark: {},
      },
    }),
  ],
};
