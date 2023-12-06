# CBD Lab 4

Sample workspace for completing the CBD Lab 4.

This workspace provides a docker-compose file to run the Neo4J Community server, and it's companions, in a dockerized enviromnment.

The [resources folder](resources) is automatically mounted to `/resources` in the container.
It contains some assets required to complete the Lab.

The container uses the Neo4J community edition, as such it only supports one database called 'neo4j'.
You can complete the lab using this database.
You will also have access to all the folders in the container for the import process.

Open Neo4J browser: [http://localhost:7474/browser/](http://localhost:7474/browser/)

Play with the movies example by running the command: `:play movie-graph`

Access to a CSV in the resources folder: `LOAD CSV WITH HEADERS FROM 'file:///resources/git_selection.csv' ...`

## Additional Notes

* Make sure you have previously installed Docker Desktop, or at least Docker Engine.
// TODO: Add Links
