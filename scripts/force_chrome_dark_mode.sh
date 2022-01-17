#!/bin/bash

# Force proper dark mode on Google Chrome
# adds the "--enable-features=WebUIDarkMode --force-dark-mode" flags to the desktop entry

system_entry="/usr/share/applications/google-chrome.desktop"
if [ ! -f "${system_entry}" ]; then
  echo "ERROR: ${system_entry} does not exist"
  exit 1
fi

user_entry="${HOME}/.local/share/applications/$(basename "${system_entry}")"
if [ -f "${user_entry}" ]; then
  echo "ERROR: ${user_entry} already exists"
  exit 1
fi

cp "${system_entry}" "${user_entry}"
line_match="Exec=/usr/bin/google-chrome-stable"
sed -i "s:${line_match}:${line_match} --enable-features=WebUIDarkMode --force-dark-mode:g" "${user_entry}"

echo "SUCCESS: created ${user_entry}"

