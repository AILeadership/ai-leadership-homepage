// @ts-check
import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  output: 'static',
  site: 'https://swa-ai-leadership.azurestaticapps.net',
  base: '/',
  build: {
    format: 'file',
    assets: '_astro'
  },
  compressHTML: true,
  vite: {
    build: {
      rollupOptions: {
        output: {
          assetFileNames: '_astro/[name].[hash][extname]',
          chunkFileNames: '_astro/[name].[hash].js',
          entryFileNames: '_astro/[name].[hash].js',
        }
      }
    }
  }
});
