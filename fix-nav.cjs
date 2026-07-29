const fs = require('fs');
let code = fs.readFileSync('src/components/layout/Navbar.jsx', 'utf8');

code = code.replace(
  /className=\{cn\([\s\S]*?location\.pathname === link\.path \? "text-accent" : "text-primary"\s*\)\}/g,
  "className={`nav-link ${location.pathname === link.path ? 'nav-link-active' : ''}`}"
);

fs.writeFileSync('src/components/layout/Navbar.jsx', code);
