annotate db.EntTypes with @(
    Common.ValueListMapping:{
        Label:'Type of Entity',
        CollectionPath : 'EntType',
        Parameters : [
            {
                $Type: 'Common.ValueListParameterInOut',
                ValueListProperty : 'types',
                LocalDataProperty : entType_types
            },
            {
                $Type:'Common.ValueListParameterDisplayOnly',
                ValueListProperty :'ID' 
            }
        ]
    },
    Common.ValueListWithFixedValues
);