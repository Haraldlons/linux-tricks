# Jenkins Notes

## How to add a new repo to Jenkins.
1 Add .travis.yml and add github/docker credentials
1.1 Copy .travis.yml from r18dv_msgs
1.2 [Add Docker Credentials](https://sebest.github.io/post/using-travis-ci-to-build-docker-images/)
```bash
travis encrypt -r github-username/repo DOCKER_EMAIL=haraldlons@gmail.com
travis encrypt -r github-username/repo DOCKER_USER=haraldlons
travis encrypt -r github-username/repo DOCKER_PASS=password
```
Add these credentials to the .travis.yml file with env: global: -secure:<key>
1.3 [Make new Github Key for pushing and merging branches](https://chrisdown.name/2015/09/27/auto-merging-successful-builds-from-travis-ci.html)
1.4 Add the key to .travis.yml
```bash
travis encrypt -r user/repo 'GITHUB_SECRET_TOKEN=<your token>'
```
1.5