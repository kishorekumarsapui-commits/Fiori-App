const cds = require('@sap/cds')

module.exports = class ProcessorService extends cds.ApplicationService { init() {

  const { Incidents, Customers } = cds.entities('ProcessorService')


  this.before (['CREATE', 'UPDATE'], Incidents, async (req) => {
    if(req.event == 'UPDATE'){
        console.log('Before Update Incidents', req.data)
    }else if(req.event == 'CREATE'){
        console.log('Before CREATE Incidents', req.data)
    } else{
      console.log('Before CREATE Incidents', req.data)
    }
  
  })
  this.after ('READ', Incidents, async (incidents, req) => {
    console.log('After READ Incidents', incidents)
  })
  this.before (['CREATE', 'UPDATE'], Customers, async (req) => {
    console.log('Before CREATE/UPDATE Customers', req.data)
  })
  this.after ('READ', Customers, async (customers, req) => {
    console.log('After READ Customers', customers)
  })


  return super.init()
}}
