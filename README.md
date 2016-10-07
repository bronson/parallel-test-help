## Parallel Test Help

### Issue Demonstrator

This repo demonstrates my difficulty getting some rspec specs to run in parallel.

```
git clone parallel-test-help
cd parallel-test-help
bundle install
```

Each spec takes one second, so I would expect all tests run in parallel
to take just over one second.

Unfortunately, the test suite always takes more than five seconds to complete:

```sh
$ PARALLEL_TEST_PROCESSORS=10 parallel_rspec -n 10 spec
1 processes for 1 specs, ~ 1 specs per process
.....

Finished in 5.02 seconds (files took 0.08717 seconds to load)
5 examples, 0 failures
```

Any idea why the tests aren't running in parallel?
