import { ref } from "vue";
import api from '~/api'

export const currentUser = ref(null)

export async function refreshCurrentUser () {
  const data = await api.authControllersSessions.show()
  console.log(data)
  currentUser.value = data
}
