namespace db;

using {
    managed,
    cuid
} from '@sap/cds/common';

type Capacities : Association to one Capacity;

entity Capacity {
        ID       : Integer enum {
            DirectInterestHolder  = 11;
            AgentOrRepresentative = 12;
        };
    key category : String;
}

type Statuses : Association to one Status;

entity Status {
        ID     : Integer enum {
            NewlyCreated = 10;
            InProgress   = 11;
            Completed    = 12;
        };
    key status : String;
}

/*entity Incident {
    key ID          : UUID;
        cric        : Integer default 0;
        description : String @mandatory;
        status      : String @mandatory;
        reportedBy  : String @mandatory;
        asset       : Association to NewReg;
}*/

entity NewReg : managed {
    key ID                   : String            @title : 'Enter Unique Id for a new registration';
        count                : Integer default 0;
        //createdDate : Timestamp @cds.on.update: $now;
        incidents            : Composition of many Incident
                                   on incidents.asset = $self;
        //Incident Reporting
        critcality           : Integer default 5;
        status               : String default 'In Progress';
        version              : Integer default 0 @readonly;
        //CIAD
        assetSector          : AssetSector       @mandatory;
        assetName            : String            @mandatory;
        regReason            : RegReasons        @mandatory;
        ssector              : SubSectors        @mandatory;
        durl                 : String            @readonly;
        //RegEntity
        category             : Capacities        @mandatory;
        title                : String(4)         @mandatory;
        fname                : String            @mandatory;
        mname                : String;
        surname              : String            @mandatory;
        ename                : String            @mandatory; //Use for Declaration
        addr                 : String            @mandatory;
        city                 : String            @mandatory;
        country              : String            @mandatory;
        state                : String            @mandatory;
        postcode             : Integer           @mandatory;
        designation          : String            @mandatory;
        email                : String            @mandatory;
        ptno                 : Integer           @mandatory;
        stno                 : Integer           @mandatory;
        cdoc                 : String            @readonly;
        //First Entity
        enname               : String            @mandatory;
        entType              : EntTypes          @mandatory;
        intType              : IntAssets         @mandatory;
        fe_country           : String            @mandatory;
        regno                : String            @mandatory;
        fe_addr              : String            @mandatory;
        fe_city              : String            @mandatory;
        fe_state             : String            @mandatory;
        zipcode              : Integer           @mandatory;
        intrest              : Integer default 0;
        entdoc               : String            @readonly;
        //Declaration
        info                 : String;
        dec                  : String            @readonly;
        date                 : Date              @mandatory;
        virtual startEnabled : Boolean;
        virtual closeEnabled : Boolean;
        //Secondary Contact
        sectitle             : String(4);
        secfname             : String            @mandatory;
        secmname             : String;
        secsurname           : String            @mandatory;
        secename             : String            @mandatory;
        secaddr              : String            @mandatory;
        seccity              : String            @mandatory;
        seccountry           : String            @mandatory;
        secstate             : String            @mandatory;
        secpostcode          : Integer           @mandatory;
        secdesignation       : String            @mandatory;
        secemail             : String            @mandatory;
        secptno              : Integer           @mandatory;
        secstno              : Integer           @mandatory;
}

@cds.autoexpose
entity Incident {
    key ID          : UUID;
        cric        : Integer default 0;
        description : String @mandatory;
        status      : String @mandatory;
        reportedBy  : String @mandatory;
        asset       : Association to NewReg;
}


type AssetSector : Association to one AssetSectors;

entity AssetSectors {
        ID         : Integer enum {
            Communications              = 10;
            DataStorageOrProcessing     = 11;
            DefenceIndustry             = 12;
            Energy                      = 13;
            FinancialServicesAndMarkets = 14;
            FoodandGrocery              = 15;
            HealthCareAndMedical        = 16;
            HigherEducationAndResearch  = 17;
            SpaceTechnology             = 18;
            Transport                   = 19;
            WaterAndSewage              = 20;
        };
    key sectorName : String;
        department : String;
}

type RegReasons : Association to one RegReason;

entity RegReason {
        ID     : Integer enum {
            NewAccquisition = 1;
            ExistingHolder  = 2;
            Other           = 3;
        };
    key reason : String;
//reasons : Association to many Ciad on reasons.regReason=$self;
}

type SubSectors : Association to one SubSector;

entity SubSector {
        ID      : Integer enum {
            BroadCastingAsset                    = 1001;
            DomainNameSystem                     = 1002;
            TelecommunicationsAsset              = 1003;
            CriticalDataStorageOrProcessingAsset = 1101;
            CritcialDefenceIndustryAsset         = 1201;
            ElectricityGeneration                = 1301;
            ElectricityTransmission              = 1302;
            ElectricityInterconnectors           = 1303;
            ElectricityDistribution              = 1304;
            LiquidFuelPipeline                   = 1305;
            LiquidFuelRefinery                   = 1306;
            LiquidFuelStorage                    = 1307;
            GasProcessing                        = 1308;
            GasStorage                           = 1309;
            GasDistribution                      = 1310;
            GasTransmission                      = 1311;
            EnergyMarketOperator                 = 1312;
            BankingAsset                         = 1401;
            FinancialMarketInfrastructure        = 1402;
            CleaningAndSettlementFacility        = 1403;
            SignificantFinancialBenchmark        = 1404;
            DerivativeTradeRepository            = 1405;
            PaymentSystem                        = 1406;
            Insurance                            = 1407;
            LifeInsurance                        = 1408;
            HealthInsurance                      = 1409;
            Superannuation                       = 1410;
            FoodandGrocery                       = 1501;
            Hospital                             = 1601;
            Education                            = 1701;
            Aviation                             = 1901;
            FreightInfrastructure                = 1902;
            FreightServices                      = 1903;
            Port                                 = 1904;
            PublicTransport                      = 1905;
            WaterUtility                         = 2001;
            WaterDesalination                    = 2002;
            BulkWaterSupplier                    = 2003;
            Others                               = 0000;
        };
    key sectors : String;
}


type EntTypes : Association to one EntType;

entity EntType {
        ID    : Integer enum {
            IndividualPerson   = 110;
            BodyCorporate      = 111;
            BodyPublic         = 112;
            Trust              = 113;
            SuperAnnuationFund = 114;
            Partnership        = 115;
            ForiegnCompany     = 116;
        };
    key types : String;
}

type IntAssets : Association to one IntAsset;

entity IntAsset {
        ID      : String enum {
            Legal     = 'A1';
            Equitable = 'A2';
            Licence   = 'A3';
            Other     = 'A4';
        };
    key inttype : String;
}
