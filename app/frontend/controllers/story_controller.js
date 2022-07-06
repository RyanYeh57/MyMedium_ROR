import { Controller } from "stimulus"
import axios from 'axios'

export default class extends Controller {
static targets = [ "clapCount" ]

  addClap(event) {
    event.preventDefault
    let slug = event.currentTarget.dataset.slug

  axios.post(`/stories/${slug}/clap`) //不是單引號 
      .then(function(response){
        console.log(response.data)
        })
      .catch(function(error){
        console.log(error)
        })   
  }
}