# Hands-on Test

## Test the application
### Api key
```
key=pRMzGzpLhT6bpOsNuqL8u7lXL4IXqcet8ft1jQBF
```
### Get Token
```
curl -X POST \
-H "Content-Type: application/json" \
-d '{"username": "juan","password": "adminpass"}' \
https://75g3cizx6hckivm3zzut7cotdu0qwequ.lambda-url.us-east-2.on.aws/
```
Expected response
```
{
"accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Imp1YW4iLCJpYXQiOjE2NzkyNTgxNDUsImV4cCI6MTY3OTI1OTM0NX0.Sdgjsv8dQ0UJZzqKmor8GENCchoEXgTtUusDocarZGA"
}
```
### Test api
Don't forget replace the token.
```
curl -X POST \
-H "Content-Type: application/json" \
-H "x-api-key: pRMzGzpLhT6bpOsNuqL8u7lXL4IXqcet8ft1jQBF" \
-H "Authorization: Bearer <put_the_token_here>" \
-d '{"message": "This is a test","to": "Juan Perez","from": "Rita Asturia","timeToLiveSec": 45}' \
https://2d5tuc13kb.execute-api.us-east-2.amazonaws.com/dev/devops
```
Expected response
```
{"message": "This is a test","to": "Juanito Perez","from": "Rita Asturia","timeToLiveSec": 45}
```
# Details
## Repositories
- api: https://github.com/personal-demo-01/demo-api
- infrastructure: https://github.com/personal-demo-01/demo-infrastructure
- terraform modules: https://github.com/personal-demo-01/demo-terraform-modules
## Pipelines
### api
#### Build and test
Run the building and testing process. In addition, it runs the SonarCloud scan (static code analysis).
- Runs on every push to the `main` branch and all branch that starts with `feature/`
- Runs on every push requests.
#### Deployment-DEV
Test, build the container image, publish the container to the ECR, and deploy the application into the ECS service. This service runs over two Container Instances (nodes) and the auto-scaling feature is enabled.
- Runs on every push to the `main` branch.
- Manually. Just define the `revision` number.
> The revision number represent the ECS task-definition revision number. Every time the application is deployed, this number increases by one.

### infrastructure
#### infrastructure-dev
Deploy and update the infrastructure
- Runs on every push to the `main` branch.
## Infrastructure
| Resource | Description |Manage by|
|--|--|--|
| ECR |Constainer registry  |Terraform|
|ECS|Container service. The cluster counts with two Registered Container Instances (nodes) in two different availability zones.|Terraform|
|ALB|Application Load balancer|Terraform|
|Network|VCP, subnets,internet gateway, routes, and security groups|Terraform|
|Api Gateway|Rest API gateway|Terraform|
|Identity Provider|OpenID Connect. Allow GitHub runs to get authenticated in AWS.|Deployed manually|
|S3|Bucket to store the Terraform's states|Deployed manually|
|Lambda Function|The Auth service to get the token is deployed here.|Deployed manually|


