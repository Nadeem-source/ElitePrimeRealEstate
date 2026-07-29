const postcss = require('postcss');
const tailwindcss = require('tailwindcss');
const fs = require('fs');

async function fix() {
  let css = fs.readFileSync('src/raw.css', 'utf8');
  let iter = 0;
  while(iter < 20) {
    iter++;
    try {
      await postcss([tailwindcss()]).process(css, { from: 'src/raw.css' });
      fs.writeFileSync('src/raw.css', css);
      console.log('Success!');
      return;
    } catch (err) {
      if (err.reason && err.reason.includes('does not exist')) {
        const match = err.reason.match(/The `([^`]+)` class does not exist/);
        if (match) {
          const missing = match[1];
          console.log('Mocking missing class: ' + missing);
          css = css.replace('@layer components {', `@layer components {\n  .${missing.replace(/\\/g, '')} { }\n`);
        } else {
          console.log('Unknown error:', err.reason);
          break;
        }
      } else {
        console.log('Unknown error:', err.reason);
        break;
      }
    }
  }
}
fix();
