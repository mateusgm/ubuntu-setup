echo "[Desktop Entry]
Name=Sublime Text 2 URL Handler
GenericName=Text Editor
Comment=Handle URL Scheme txmt://
Exec=/home/$USER/.sublime-handler %u
Terminal=false
Type=Application
MimeType=x-scheme-handler/txmt;
Icon=sublime-text-2
Categories=TextEditor;Development;Utility;
Name[en_US]=Sublime Text 2 URL Handler" | sudo tee -a /usr/share/applications/sublime-handler.desktop

sudo update-desktop-database

echo '#!/usr/bin/env bash' >> ~/.sublime-handler
echo 'request=${1:23}               # Delete the first 23 characters'  >> ~/.sublime-handler
echo 'request=${request//%2F//}     # Replace %2F with /'  >> ~/.sublime-handler
echo 'request=${request/&line=/:}   # Replace &line= with :'  >> ~/.sublime-handler
echo 'request=${request/&column=/:} # Replace &column= with :'  >> ~/.sublime-handler
echo 'sublime-text-2 $request       # Launch ST2"' >> ~/.sublime-handler