annotate db.Statuses with @(
    Common.ValueListMapping:{
        Label:'Status of Incident',
        CollectionPath: 'Status',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                ValueListProperty : 'status',
                LocalDataProperty : status_status
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'ID'
            }
        ]
    },
    Common.ValueListWithFixedValues
);