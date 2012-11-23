# Workiq

Workiq adds [Sidekiq](http://github.com/mperham/sidekiq) middlewares to track a job worker status. Available status values are `:queued`, `:working`, `:complete`, and `:failed`

## Installation

Add this line to your application's Gemfile:

    gem 'workiq'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install workiq

## Usage
  * Define your Sidekiq workers as normal. Check the [Sidekiq home page](http://mperham.github.com/sidekiq/) for details.
  * Call the worker perform method

``` ruby
job_id = JobWorker.perform_async(*args)
```

OR

``` ruby
job_id = Model.delay.do_some_stuff(*args)
```
  * Poll job status (`:queued`, `:working`, `:complete`, and `:failed`)

``` ruby
status = Workiq.status(job_id)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
