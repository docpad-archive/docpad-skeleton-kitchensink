# Requires
docpad = require 'docpad'
express = require 'express'

# =====================================
# Configuration

# Variables
oneDay = 86400000
expiresOffset = oneDay

# Configuration
docpadPort = process.env.DOCPADPORT || process.env.PORT || 10113

# Create Servers
docpadServer = express.createServer()

# Configure DocPad
docpadConfig =
	port: docpadPort
	maxAge: expiresOffset
	server: docpadServer
	plugins:
		admin: requireAuthentication: true
		rest: requireAuthentication: true


# =====================================
# Start & Extend DocPad

# Create DocPad, and wait for it to load
docpadInstance = docpad.createInstance docpadConfig, (err) ->
	# Prepare
	throw err  if err
	logger = docpadInstance.logger

	# ---------------------------------
	# Server Configuration

	# DNS Servers
	# masterServer.use express.vhost 'yourwebsite.*', docpadServer

	# Start Server
	# we need the generate for dynamic documents, if you don't utilise dynamic documents, then you just need the server
	docpadInstance.action 'server generate'


	# ---------------------------------
	# Server Extensions

	# Place any custom routing here
	# http://expressjs.com/


# =====================================
# Exports

# Export the DocPad Server we created
module.exports = docpadServer