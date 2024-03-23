import { names as routes } from "~/config/routes";
import { currentUser } from '~/concepts/auth'

export function navGuard (to) {
  // Only allow navigation to verification page when there is an email to verify
  if (to.name === routes.users.verify) {
    return !!currentUser.value.unverifiedEmail || { name: routes.root }
  }

  // when user is signed in, but has no verified email address
  if (currentUser.value && !currentUser.value.email && currentUser.value.unverifiedEmail) {
    return { name: routes.users.verify }
  }

  return true
}
