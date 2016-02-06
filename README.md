# ssh-copy-id-github
Attaches your (public) SSH key to your GitHub account.  
Inspired by [debugish/env](https://github.com/debugish/env/blob/master/scripts/auth_hosts#L7).
## Install
You can install ssh-copy-id-github directly via Git or by Zip.
###Git
    # Create a directory and enter it
    $ mkdir -p .local/opt/ && cd $_
    # Clone repo
    $ git clone https://github.com/criztovyl/ssh-copy-id-github ssh-copy-id-github 
    # Create bin directory
    $ mkdir bin && cd bin
    # Link executable
    $ ln -s ../ssh-copy-id-github/ssh-copy-id-github.sh ssh-copy-id-github
    # Appends the created bin directory to user PATH (requires bash restart)
    $ echo 'export PATH=$HOME/.local/opt/bin:$PATH' >> ~/.bashrc
###Zip
    # Create directory and enter it
    $ mkdir -p .local/opt/ && cd $_
    # Download zip
    $ wget https://github.com/criztovyl/ssh-copy-id-github/archive/master.zip
    # Extract and delete zip
    $ unzip master.zip && rm -f master.zip
    # Rename directory
    $ mv ssh-copy-id-github{-master,}
    # Create bin directory and enter
    $ mkdir bin && cd $_
    # Link executable
    $ ln -s ../ssh-copy-id-github/ssh-copy-id-github.sh ssh-copy-id-github
    # Appends the created bin directory to user PATH (requires bash restart)
    $ echo 'export PATH=$HOME/.local/opt/bin:$PATH' >> ~/.bashrc
    

## Usage

    Usage: ./ssh-copy-id-github [username]
    Adds .ssh/id_rsa.pub to your Github's SSH keys.
    Usage: ./ssh-copy-id-github [username] [pub_key_file]
    Adds specified Public Key File to your Github's SSH keys.
    With confirmation, non-exiting Public Key File kicks off ssh-keygen
    
## License
    Copyright (C) 2015 Christoph "criztovyl" Schulz

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
