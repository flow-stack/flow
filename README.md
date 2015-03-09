*flow*
====
[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/flow-stack/flow?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

![[Analytics](http://ga-beacon.appspot.com/UA-8765087-15/flow-stack/flow?pixel](https://github.com/igrigorik/ga-beacon)


A living full-stack framework for the web. 

## Why *flow*?

There are plenty of stacks available for the web -- and yet there is none that really sticks to *intuition*, *discovery* and *personal mastery* for the modern web. 

There is technology that was [designed with those principles](http://www.cs.virginia.edu/~evans/cs655/readings/smalltalk.html) as premises and that's why flow embraces [Smalltalk](http://en.wikipedia.org/wiki/Smalltalk). With [Amber](http://amber-lang.net/) taking care of html5 and doing everything in the browser, and [Pharo](http://pharo.org/) being incredibly productive in the backend, this stack is an answer to that call. 


## What is *flow*?

Flow is an open-source project with a *mission*. 

Flow's mission is to provide *consultants*, *startups* and *software houses* with **a competitive Smalltalk full-stack framework** that allows them to quickly deliver a demo with all the modern html5 features the market expects today (2014). The idea is that they can tactically use this framework to keep momentum up among their prospects and clients and scale things to full successful projects delivered by kickass productive teams or individuals.

If you resonate with this, **please give it a star**, **fork it** and be part of it helping us pushing and bugfixes and the features you want to use (see the *Contributing* section below). *Thank you!*

## Starting a fresh flow app

Please have in mind that *flow* has [requisites](https://github.com/sebastianconcept/flow/wiki/flow-requirements) most of that is widely popular parts of the frontend world. If you have all that sorted out, here is how you start a brand new flow-based app:

1. Open a terminal in your `git/` directory.
2. Execute: `mkdir newAppName`
3. Execute: `cd newAppName`
4. Execute: `git clone https://github.com/flow-stack/flow.git .` Note the dot at the end signalling that you want it cloned in that directory.
5. Execute: `./cleanBuild` and wait for it until finishes installing all the frontend dependencies and backend Pharo image. It will take a couple of minutes but is normally a one time operation.
6. After the build completes, execute: `./startAll` and 

*Happy `newAppName` coding!*

## Directory structure

Flow is a full stack framework, and thus has two important directories:  `backend/` and `frontend/`. It also has the `public/` directory that's used as output of the frontend's build process and is meant to be used only for [staging](http://en.wikipedia.org/wiki/Staging_site) or production.

- **app/** the root directory of your flow based app.
- **app/backend/** where you'll find the development Pharo worker image and all the things needed for the backend to run.
- **app/frontend/** where you have Amber, its configuration material and requisites, the sources of your particular Amber app and  also `css/` `img/` and `views/` where flow finds your app's stylesheets, images and templates sources respectively.

## Scripts

There a a few of handy scripts we included in *flow* to automate some commonly needed tasks. 

1. `./cleanBuildFrontend`. Removes `node_modules`, `bower_components` and a couple of files that can be regenerated from your frontend code.
2. `./cleanBuildBackend`. Same idea but for the backend, it will remove, download a fresh Pharo and `fileIn` `FlowBuilder.st` loading all flow backend's parts.
3. `./cleanBuild`. It will clean and build both: frontend and backend.
4. `./startAll`. It will start services needed to run your flow-based application: open the Pharo image with UI, start the Amber server to save your Amber code, MongoDB and a free to use terminal.

## Development workflow

Once your backend is built, the typical development workflow in flow  apps goes like this:

1. Start things going to the `git/yourAppName/` directory 
2. Execute `./startAll`. That command will open some terminal tabs. One with Amber listening port 3000, another with the Pharo image listening port 3333, other starting MongoDB(\*).
3. Point your browser to `http://yourappname.dev`
4. Open Amber's IDE and start coding on your application.
5. Commit the packages you've changed.
6. Reload `http://yourappname.dev` if you want to double check that your recent code is there.
7. Discover new things, review, code more, repeat steps from 4 all you need until you're ready for staging or production (more on that below).

**Note**: `.startAll` is currently implemented for OS X, Linux and Windows. In OS X it assumes you have [installed MongoDB](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-os-x/) using [brew](http://brew.sh/). If you find a bug or want to improve any of the scripts you're welcome to do so (see the 'Contributing' section below).

## How-to build a backend?

The backend of a flow app is a Pharo image. Here is how you build one.

1. In your terminal, go to `app/`
2. Execute: `./cleanBuildBackend`
3. Wait for the Pharo image to load all the packages.
4. Once finishes open a workspace and execute: `App start`. That should make the image start listening for frontend's connections. You guessed it, you can also run `App stop` or `App restart`.

**Note**: if you like [sublime](http://www.sublimetext.com/) or dark themes, you might want to evaluate `FlowBuilder dawn`.

## Deploying

### Frontend

To put the frontend app in production (or staging) all you'll need is in the `public/` directory. Flow has a grunt task that continuously watches changes in the `frontend/` sources and rebuilds `public/` every time it perceives one.

### Backend
The backend is the Pharo image you were working on. The suggested strategy for setting a **prototypical backend** that you'll typically need for a first demo of your app goes like this:

1. Upload all (`git/yourAppName/`) to your server. 
2. Use `upstart` or your favorite supervisor script to start and stop the worker image as a service ([this](http://supervisord.org/) one is quite good).
3. Install [MongoDB](http://www.mongodb.org/) in that server.
4. Start the service of that worker image.
5. Setup [nginx](http://en.wikipedia.org/wiki/Nginx) so everything points where it should (we can't recommend Apache for flow since it doesn't officially support [WebSockets](http://en.wikipedia.org/wiki/WebSocket)).

**Note**: optionally, if your server has a GUI, you can manually open the worker image with the GUI and have an environment with the full living debugging and inspection power that Smalltalk gives to you.

Have in mind that setting up a **serious production backend** will require additional work and that varies quite a lot depending on the app's architecture and business demands, so is out of scope here. But to get you started, here you have the suggested strategy for setting that up: 

1. A [CI](http://en.wikipedia.org/wiki/Continuous_integration) (like [this one](http://jenkins-ci.org/)). 
2. A git server like [gitlab](https://about.gitlab.com/) or [this](https://github.com/) or [this](https://bitbucket.org/) or any other you like (should have the commit hook feature).
3. Setup hooks in your CI so the CI can react by building a new version of your app every time you commit code.
3. Setup your CI to do all the necessary moves for stopping things, installing the new version and starting things with the new version.

##Does it scale?

Please note that *flow* works in a way that allows you to scale the app horizontally using many Pharo worker images. 

So load balancing of the backend can be achieved in several worker images and/or servers. How to do that is out of scope here but you can be sure that *flow*'s design allows it.

## Contributing

This project is curated and we enjoy listening all kinds of new input and feedback. Contributions are gratefully received. We can't wait to see yours. 

We're organising efforts on this project in this open Trello board [here](https://trello.com/b/oQ17lPpV/flow). If you have ideas you'd like to see added to flow, please join that Trello board, make a new card in the 'Input / Feedback' column with a short title and using the card description to describe your idea (have in mind that framing it as a problem is the most effective way to do it). We'll pull things from there. Start a conversation and let's make it thrive together!

Also we're documenting in the wiki [here](https://github.com/sebastianconcept/flow/wiki)

____

MIT - License
