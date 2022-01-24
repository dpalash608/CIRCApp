annotate db.AssetSector with @(
    Common.ValueListMapping:{
        Label:'Main Sector',
        CollectionPath : 'AssetSectors',
        Parameters : [
            {
                $Type: 'Common.ValueListParameterInOut',
                ValueListProperty : 'sectorName',
                LocalDataProperty : assetSector_sectorName
            },
            {
                $Type:'Common.ValueListParameterDisplayOnly',
                ValueListProperty :'ID' 
            }
        ]
    },
    Common.ValueListWithFixedValues
);