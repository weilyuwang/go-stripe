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

### Environment variables required

#### Frontend (cmd/web)
```
// stripe
STRIPE_KEY=
STRIPE_SECRET=

// Secret Key (256 bits/32 chars)
SECRET_KEY=
```

#### Backend (cmd/api)
```
// stripe
STRIPE_KEY=
STRIPE_SECRET=

// Secret Key (must be the same as frontend SECRET_KEY)
SECRET_KEY=

// smtp (e.g. mailtrap.io)
SMTP_USERNAME=
SMTP_PASSWORD=
```

### Live-loading command line utility (optional)

#### [Air](https://github.com/cosmtrek/air)


### Main Go Modules Used in this project

#### [chi: HTTP router](https://github.com/go-chi/chi)
#### [Go Stripe SDK](https://github.com/stripe/stripe-go)
#### [SCS Session Manager](https://github.com/alexedwards/scs)
#### [MySQL based session store for SCS](https://github.com/alexedwards/scs/tree/master/mysqlstore)
#### [SMTP Client for sending email](https://github.com/xhit/go-simple-mail)
#### [MAC signer](https://github.com/bwmarrin/go-alone)
#### [gorilla websocket](https://github.com/gorilla/websocket)
