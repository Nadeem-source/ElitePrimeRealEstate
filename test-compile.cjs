const fs = require('fs');
const { execSync } = require('child_process');

fs.writeFileSync('test.css', '@tailwind base; @tailwind components; @tailwind utilities; .test { @apply w-full h-full text-primary; }');
try {
  execSync('npx tailwindcss -i test.css -o test-out.css', { stdio: 'inherit' });
  console.log('Success');
} catch (e) {
  console.error('Failed');
}
