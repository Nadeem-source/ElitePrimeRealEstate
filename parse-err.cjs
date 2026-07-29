const postcss = require('postcss');
const tailwindcss = require('tailwindcss');
const fs = require('fs');

let css = fs.readFileSync('src/raw.css', 'utf8');

// We can just remove "glass", "glass-dark", "text-gradient", "shadow-luxury" from the @apply lines,
// or we can add them to a @layer components block.

css = `
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer components {
  .glass {
    background: rgba(255, 255, 255, 0.7);
    backdrop-filter: blur(12px);
    border: 1px solid rgba(255, 255, 255, 0.3);
  }
  .glass-dark {
    background: rgba(15, 23, 42, 0.8);
    backdrop-filter: blur(12px);
    border: 1px solid rgba(255, 255, 255, 0.1);
  }
  .text-gradient {
    background-clip: text;
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-image: linear-gradient(to right, #F59E0B, #FEF08A);
  }
}
` + css.replace(/@tailwind base;\n@tailwind components;\n@tailwind utilities;\n\n/, '');

fs.writeFileSync('src/raw.css', css);

postcss([
  tailwindcss()
]).process(css, { from: 'src/raw.css' }).then(result => {
  console.log('Success');
}).catch(err => {
  console.log(err.reason);
  console.log(err.line);
});
