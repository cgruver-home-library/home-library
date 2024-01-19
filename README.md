# home-library

```bash
quarkus create app --maven --java=21 --no-wrapper --no-code --package-name=org.labmonkeys.home_library.stargate_api --extensions="quarkus-openapi-generator,quarkus-rest-client-reactive-jackson" org.labmonkeys.home_library:stargate_api:0.1
mkdir -p ./stargate_api/src/main/openapi
cp ./home-library/stargate-doc-openapi.json ./stargate_api/src/main/openapi/stargate.json
echo "quarkus.openapi-generator.codegen.spec.stargate_json.base-package=org.labmonkeys.home_library.stargate_api" >> ./stargate_api/src/main/resources/application.properties
echo "quarkus.openapi-generator.codegen.validateSpec=false" >> ./stargate_api/src/main/resources/application.properties
cd ./stargate_api
mvn compile

```
