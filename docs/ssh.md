http://www.linuxproblem.org/art_9.html

## new key
`a@A:~> ssh-keygen -t rsa`

## copy key to destination server
`a@A:~> ssh b@B mkdir -p .ssh`
`a@A:~> cat .ssh/id_rsa.pub | ssh b@B 'cat >> .ssh/authorized_keys'`

## online
`a@a:~> cat ~/.ssh/id_rsa.pub | ssh b@B "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"`

