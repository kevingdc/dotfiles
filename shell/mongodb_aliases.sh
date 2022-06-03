# alias mongod='brew services start mongodb-community'
# alias mongod-stop='brew services stop mongodb-community'
alias mongod-start='mongod --config /usr/local/etc/mongod.conf --fork'
alias mongod-stop='mongo --eval "db.adminCommand({shutdown: 1})" &> /dev/null ; echo "MongoDB stopped."'
