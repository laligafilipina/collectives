> generat a new ssh key
    + ssh-keygen -t ed25519 -C "<your_email>"
    + ssh-keygen -t rsa -b 4096 -C "<your_email>"

> start ssh in background
    + eval "$(ssh-agent -s)"

> add ssh private key to ssh agent
    + ssh-add ~/.ssh/<private_key_file>

> copy the ssh public key to clipboard
    + apt-get update
    + apt-get install xclip
    ! yum install xclip # for other linux distro
    + xclip -selection clipboard < ~/.ssh/<public_key_file>

> goto `settings` and click `ssh and gpg keys` then click `new ssh key` or `add ssh key`
> paste your key into the `Key` field
> then `add ssh key` then `confirm password`
> check for remote repository url
    + git remote -v

> set remote repository url
    + git remote set-url origin git@github.com:laligafilipina/laligafilipina

> you can now push without any authentication needed. done!.
