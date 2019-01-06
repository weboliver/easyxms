/**
 * general Data Component
 *
 * @author Oliver
 * @date 22.04.16
 **/
component accessors=true output=false extends="com.easyxms.services.db" {

    numeric function addAtom(required string title, required numeric typeID, string short = "", any text = "", numeric creator=1) {

        var oAtomEntity =  EntityNew("ATOMS");

        oAtomEntity.setAtom_Title(title);
        oAtomEntity.setAtom_Type_KEY(JavaCast("int", typeID));
        oAtomEntity.setAtom_Short(short);
        oAtomEntity.setAtom_Text(text);
        oAtomEntity.setAtom_CREATED_BY(creator);
        oAtomEntity.setAtom_CREATED(now());
        EntitySave(oAtomEntity);
        return oAtomEntity.getAtom_id();

    }

    boolean function existsAtom(required string title, required numeric typeID) {

    	var strctExample = structNew();
    	strctExample["ATOM_TITLE"] = title;
    	strctExample["ATOM_Type_KEY"] = typeID;
    	var oAtom = entityLoad("ATOMS", strctExample);
    	return (ArrayLen(oAtom) gte 1);
    }

    function addUniqueElement(required string EntityType, required struct strctData, required numeric creator, numeric typeID = 0, required struct AtomData) {

    	if (not existsAtom(AtomData["title"], typeID)) {
    		addElement(argumentCollection=arguments);
    	}
    }

    function addElement(required string EntityType, required struct strctData, required numeric creator, numeric typeID = 0, required struct AtomData) {
        var nIdentityId = addAtom(AtomData["title"], typeID, AtomData["short"], AtomData["text"], creator);
		var oEntity = EntityNew(EntityType);
        var sEvaluate = "";
        for (var name in strctData) {
            sEvaluate = "oEntity.set#name#(strctData[name])";
            Evaluate(sEvaluate);

        }
        sEvaluate = "oEntity.set#left(EntityType, 4)#_ID(nIdentityId)";
        Evaluate(sEvaluate);
        sEvaluate = "oEntity.set#left(EntityType, 4)#_Created_by(creator)";
        Evaluate(sEvaluate);
		EntitySave(oEntity);
    }

    function existsElement(numeric ID, string Type) {

    }

    function updateElementbyExample(struct strctExample, string Type, struct strctData) {

        var oEntity = entityLoad(Type, strctExample);
        if (ArrayLen(oEntity) is 1)
        {
            for (var item in strctData) {
                 evaluate("oEntity.set#Type#_#item#(#strctData[item]#);");
            }

            EntitySave(oEntity);
            return true;
        }
        return false;

    }

    function updateElement(numeric ID, string Type, struct strctData) {


    }

    function deleteElement(numeric ID, string Type) {


    }

    function getElements(string Type, struct strctFilter) {


    }

}