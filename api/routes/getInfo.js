/* 
type: api/route
name: example
input: (irrelevant)
output: (irrelevant)
dependencies:
 - translations
 - 
 - fs
description:
Displays info about the server - this is mainly an example command used as a base for other commands
*/
// Files
//(none)
// Plugins
//(none)
// Dependencies
const fs = require('fs')

module.exports = function(app, translations) {
    app.get('/info', function(req, res){
        res.json({sucess:true,env:process.env.NODE_ENV})
    })
}