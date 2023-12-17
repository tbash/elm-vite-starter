import { defineConfig } from "vite";
import elmPlugin from "vite-plugin-elm";

export default defineConfig({
  plugins: [elmPlugin.default()],
  server: {
    strictPort: true,
    port: 8080,
  },
});
