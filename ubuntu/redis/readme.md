### Description
This image is based on the official Redis image and uses redis.conf file. The default redis.conf file is modified to set the password. The password is set using the environment variable `redis_password`. The default password is `SetSomeP@sswordHere`.

To build the image, run the following command:
```bash
docker build . -t my-redis
```  
To run the image, run the following command:
```bash
docker run -d -p 6379:6379 --env="redis_password=SetSomeP@sswordHere" --name my-redis my-redis
```
