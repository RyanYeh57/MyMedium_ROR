import { Controller } from "stimulus"
import axios from 'axios'

export default class extends Controller {
static targets = [ "followButton", "bookmark" ]

  follow(event) {
    event.preventDefault()

    let user = this.followButtonTarget.dataset.user
    
    axios.post(`/api/users/#{user}/follow`)
         .then(function(response){
           let status = response.data.status
           switch (status) {
             case 'sign_in_first':
               alert('你必須先登入')
               break
             default:
               button.innerHTML = status
           }
         })
         .catch(function(error){
           console.log('error')
         })
  }

  bookmark(event) {
    event.preventDefault()

    let link = event.currentTarget
    let slug = link.dataset.slug
    
    axios.post(`/api/stories/${slug}/bookmark`)
         .then(function(response){
           switch (response.data.status){
            case 'Bookmarked':
              icon.addList.add('fas')
              icon.addList.remove('far')
              break;
            case 'Unbookmarked':
              icon.addList.add('far')
              icon.addList.remove('fas')
              break;

           }
         })
         .catch(function(error){
           console.log('error')
         }) 
  }

}