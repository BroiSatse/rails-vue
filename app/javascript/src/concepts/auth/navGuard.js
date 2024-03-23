import { watch } from 'vue'
import router from "~/config/router";
import { names as routes } from "~/config/routes";
import { currentUser } from './currentUser'

let interruptedNavigation = null

watch(currentUser, (user, previous) => {
  if (!previous && user) {
    router.push(interruptedNavigation ? { path: interruptedNavigation } : { name: routes.root })
    interruptedNavigation = null
  }

  if (previous && !user) {
    router.push({ name: routes.auth.signIn })
  }
})

export function navGuard (to) {
  let auth = { auth: true , ...to.meta }.auth

  if (auth === null || auth === undefined) {
    return true
  }

  if (auth) {
    if (currentUser.value) { return true }
    interruptedNavigation = to.fullPath
    return { name: routes.auth.signIn }
  } else {
    return !currentUser.value || { name: routes.root }
  }
}
