import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  // static targets = [vehicleSelect] esta era la opcion que proponía el video, hubo que buscar un plan "B"
  change(event) {
    let companyId = event.target.value;
    let target = this.targets.find("vehicleSelect").id // Este fue el plan "B", y se le pide el ID para que se lo podamos pasar en la URL de la linea 11.
    // let target = "entrance_company_vehicle_id"
    console.log(target)
    get(`/companies/vehicles?target=${target}&company=${companyId}`, {
      responseKind: "turbo-stream"
    })
  }
}
