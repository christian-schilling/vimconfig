#!/usr/bin/python
import os
os.system("""gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']""")
os.system("""mv vimconfig/ .vim""")
os.system("""ln -s .vim/vimrc .vimrc""")
os.system("""ln -s .vim/gtkrc-2.0 .gtkrc-2.0""")
os.system("""mkdir .fonts""")
os.system("""ln -s .vim/Inconsolata-dz-Powerline.otf .fonts/""")
os.system("""fc-cache -vf .fonts""")
