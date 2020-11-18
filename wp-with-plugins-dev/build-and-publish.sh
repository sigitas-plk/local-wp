version=$1
image_name=wp-with-plugins-dev

if [[ -f .env ]]; then
     export $(xargs -a .env)
fi

if [[ -z $version ]]; then 
    echo "No version for this build provided. Can't proceed."
    exit 1
fi

if [[ -z $DHUB_USER ]]; then 
    echo "Docker Hub user is not net. Can't proceed."
    exit 1 
fi

docker login -u $DHUB_USER -p $DHUB_PASS
docker build -t $DHUB_USER/$image_name:$version -t $DHUB_USER/$image_name:latest .
docker push $DHUB_USER/$image_name