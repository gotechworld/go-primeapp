# Writing a very simple program that we can write a test for.


## Testing in GO

go test -v ./...

go test -cover .

go test -coverprofile=coverage.out

go tool cover -html=coverage.out

go test -v -run Test_isPrime

