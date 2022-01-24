const cds = require('@sap/cds');
//const {Ciad} = cds.entities('db');
//const {RegEntity} = cds.entities('db');
//const {FirstEntity} = cds.entities('db');
//const {Declaration} = cds.entities('db');
const {NewReg} = cds.entities('db');
const {Incident} = cds.entities('db');

class form extends cds.ApplicationService{ init(){


    this.after('READ', 'NewReg', (each) => {
        if(each.count == 1)
        {
            each.startEnabled = true
        }
        if(each.count == 0)
        {
            each.startEnabled = false
        }
    })

    this.on('start', async req =>{
        const id = req.params[0]
        const {count} = await SELECT `count` .from(NewReg,id)
        if(count == 0)
            req.warn("Bot Call not possible")
        else
            req.notify("Bot has been initiated")
        await UPDATE(NewReg).set({
            count : 3
        }).where({ID:`${id}`}).and({count:1})
    })

    this.on('submitCiad', async req=>{
        req.notify("Workflow has been initiated.")
    })

    //Documents upload for Assets
    this.on('uploadAssetDoc', async req=>{
        const {assetName,docurl} = req.data
        const n = await UPDATE(NewReg).set({
                    durl : docurl
                }).where({assetName: `${assetName}`})
        if(n > 0)
            req.notify(`Documents for Assets has been updated successfully`)
        else 
            req.error(401,`Asset is not recognised`)
    })

    this.on(`upAssetDoc`,async req=>{
        const id = req.params[0]
        let {docurl} = req.data
        const {assetName} = await SELECT `assetName` .from(NewReg,id)
        req.error(400, `Asset name ${assetName} and docurl ${docurl}`)
        const n = await UPDATE(NewReg).set({
            durl : docurl
        }).where({assetName: `${assetName}`})
        if(n > 0)
            req.notify(`Documents for assets has been updated successfully`)
        else
            req.error(401, `Update failure`)
    })

    //Documents Upload for Employee/Employer 
    this.on('uploadContactDoc', async req=>{
        const {empname,empurl} = req.data
        const n = await UPDATE(NewReg).set({
                    cdoc : empurl
                }).where({ename : `${empname}`})
        if(n > 0)
            req.notify(`Documents for Employer has been updated successfully`)
        else
            req.error(401,`Employer is not recognised`)
    })

    //Documents Upload for Entity
    this.on('uploadFirstEntityDoc',async req=>{
        const {entityName,entitydoc} = req.data
        const n = await UPDATE(NewReg).set({
                    entdoc : entitydoc
                }).where({enname : `${entityName}`})
        if(n > 0)
            req.notify(`Documents for First Entity has been updated successfully`)
        else
            req.error(401,`Entity is not recognised`)
    })

    //For Report incident
    this.on('reportIncident',async req=>{
        const id = req.params[0]
        const {desc, crit, stat, repby} = req.data
        /*const inc = [
            {cric : `${crit}`, description : `${desc}`, status: `${stat}`, reportedBy: `${repby}`, asset_ID :`${id}`}
        ]
        INSERT (inc). into(Incident)*/
        INSERT.into(Incident).entries({cric: crit,description: desc, status: stat, reportedBy: repby, asset_ID: id })      
    })

    /*this.on('reportIncident', async req=>{
        const increp = req.data
        const aName = increp.assetName
        const c = increp.criticality
        await UPDATE(NewReg,aName) .with(`critcality =`,c)
        req.notify("Asset has been reported")
    })*/

    this.on('createversion', async req =>{
        const id = req.params[0]
        let {version} = await SELECT `version`. from (NewReg,id)
        const {assetName} = await SELECT `assetName`. from(NewReg,id)
        const n = await UPDATE(NewReg).set({
            version : version+=1
        }).where({assetName : `${assetName}`})
        if (n>0)
            req.notify(400,`Version has been updated successfully`)
        else
            req.error(401,`Version update failed`)
    })
    return super.init();
}}

module.exports = {form};
