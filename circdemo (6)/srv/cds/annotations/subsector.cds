annotate db.SubSectors with @(
    Common.ValueListMapping:{
        Label:'Sub Sector',
        CollectionPath : 'SubSector',
        Parameters : [
            {
                $Type: 'Common.ValueListParameterInOut',
                ValueListProperty : 'sectors',
                LocalDataProperty : ssector_sectors
            },
            {
                $Type:'Common.ValueListParameterDisplayOnly',
                ValueListProperty :'ID' 
            }
        ]
    },
    Common.ValueListWithFixedValues
);