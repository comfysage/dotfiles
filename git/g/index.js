#!/usr/bin/env node

const { exec } = require("child_process");

let args = process.argv.slice(2);

if (args.length == 0) {
 process.exit()
}

let command = {
 patch: "git add -p",
 unpatch: "git reset -p",
 commit: "git commit",
 status: "git status --short",
 log: "git log --oneline --graph",
}[args[0]];

exec(command, (error, stdout, stderr) => {
 if (error) {
  console.log(`error: ${error.message}`);
  return;
 }
 if (stderr) {
  console.log(`stderr: ${stderr}`);
  return;
 }
 console.log(stdout)
});

// vim: ft=javascript
