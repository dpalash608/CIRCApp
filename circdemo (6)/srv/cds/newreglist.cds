using form as service from '../cat-service';

annotate service.NewReg with @(
    odata.draft.enabled : true,
    Capabilities : {
        SearchRestrictions.Searchable : true,
        Updatable : true,
        Insertable : true,
        Deletable : true,  
    },
    UI : {
        PresentationVariant  : {
            GroupBy : [
                state
            ],
            Total : [
                critcality
            ],
            Visualizations : [
                '@UI.LineItem'
            ]
        },
        DataPoint#Progress : {
            Value: count,
            TargetValue: 34,
            Visualization: #Progress
        },
        LineItem : { $value:[
            {
                $Type :'UI.DataField',
                Value : assetSector.sectorName,
                Label : 'Critical Infrastructure Asset Type',
                Criticality: critcality
            },
            {
                $Type :'UI.DataField',
                Value : state,
                Label : 'Asset Location',
                Criticality: critcality
            },
            {
                $Type :'UI.DataField',
                Value : ssector_sectors,
                Label : 'Sub Sector',
                Criticality: critcality
            },
            {
                $Type :'UI.DataField',
                Value : category_category,
                Label : 'Category of Registration',
                Criticality: critcality
            },
            {
                $Type : 'UI.DataField',
                Value : status,
                Label : 'Submission Status',
                Criticality: critcality
            },
            /*{
                $Type : 'UI.DataFieldForAnnotation',
                Target : '@UI.DataPoint#Progress',
                Label : 'Progress Information',
                Criticality: count
            },*/
            {
                $Type : 'UI.DataFieldForAction',
                Label : 'Report Incident',
                Action : 'form.reportIncident'
                //Action :'form.EntityContainer/reportIncident'
            },
            {
                $Type: 'UI.DataFieldForAction',
                Label : 'Upload Assets Data',
                Action: 'form.EntityContainer/uploadExcelDoc'
            },
            {
                $Type : 'UI.DataFieldForAction',
                Action : 'form.start',
                Label : 'Submit for Bot Call',
            },
        ]}
    }
);
