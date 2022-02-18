# GO Stripe


### MariaDB database

- start the database
```
docker-compose up
```

- create a new database/schema `widgets`
- grant privileges command in DB console.
```
grant all on widgets.* to '[your_username]'@'%' identified by '[your_password]';
```


### Live-loading command line utility (optional)

https://github.com/cosmtrek/air