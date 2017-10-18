# Move the symbol font to a valid X font path. Valid font paths can be listed with `xset q`
#cp PowerlineSymbols.otf ~/.local/share/fonts/
cp PowerlineSymbols.otf /usr/share/fonts/

# Update font cache for the path the font was moved to (root priveleges may be needed to update cache for the system-wide paths)
#fc-cache -vf ~/.fonts/
fc-cache -vf /usr/share/fonts/

# Install the fontconfig file. For newer versions of fontconfig the config path is ~/.config/fontconfig/conf.d/, for older versions it’s ~/.fonts.conf.d/
#cp 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
cp 10-powerline-symbols.conf /etc/fonts/conf.d/
