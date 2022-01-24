using form as service from '../cat-service';

annotate db.NewReg with @fiori.draft.enabled;
annotate form.Incident with @(UI: {
    LineItem : {
        ![@UI.Criticality] : cric,
        $value : [
            {
                $Type :'UI.DataField',
                Label : 'Incident Description',
                Value : description,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Label : 'Incident Status',
                Value : status,
                ![@UI.Importance] : #High
            },
            {
                $Type:'UI.DataField',
                Label : 'Incident Reported By',
                Value: reportedBy,
                ![@UI.Importance] : #High
            },
            {
                $Type :'UI.DataField',
                Label : 'Incident Criticality',
                Value : cric,
                ![@UI.Importance] : #High
            },        
        ]
    }
});
annotate service.NewReg with @(
    UI:{
        HeaderInfo  : {
            TypeName : 'New Asset Registration',
            TypeNamePlural : 'New Asset Registrations',
            Title : {$Type:'UI.DataField',Value : assetSector_sectorName,Label : 'Department'}
        },

        HeaderFacets  : [
            {$Type : 'UI.ReferenceFacet', Target: '@UI.FieldGroup#HeaderFacetOne'}
        ],

        Identification  : [
            {
                $Type : 'UI.DataFieldForAction',
                Label : 'Submit for Approval',
                Action : 'form.EntityContainer/submitCiad'
            },
            {
                $Type : 'UI.DataFieldForAction',
                Label : 'Report Incident',
                Action : 'form.reportIncident'
                //Action : 'form.EntityContainer/reportIncident'
            },
            {
                $Type : 'UI.DataFieldForAction',
                Label : 'Audit Log',
                Action : 'form.createversion'
            },
            {
                $Type : 'UI.DataFieldForAction',
                Label : 'Submit For Bot Call',
                Action : 'form.start'
            }
        ],

        Facets  : [
            //First Page --- CIAD
            {
                $Type:'UI.CollectionFacet',
                Label : 'Critical Infrastructure Asset Details',
                ID : 'facetOne',
                Facets : [
                    {
                        $Type : 'UI.ReferenceFacet',
                        ID : 'SubSelectAsset',
                        Target : '@UI.FieldGroup#AssetInfo'
                    }
                ]
            },
            //Second Page -- Details
            {
                $Type:'UI.CollectionFacet',
                Label : 'My Details',
                ID : 'facetTwo',
                Facets : [
                    {
                        $Type :'UI.CollectionFacet',
                        Label :'General Details',
                        ID : 'facetTwoOne',
                        Facets : [
                            {
                                $Type : 'UI.ReferenceFacet',
                                ID : 'SubSelectionPrimaryInfo',
                                Target : '@UI.FieldGroup#PrimeContact'
                            }
                        ]
                    },
                    {
                        $Type: 'UI.CollectionFacet',
                        Label : 'Details of Employer',
                        ID : 'facetTwoTwo',
                        Facets : [
                            {
                                $Type : 'UI.ReferenceFacet',
                                ID : 'SubSelectDetailsofEmployer',
                                Target : '@UI.FieldGroup#EmployerDetails'
                            }
                        ]  
                    },
                    {
                        $Type: 'UI.CollectionFacet',
                        Label : 'Contact Info of Registrant',
                        ID : 'facetTwoThree',
                        Facets : [
                            {
                                $Type : 'UI.ReferenceFacet',
                                ID : 'SubSelectcontactInfo',
                                Target : '@UI.FieldGroup#ContactInfo'
                            }
                        ]  
                    },
                    {
                        $Type: 'UI.CollectionFacet',
                        Label : 'Details of Secondary Contact',
                        ID : 'facetTwoFour',
                        Facets : [
                            {
                                $Type : 'UI.ReferenceFacet',
                                ID : 'SubSelectSecondaryContact',
                                Target : '@UI.FieldGroup#SecondaryContact'
                            }
                        ]  
                    },
                    {
                        $Type: 'UI.CollectionFacet',
                        Label : 'Details of Secondary Employer',
                        ID : 'facetTwoFive',
                        Facets : [
                            {
                                $Type : 'UI.ReferenceFacet',
                                ID : 'SubSelectSecondaryEmployer',
                                Target : '@UI.FieldGroup#SecondaryEmployer'
                            }
                        ]  
                    }
                ]
            },
            //Third Page --- First Entity
            {
                $Type:'UI.CollectionFacet',
                Label : 'First Entity',
                ID : 'facetThree',
                Facets  : [
                    {
                        $Type :'UI.CollectionFacet',
                        Label :'Details of First Entity',
                        ID : 'facetThreeOne',
                        Facets : [
                            {
                                $Type : 'UI.ReferenceFacet',
                                ID : 'SubSelectionFirstEntityInfo',
                                Target : '@UI.FieldGroup#FirstEntityDetails'
                            }
                        ]
                    },
                    {
                        $Type :'UI.CollectionFacet',
                        Label :'Address of Head Office/Place of Business',
                        ID : 'facetThreeTwo',
                        Facets : [
                            {
                                $Type : 'UI.ReferenceFacet',
                                ID : 'SubSelectionAddrPOB',
                                Target : '@UI.FieldGroup#AddrPOB'
                            }
                        ]
                    }
                ]
            },
            //Fourth Page --- Declaration
            {
                $Type : 'UI.CollectionFacet',
                Label : 'Declaration',
                ID : 'FacetFive',
                Facets : [
                    {
                        $Type : 'UI.CollectionFacet',
                        Label : 'Further Information',
                        ID : 'facetFiveOne',
                        Facets : [
                            {
                                $Type : 'UI.ReferenceFacet',
                                ID : 'FurtherInfo',
                                Target : '@UI.FieldGroup#FurtherInfo'
                            }
                        ]
                    },
                    {
                        $Type : 'UI.CollectionFacet',
                        Label : 'Declaration',
                        ID : 'facetFiveTwo',
                        Facets : [
                            {
                                $Type : 'UI.ReferenceFacet',
                                ID : 'declaration',
                                Target : '@UI.FieldGroup#declaration'
                            }
                        ]
                    }
                ]
            },
            /*Fifth Page --- Incident Reporting
            {
                $Type : 'UI.CollectionFacet',
                Label : 'Incident Reports',
                ID : 'FacetSix',
                Facets : [
                    {
                        $Type : 'UI.ReferenceFacet',
                        ID : 'ReportIncidentsFacet',
                        Target : '@UI.FieldGroup#ReportIncidentFacet'
                    }
                ]
            },*/
            //Sixth Page --- Incidents Example
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Incident',
                Target : 'incidents/@UI.LineItem' 
            }
        ],

        //Header Info
        FieldGroup#HeaderFacetOne : {
            Data:[
                {$Type:'UI.DataField',Value:assetSector_sectorName, Label: 'Critical Infrastructure Type'},
                {$Type:'UI.DataField',Value:modifiedAt, Label : 'Last Modified Date'},
                {$Type:'UI.DataField',Value:createdAt, Label : 'Created At'},
                {$Type:'UI.DataField',Value:version, Label : 'Version'}
            ]
        },

        //CIAD Page Object
        FieldGroup#AssetInfo : {
            Data :[
                {$Type : 'UI.DataField',Value:assetSector_sectorName, Label: 'Main Sector'},
                {$Type : 'UI.DataField', Value:assetName, Label: 'Asset Name'},
                {$Type : 'UI.DataField', Value:regReason_reason, Label: 'Registration Reason'},
                {$Type : 'UI.DataFieldForAction', Label:'Add Details for Asset Details', Action: 'form.EntityContainer/uploadAssetDoc'},
                {$Type: 'UI.DataField', Value:ssector_sectors, Label : 'Sub Sector'},
                {$Type: 'UI.DataField', Value:durl, Label : 'Attached Documents for the Assets'},                
                //{$Type: 'UI.DataFieldForAction', Label: 'Add Details for Asset Details', Action: 'form.upAssetDoc'},
            ]
        },

        //Details Page Object
        FieldGroup#PrimeContact : {
            Data : [
                {$Type: 'UI.DataField', Value:category_category, Label:'Category of Registration'},
                {$Type: 'UI.DataField', Value:title, Label:'Title'},
                {$Type: 'UI.DataField', Value:fname, Label:'First Name'},
                {$Type: 'UI.DataField', Value:mname, Label:'Middle Name'},
                {$Type: 'UI.DataField', Value:surname, Label:'Surname Or Family Name'},
            ]
        },

        FieldGroup#EmployerDetails : {
            Data : [
                {$Type: 'UI.DataField', Value:ename, Label:'Employers Name'},
                {$Type: 'UI.DataField', Value:addr, Label:'Street Address'},
                {$Type: 'UI.DataField', Value:city, Label:'City'},
                {$Type: 'UI.DataField', Value:country, Label:'Country'},
                {$Type: 'UI.DataField', Value:state, Label:'State or Territory'},
                {$Type: 'UI.DataField', Value:postcode, Label:'PostCode or Zipcode'},
            ]
        },

        FieldGroup#ContactInfo : {
            Data : [
                {$Type: 'UI.DataField', Value:designation, Label:'Your Job title/position'},
                {$Type: 'UI.DataField', Value:email, Label:'Your Email address'},
                {$Type: 'UI.DataField', Value:ptno, Label:'Primary Telephone Number'},
                {$Type: 'UI.DataField', Value:stno, Label:'Secondary Telephone Number'},
                {$Type: 'UI.DataField', Value:cdoc, Label : 'Attached Documents for proof of identity'},
                {$Type: 'UI.DataFieldForAction', Label : 'My Details Attachments', Action:'form.EntityContainer/uploadContactDoc'},
            ]
        },

        FieldGroup#SecondaryContact :{
            Data:[
                {$Type: 'UI.DataField', Value:sectitle, Label:'Title'},
                {$Type: 'UI.DataField', Value:secfname, Label:'First Name'},
                {$Type: 'UI.DataField', Value:secmname, Label:'Middle Name'},
                {$Type: 'UI.DataField', Value:secsurname, Label:'Surname Or Family Name'},
            ]
        },

        FieldGroup#SecondaryEmployer : {
            Data:[
                {$Type: 'UI.DataField', Value:secename, Label:'Employers Name'},
                {$Type: 'UI.DataField', Value:secaddr, Label:'Street Address'},
                {$Type: 'UI.DataField', Value:seccity, Label:'City'},
                {$Type: 'UI.DataField', Value:seccountry, Label:'Country'},
                {$Type: 'UI.DataField', Value:secstate, Label:'State or Territory'},
                {$Type: 'UI.DataField', Value:secpostcode, Label:'PostCode or Zipcode'},
                {$Type: 'UI.DataField', Value:secdesignation, Label:'Their Job title/position'},
                {$Type: 'UI.DataField', Value:secemail, Label:'Their Email address'},
                {$Type: 'UI.DataField', Value:secptno, Label:'Their Primary Telephone Number'},
                {$Type: 'UI.DataField', Value:secstno, Label:'Their Secondary Telephone Number'},
            ]
        },

        //First Entity Declaration Page
        FieldGroup#FirstEntityDetails : {
            Data:[
                {$Type: 'UI.DataField', Value:enname, Label:'Legal name of Direct Interest Holder'},
                {$Type: 'UI.DataField', Value:entType_types, Label:'Type of Entity'},
                {$Type: 'UI.DataField', Value:intType_inttype, Label:'Type of interest in Asset'},
                {$Type: 'UI.DataField', Value:fe_country, Label:'Country of Incorporation or Creation'},
                {$Type: 'UI.DataField', Value:regno, Label:'Business Registration Number'},
            ]
        },

        FieldGroup#AddrPOB : {
             Data:[
                {$Type: 'UI.DataField', Value:fe_addr, Label:'Street Address'},
                {$Type: 'UI.DataField', Value:fe_city, Label:'City or Town'},
                {$Type: 'UI.DataField', Value:fe_state, Label:'State or Territory'},
                {$Type: 'UI.DataField', Value:zipcode, Label:'Zipcode'},
                {$Type: 'UI.DataField', Value:intrest, Label:'Interest in asset'},
                {$Type: 'UI.DataField', Value:entdoc, Label: 'Attached documents for First Entity Proof'},
                {$Type: 'UI.DataFieldForAction', Label : 'Documents supporting your registration', Action: 'form.EntityContainer/uploadFirstEntityDoc'},
                //{$Type: 'UI.DataFieldForAction', Label : 'Documents supporting your registration', Action: 'form.uploadFirstEntityDoc'},
            ]
        },

        FieldGroup#FurtherInfo  : {
            Data:[
                {$Type: 'UI.DataField', Value:info, Label : 'Provide any further information here that you believe is relevant and may assist the Centre'},
            ]
        },


        //Declaration Tab
        FieldGroup#declaration : {
            Data:[
                {$Type: 'UI.DataField', Value:dec, Label : 'Declaration Terms'},
                {$Type: 'UI.DataField', Value:ename, Label : 'Name'},
                {$Type: 'UI.DataField', Value:date, Label : 'Date'},
            ]
        },


        /*Incident Reporting
        FieldGroup#ReportIncidentFacet: {
            Data :[
                {$Type: 'UI.DataField', Value:in_description, Label: 'Incident Description'},
                {$Type: 'UI.DataField', Value:in_reportedBy, Label: 'Incident Reported By'},
                {$Type: 'UI.DataField', Value:in_status, Label: 'Incident Status'},
                {$Type: 'UI.DataField', Value:critcality, Label: 'Criticality'}
            ]            
        },
        /*FieldGroup#UploadDocument : {
            Data:[
                {$Type : 'UI.DataFieldForAction', Label:'Add Details for Asset Details'},
                {$Type: 'UI.DataFieldForAction', Label : 'My Details Attachments'},
                {$Type: 'UI.DataFieldForAction', Label : 'Documents supporting your registration'},
            ]
        },*/
    }
);