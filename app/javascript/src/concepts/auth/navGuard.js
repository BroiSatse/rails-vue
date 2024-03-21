import { watch } from 'vue'
import { useRouter } from "vue-router";
import { names as routeNames } from '~/config/routes'
import { currentUser } from './currentUser'

let interruptedNavigation = null
const router = useRouter()

watch(currentUser, (current, old) => {
  console.log(current, old)
})

export function navGuard (to, from) {
  let auth = { auth: true , ...to.meta }.auth

  if (auth === null || auth === undefined) {
    return true
  }

  if (auth) {
    if (currentUser.value) { return true }
    interruptedNavigation = to.fullPath
    console.log(interruptedNavigation)
    return { name: routeNames.auth.signIn }
  } else {
    console.log('Non-auth!', currentUser.value)
    return !currentUser.value || { name: routeNames.root }
  }
}
