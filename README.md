# GO Stripe


### MariaDB database

#### Start the database:
```
docker-compose up
```

### DB Migration Tool

#### [Soda CLI](https://gobuffalo.io/en/docs/db/toolbox/)

#### Run DB migrations with Soda CLI
```
cd migrations &&
soda migrate
```

#### Generate DB dump from Docker container
```
docker exec -i [CONTAINER_NAME] mysqldump -uroot -p[ROOT_PASSWORD] --databases [DB_NAME] --skip-comments > [YOUR_PATH]/dump.sql
```


### Live-loading command line utility (optional)

#### [Air](https://github.com/cosmtrek/air)


### Go Modules

#### [chi: HTTP router](https://github.com/go-chi/chi)
#### [Go Stripe SDK](https://github.com/stripe/stripe-go)
#### [SCS Session Manager](https://github.com/alexedwards/scs)
#### [MySQL based session store for SCS](https://github.com/alexedwards/scs/tree/master/mysqlstore)
#### [SMTP Client for sending email](https://github.com/xhit/go-simple-mail)
#### [MAC signer](https://github.com/bwmarrin/go-alone)
