import { ref } from "vue";

export default function useCurrentUser () {
  const user = ref(1)
  return user
}
