using db from '../db/schema';

service form @(path : '/browse') {
    entity AssetSectors as projection on db.AssetSectors;
    entity RegReason    as projection on db.RegReason;
    entity SubSector    as projection on db.SubSector;

    entity NewReg       as projection on db.NewReg actions {
                                            @sap.applicable.path : 'startEnabled'
        action start();
                                            @sap.applicable.path : 'closeEnabled'
        action close();
        action createversion();
        action upAssetDoc(asdoc :    String @title               : 'Provide documents related to Asset');
        action reportIncident(desc : String @title               : 'Enter the description', crit : Integer @title : 'Enter the Criticality(Scale from 1 to 5)', stat : String @title : 'Enter the Status', repby : String @title : 'Incident Reported by');
    //action uploadFirstEntityDoc(entitydoc : String @title : 'Provide Documents related to Entity');
    }

    entity Capacity     as projection on db.Capacity;
    entity EntType      as projection on db.EntType;
    entity IntAsset     as projection on db.IntAsset;
    entity Incident     as projection on db.Incident;
    //entity Incident as projection on db.Incident;
    action submitCiad();
    action uploadAssetDoc(assetName : String @title : 'Re-Enter Asset Name', docurl : String @title : 'Provide Documents related to Assets');
    action uploadContactDoc(empname : String @title : 'Re-Enter Employer Name', empurl : String @title : 'Provide Documents related to Employer');
    action uploadFirstEntityDoc(entityName : String @title : 'Re-Enter Entity Name', entitydoc : String @title : 'Provide Documents related to Entity');
    //action reportIncident(AssetName : NewReg:assetName, DateOfReporting : Date, incidentReason : String, criticality : Integer);
    action uploadExcelDoc(docurl : String);
//action createnewreg(id: NewReg:ID, assetName: NewReg:assetName, ename:  NewReg:ename , enname: FirstEntity:enname, dname: Declaration:Name);

//action sectorSelection(department: subSector:department) returns {sector:String};

//action reasonSelection(reason: String);
}
