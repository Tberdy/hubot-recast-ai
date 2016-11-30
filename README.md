# hubot-recast-ai

The recast.ai interface for hubot 

## Synospis

This module is a [recast.ai](https://recast.ai) interface for [Hubot](https://hubot.github.com). 
It allows you to speak to your bot with native language and preserve compatibility with the other hubot modules.


## Installation

In your hubot directory:

```bash
npm install --save hubot-recast-ai
```

Then add **hubot-recast-ai** to your `external-scripts.json`:

```json
[
  "hubot-recast-ai"
]
```

## Usage

Create a new bot on recast.ai and add it some intents  
Each intent should be equal to a command from one hubot module

Then launch hubot with the following environment variables:

```bash
RECAST_AI_TOKEN=your_token_from_recast RECAST_AI_LANG=language bin/hubot
```

## Known bugs

If you type the exact command for another module (eg. "ship it" for the 
hubot-shipit module), both will handle your input and you will receive two answers

## Author

Thomas Berdy, tberdy@hotmail.fr

