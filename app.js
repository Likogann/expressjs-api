// # Dependencies
// ## Functional
const fs = require('fs')
const express = require('express')
// ## Information
require('dotenv').config()
// ## Prettifiers
const colour = require('colors')

// # Variable Handling
// ## Translations
let translations = {}
translations['en'] = require('./data/translations/translations.json') // English
translations['de'] = require('./data/translations/translations.de.json') // German



// # ExpressJS
let app = express()

// ## Find and load middleware
fs.readdirSync(__dirname + '/api/middleware/').forEach(function(file) {
	if (!file.endsWith('.js')) return; // If the file doesn't end in .js, don't load it!
	(process.env.LOG_LEVEL) >= 1 ? console.log(`Loading api-middleware ${file}`.grey) :null;
	require('./api/middleware/' + file)(app, translations);
});

// ## Find and load routes - Thanks old code :)
fs.readdirSync(__dirname + '/api/routes/').forEach(function(file) {
	if (!file.endsWith('.js')) return; // If the file doesn't end in .js, don't load it!
	(process.env.LOG_LEVEL) >= 1 ? console.log(`Loading api-route ${file}`.grey) :null;
	require('./api/routes/' + file)(app, translations);
});

// ## Start the ExpressJS listener
app.listen(process.env.API_PORT, () => {
    console.log(`Example app listening on port `.green + `${process.env.API_PORT}`.grey)
})