#!/bin/bash
#    Copy a ssh key to Github
#    Copyright (C) 2015 Christoph "criztovyl" Schulz
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#    Token extraction stolen from https://github.com/deshawnbw/env/blob/master/scripts/auth_hosts [WTFPL License](http://wtfpl.net)

###
# Help
[ "$1" == "--help" ] || [ "$1" == "-h" ] || [ "$1" == "help" ] && 
{
    echo "Usage: ./ssh-copy-id-github"
    echo "Adds .ssh/id_rsa.pub to your Github's SSH keys."
    exit
}

###
# Toke file
GITHUB_TOKEN_FILE=~/.ssh_copy_id_github_token

###
# Function
# Args: username
#   username: Github username
ssh_copy_id_github() {

    # Username
    username=$1
    [ -z $username ] && read -p "Your Github username: " username || username=$username; echo "Username: $username"

    # Account token from file or authorize via API
    [ -f $GITHUB_TOKEN_FILE ] && token=`cat $GITHUB_TOKEN_FILE` || \ 
    { 
        echo "Authorizing GitHub..."
        token=`curl -s https://api.github.com/authorizations --user $username --data "{\"scopes\":[\"write:public_key\"],\"note\":\"ssh-copy-id-github, user: $USER host: $HOST time: `date` \"}" | grep "token" | cut -d ':' -f2 | tr -d "\"" | tr -d ", " | tr -d " "`
    }

    # The key
    key=`cat ~/.ssh/id_rsa.pub`

    # Result (Debug)
    result=$(curl -s https://api.github.com/user/keys -X POST -H "Authorization: token $token" -H "application/json" -d "{\"title\": \"$USER@$HOSTNAME\", \"key\": \"$key\"}")
    echo "$result"

}

# Execute.
ssh_copy_id_github $1
