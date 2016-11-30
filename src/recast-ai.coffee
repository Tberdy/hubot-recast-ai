# 
# Description:
#   Hubot script for Recast Ai.
#
#   Set the environment variable RECAST_AI_TOKEN (mandatory) 
#   and RECAST_AI_LANG if you wants a language different than english 
#
# Dependencies:
#   recastai
#
# Configuration:
#   RECAST_AI_TOKEN   
#
# Author:
#   Thomas Berdy

recast  = require 'recastai'

module.exports = (robot) ->
  options =
    token: process.env.RECAST_AI_TOKEN
    lang: process.env.RECAST_AI_LANG or 'en' 

  robot.logger.error "No Recast.ai token provided to Hubot" unless options.token
  CLIENT = new recast.Client options.token, options.lang   
  
  robot.respond /[,\s]+(.*)/i, (msg) ->
    query = msg.match[1]
    if query and !msg.message.recast?
      CLIENT.textRequest(query)
        .then((res) ->
          intent = res.intent()
          if intent?
            newIntent = intent.slug.replace(/_/g, " ");
            msg.message.text = robot.name + ' ' + newIntent
            msg.message.recast = true
            robot.receive msg.message
        ).catch (err) -> 
          console.log err
          msg.send 'Communication error with Recast.Ai'
               