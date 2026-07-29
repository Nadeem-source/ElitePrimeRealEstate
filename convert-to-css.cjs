const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

function walk(dir) {
  let results = [];
  const list = fs.readdirSync(dir);
  list.forEach(file => {
    let filePath = path.join(dir, file);
    const stat = fs.statSync(filePath);
    if (stat && stat.isDirectory()) {
      results = results.concat(walk(filePath));
    } else {
      if (filePath.endsWith('.jsx')) results.push(filePath);
    }
  });
  return results;
}

const files = walk('./src');
let rawCss = '@tailwind base;\n@tailwind components;\n@tailwind utilities;\n\n';

let globalId = 1;

files.forEach(file => {
  let content = fs.readFileSync(file, 'utf8');
  const baseName = path.basename(file, '.jsx').toLowerCase();
  
  // Only match double quotes, no newlines
  const regex = /className="([^"\n\r]+)"/g;
  
  content = content.replace(regex, (match, classes) => {
    // Skip if it contains expressions or is already a custom class
    if (classes.includes('{') || classes.includes('}') || classes.startsWith(baseName + '-')) {
      return match;
    }
    
    // Check if it has any actual tailwind classes (at least one space or dash etc)
    // If it's just "app", maybe leave it? Let's just convert everything.
    
    const newClass = `${baseName}-el-${globalId++}`;
    
    rawCss += `.${newClass} {\n  @apply ${classes};\n}\n`;
    
    return `className="${newClass}"`;
  });
  
  fs.writeFileSync(file, content);
});

fs.writeFileSync('src/raw.css', rawCss);
console.log('Processed JSX files. Compiling CSS...');

try {
  execSync('npx tailwindcss -i src/raw.css -o src/index.css', { stdio: 'inherit' });
  console.log('Successfully compiled to src/index.css');
} catch (e) {
  console.error('Failed to compile CSS');
  process.exit(1);
}
