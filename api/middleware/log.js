/* 
type: api/middleware
name: log
input: (irrelevant)
output: (irrelevant)
dependencies:
 - 
 - 
 - 
description:

Log all connections to the API - This file is also used as the base for other middleware

*/

// Dependencies
//(none)
// Files
//(none)
// Plugins
//(none)

// Code
module.exports = function(app, translations){
    // Build the middleware
    app.use(function(req, res, next) {
        // Put your middleware code here
        // Build the log
        let date = new Date
        let DATE_STRING = `${date.toISOString()}`

        // Create log var, and log to console
        let log = `[${DATE_STRING}] ${req.method} ${req.hostname}${req.originalUrl} | ${req.header('user-agent')}`.grey
        console.log(log)

        next() // Next - Otherwise the middleware won't continue forwards
    });
}