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

```
$ parallel_rspec -n 5 spec
5 processes for 5 specs, ~ 1 specs per process
..


Finished in 1.01 seconds (files took 1.2 seconds to load)
1 example, 0 failures


Finished in 1.02 seconds (files took 1.18 seconds to load)
1 example, 0 failures

.

Finished in 1.01 seconds (files took 1.16 seconds to load)
1 example, 0 failures

.

Finished in 1.02 seconds (files took 1.12 seconds to load)
1 example, 0 failures

.

Finished in 1.02 seconds (files took 1.1 seconds to load)
1 example, 0 failures


5 examples, 0 failures

Took 7 seconds
```

Any idea why the tests don't seem to actually be running in parallel?
