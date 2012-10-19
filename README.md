Judge
=====
Will be an online judge that uses [ideone](http://ideone.com/), and it will be writed using common lisp

TODO
====
* Wrap [ideone API](http://ideone.com/api)
* Problems model and uploads
* Submissions model and processing
* Users (Admins, Judges, Contestants)
* Scoreboard
* Security

Judge uses <a href="http://ideone.com">Ideone API</a> &copy;
by <a href="http://sphere-research.com">Sphere Research Labs</a>

Heroku Config
=============
* Creates heroku app using the CLISP build pack

```$ heroku create -s cedar --buildpack http://github.com/jsmpereira/heroku-buildpack-cl.git```

* Add user-env-compile :S

```$ heroku labs:enable user-env-compile -a floating-thicket-8529```

* Add hunchentoot

```$ heroku config:add CL_WEBSERVER=hunchentoot```

* Add sbcl and enconding to avoid problems

```$ heroku config:add CL_IMPL=sbcl```

```$ heroku config:add LANG=en_US.UTF-8```

