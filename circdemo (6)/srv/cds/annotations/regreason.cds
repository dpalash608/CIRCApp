annotate db.RegReasons with @(
    Common.ValueListMapping:{
        Label:'Resgistration Reason',
        CollectionPath : 'RegReason',
        Parameters : [
            {
                $Type: 'Common.ValueListParameterInOut',
                ValueListProperty : 'reason',
                LocalDataProperty : regReason_reason
            },
            {
                $Type:'Common.ValueListParameterDisplayOnly',
                ValueListProperty :'ID' 
            }
        ]
    },
    Common.ValueListWithFixedValues
);