import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  // static targets = [vehicleSelect] esta era la opcion que proponía el video, hubo que buscar un plan "B"
  change(event) {
    let companyName = event.target.selectedOptions[0].text; // esto me devuelve el Texto HTML del input.
    let target = this.targets.find("vehicleSelect").id; // Este fue el plan "B", y se le pide el ID para que se lo podamos pasar en la URL de la linea 11.
    let entrancesAndExitsMileage = document.getElementsByClassName("mileage_input");

    let companyId = event.target.value;
    get(`/companies/vehicles?target=${target}&company=${companyId}`, {
      responseKind: "turbo-stream"
    })

    if (companyName === 'Particular'){
      entrancesAndExitsMileage[0].style.display = "none";
      entrancesAndExitsMileage[0].getElementsByTagName("input")[0].value = 0;

      let invoiceInput = document.getElementById('exit_invoice');
      if (invoiceInput != null) {
        invoiceInput.style.display = "none";
        invoiceInput.value = "No aplica";
      };

    } else {
      entrancesAndExitsMileage[0].style.display = "block";
    }
  }
}
