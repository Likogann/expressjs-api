# expressjs-api
An API base for ExpressJS. Fork, or clone to use this as a base for a project.

## The Basics
An API base for ExpressJS. This is intended as a base for ExpressJS based APIs.
### Code Seperation
This project has different `.js` files for every route, middleware, so on. The app.js file simply searches, and runs other JS files. This makes it really easy to 
### Environment Variables
The project is setup with a pre-configured `.env` file. I would *highly* recommend to put the majority of your variables as environment variables, instead of having a `config.json` file, or some alternative. Environment variables are far easier to manage, and integrate into things like Docker.

<br>

# File Structure
## api/
### api/routes/
This contains the routes of your project. Each route is in a seperate file to split up a huge app.js file, into many smaller files.
### api/middleware/
Identical to routes, but handles middleware insead.

## data/
Intented to store data that wouldn't really fit in a database.
### data/translations/
Translations contains a list of all translation files.  
As an example, two translation files are provided. `translations.json` is the default English one. By default, it also comes with `translations.de.json`, a German variant of translations.  
<br>
You can create as many translation files as you want. **When creating a new translations file, you must modify `app.js` to include it.**
To do this, we simply have to add a new line to app.js below `let translations = {}`
```js
let translations = {}
translations['en'] = require('./data/translations/translations.json') // English
translations['<lang>'] = require('./data/translations/translations.<lang>.json') // Replace <lang> with the two character language name
```

<br>

# Creating Routes & Middleware
Very first, we must find the apropriate directory to place the `.js` files that handle middleware and routes.  
**For routes:**`api/routes/<file>.js`  
**For middleware:**`/api/middleware/<file>.js`  

## Creating the .js file
Clone the existing file in your desired directory. For routes, it will be named `getInfo.js`, for middleware, it's named `log.js`.
#### Documentation
It's recommended you use the pre-existing comments, located at the top of the file, to document what this file does. While this is recommended to modify this, it's by no means neccassary. 
#### Changing the Route/Middlewares Function
To modify what the route/middlware does, modify the code between `app.use`.
In `log.js`, you would want to modify the following:
```js
// Put your middleware code here
// Build the log
let date = new Date
let DATE_STRING = `${date.toISOString()}`

// Create log var, and log to console
let log = `[${DATE_STRING}] ${req.method} ${req.hostname}${req.originalUrl} | ${req.header('user-agent')}`.grey
console.log(log)

next() // Otherwise the middleware won't continue forwards
```

<br>

# Starting the Server
To start the server, simply run the `app.js` file using node.
```bash
node app.js
```
### Environment Variables
If you don't use .env to pass environment variables, you can also do it here.
```bash
API_PORT=4050 NODE_ENV="staging" LOG_LEVEL=1 node app.js
```