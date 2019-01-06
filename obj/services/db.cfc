/**
 * DB
 *
 * @author Oliver
 * @date 22.04.16
 * This Component Loads the DB which  is installed / used
 **/
 component accessors=true output=false persistent=false  extends="obj.services.data" {

    $EasyDBs = {};

    function init(struct objects={} required=false) {
        for (var datasource in objects) {
            $EasyDBs[datasource] = createObject(objects[datasource]);
        }
    }

}