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

#### [Go Stripe SDK](https://github.com/stripe/stripe-go)
#### [SCS Session Manager](https://github.com/alexedwards/scs)
#### [chi](https://github.com/go-chi/chi)