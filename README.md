[![Quality gate](https://sonarcloud.io/api/project_badges/quality_gate?project=gotechworld_go-primeapp)](https://sonarcloud.io/summary/new_code?id=gotechworld_go-primeapp)

&nbsp;

# Writing a very simple program that we can write a test for.


## Testing in GO

go test -v ./...

go test -cover .

go test -coverprofile=coverage.out

go tool cover -html=coverage.out

go test -v -run Test_isPrime

