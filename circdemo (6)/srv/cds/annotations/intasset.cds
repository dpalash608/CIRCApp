annotate db.IntAssets with @(
    Common.ValueListMapping:{
        Label:'Type of Entity',
        CollectionPath : 'IntAsset',
        Parameters : [
            {
                $Type: 'Common.ValueListParameterInOut',
                ValueListProperty : 'inttype',
                LocalDataProperty : intType_inttype
            },
            {
                $Type:'Common.ValueListParameterDisplayOnly',
                ValueListProperty :'ID'
            }
        ]
    },
    Common.ValueListWithFixedValues
);