import SignIn from './components/SignIn.vue'
import Register from './components/Register.vue'

export const names = {
  signIn: 'authSignIn',
  register: 'authRegister'
}

export const routes = [
  { path: 'sign-in', component: SignIn, name: names.signIn },
  { path: 'register', component: Register, name: names.register }
]
