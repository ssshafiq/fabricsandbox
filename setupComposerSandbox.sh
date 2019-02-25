export COMPOSER_CARD=admin@med-net
export COMPOSER_NAMESPACES=never
export COMPOSER_AUTHENTICATION=true
export COMPOSER_MULTIUSER=true
export COMPOSER_PROVIDERS='{
  "jwt": {
    "provider": "jwt",
    "module": "/home/composer/node_modules/custom-jwt.js",
    "secretOrKey": "gSi4WmttWuvy2ewoTGooigPwSDoxwZOy",
    "authScheme": "saml",
    "successRedirect": "/",
    "failureRedirect": "/"
  }
}'
export COMPOSER_DATASOURCES='{
    "db": {
        "name": "db",
        "connector": "mongodb",
        "host": "mongo"
    }
}'


docker run -d --name mongo --network composer_default -p 27017:27017 mongo


docker run     -d     -e COMPOSER_CARD=${COMPOSER_CARD}     -e COMPOSER_NAMESPACES=${COMPOSER_NAMESPACES}           -v ~/.composer:/home/composer/.composer     --name unAuth     --network composer_default     -p 3000:3000     faisalleo8/composer-rest-server:0.20.7.1



docker run     -d     -e COMPOSER_CARD=${COMPOSER_CARD}     -e COMPOSER_NAMESPACES=${COMPOSER_NAMESPACES}     -e COMPOSER_AUTHENTICATION=${COMPOSER_AUTHENTICATION}     -e COMPOSER_MULTIUSER=${COMPOSER_MULTIUSER}     -e COMPOSER_PROVIDERS="${COMPOSER_PROVIDERS}"     -e COMPOSER_DATASOURCES="${COMPOSER_DATASOURCES}"     -v ~/.composer:/home/composer/.composer     --name auth     --network composer_default     -p 3001:3000     faisalleo8/composer-rest-server:0.20.7.1





