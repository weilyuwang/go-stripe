# GO Stripe

### Components

A sample E-Commerce application that consists of multiple, separate applications: 
- A front end, rendered using Go's rich html/template package and services content to the end user as web pages.
- A restful back end API, which is called by the front end as necessary.
- A microservice that's dynamically building PDF invoices and sending them to customers as an email attachment.


### Functionalities

The application:
- allows users to purchase a single product.
- allows users to purchase a recurring monthly subscription (a Stripe plan).
- handles subscription cancellations and refunds.
- saves all transaction information to a MariaDB database (for refunds, reporting, etc.).
- secures access to the frontend via session authentication.
- secures access to the backend API via stateful tokens.
- manages users (add/edit/delete).
- allows users to reset their passwords safely and securely.
- supports logging a user out and cancel their account instantly, over websockets.
- produces PDF invoices and sends them via email to the customers.

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


### Main Go Modules Used in this project

#### [chi: HTTP router](https://github.com/go-chi/chi)
#### [Go Stripe SDK](https://github.com/stripe/stripe-go)
#### [SCS Session Manager](https://github.com/alexedwards/scs)
#### [MySQL based session store for SCS](https://github.com/alexedwards/scs/tree/master/mysqlstore)
#### [SMTP Client for sending email](https://github.com/xhit/go-simple-mail)
#### [MAC signer](https://github.com/bwmarrin/go-alone)
#### [gorilla websocket](https://github.com/gorilla/websocket)
