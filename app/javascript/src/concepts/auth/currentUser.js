import { ref } from "vue";
import api from '~/api'

export const currentUser = ref(null)

export async function refreshCurrentUser () {
  const data = await api.authControllersSessions.show()
  currentUser.value = data.currentUser
  console.log('Current user refresh', currentUser.value)
}

export async function signOut () {
  await api.authControllersSessions.destroy()
  currentUser.value = null
}
