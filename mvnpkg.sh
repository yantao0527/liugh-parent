docker run --rm --name maven \
    -v maven-repo:/root/.m2 \
    -v $PWD:/usr/src/mymaven \
    -w //usr/src/mymaven \
    maven:3.6-jdk-8 \
    mvn package

