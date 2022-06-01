# README

This app demonstrates a problem that the `0.9.x` branch of `active_model_serializers`
causes when using the streaming functions provided by `ActionController::Live`.

To test with this repo, first check out the code and then go into the project directory.

Then install all the gems:
```
bundle install
```

Then run the server by doing:
```
foreman start -f Procfile.dev
```

And then test the streaming response by doing:

```
curl http://localhost:3001/streaming_test/index
```

You'll see a five second delay and then `hello world` will be output
five times all at once.

```
hello world
hello world
hello world
hello world
hello world
```

Now stop the server by hitting Ctl-C in the terminal where foreman is
running and then open the `Gemfile` and comment out the line for the
`0.9.8` version of `active_model_serializers` and uncomment the line
for `0.10.0`.

Then:
```
bundle install
```

And restart the server:
```
foreman start -f Procfile.dev
```

And then test the streaming response again.

```
curl http://localhost:3001/streaming_test/index
```

This time you should see one of `hello world` output immediately,
and then a 1 second delay, then you'll see another one, and then
another delay, and so on, until there are five instances.


