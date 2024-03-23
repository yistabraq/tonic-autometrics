# gRPC service built with Tonic and Instrumented with Autometrics

## Local Observability Development



Easiest way to test the endpoints is with `grpcurl` (`brew install grpcurl`).

```bash
grpcurl -plaintext -import-path ./proto -proto job.proto -d '{"name": "Tonic"}' 'localhost:50051' job.JobRunner.SendJob
```

returns

```
{
  "message": "Hello Tonic!"
}
```

Getting the list of jobs (currently hardcoded to return one job)

```bash
grpcurl -plaintext -import-path ./proto -proto job.proto -d '{}' 'localhost:50051' job.JobRunner.ListJobs
```

returns:

```
{
  "job": [
    {
      "id": 1,
      "name": "test"
    }
  ]
}
```

If you now inspect the Autometrics explorer on `http://localhost:6789` you will see your metrics.
