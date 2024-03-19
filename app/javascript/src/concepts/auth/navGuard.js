import { names as routeNames } from '~/config/routes'
import useCurrentUser from './composables/currentUser.js'

export function navGuard (to, from) {
  let auth = { auth: true , ...to.meta }.auth

  if (auth === null || auth === undefined) {
    return true
  }

  const user = useCurrentUser()

  if (auth) {
    return !!user.value || { name: routeNames.auth.signIn }
  } else {
    return !user.value || { name: routeNames.root }
  }
}
