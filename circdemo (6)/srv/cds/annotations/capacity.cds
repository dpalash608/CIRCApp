annotate db.Capacities with @(
    Common.ValueListMapping:{
        Label:'Category of Registration',
        CollectionPath : 'Capacity',
        Parameters : [
            {
                $Type: 'Common.ValueListParameterInOut',
                ValueListProperty : 'category',
                LocalDataProperty : category_category
            },
            {
                $Type:'Common.ValueListParameterDisplayOnly',
                ValueListProperty :'ID' 
            }
        ]
    },
    Common.ValueListWithFixedValues
);